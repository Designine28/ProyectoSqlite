class Persona {
  int? id;
  String? nombre;
  int? edad;

  Persona({this.id, this.nombre, this.edad});

  Map<String, dynamic> toMap() {
    return {'id': id, 'nombre': nombre, 'edad': edad};
  }
}
