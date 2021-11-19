import 'package:flutter_application_1/personas.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DB {
  static Future<Database> _openDB() async {
    return openDatabase(join(await getDatabasesPath(), 'persona.db'),
        onCreate: (db, version) {
      return db.execute(
        "CREATE TABLE personas (id INTEGER PRIMARY KEY, nombre TEXT, especie TEXT)",
      );
    }, version: 1);
  }

  Future<dynamic> insert(Persona persona) async {
    Database database = await _openDB();

    return database.insert("personas", persona.toMap());
  }

  static Future<dynamic> delete(Persona persona) async {
    Database database = await _openDB();
    return database.delete("Persona", where: "id = ?", whereArgs: [persona.id]);
  }

  static Future<dynamic> update(Persona persona) async {
    Database database = await _openDB();

    return database.update("Persona", persona.toMap(),
        where: "id=?", whereArgs: [persona.id]);
  }

  static Future<List<Persona>> persona() async {
    Database database = await _openDB();
    final List<Map<String, dynamic>> personasMap =
        await database.query("Personas");

    return List.generate(
        personasMap.length,
        (i) => Persona(
            id: personasMap[i]["id"],
            nombre: personasMap[i]["nombre"],
            edad: personasMap[i]["edad"]));
  }

  static Future<dynamic> insertar2(Persona persona) async {
    Database database = await _openDB();
    var resultado =
        await database.rawInsert("INSERT IN personas(id,nombre,edad)"
            "VALUES(${persona.id},${persona.nombre},${persona.edad})");
  }
}
