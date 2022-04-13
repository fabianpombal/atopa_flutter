final String tableClase = 'clase';

class ClaseFields {
  static final List<String> values = [id, nombre, grupo_edad, profesor, year];
  static final String id = '_id';
  static final String nombre = 'nombre';
  static final String grupo_edad = 'grupo_edad';
  static final String profesor = 'profesor';
  static final String year = 'year';
}

class Clase {
  Clase({
    this.id,
    required this.nombre,
    required this.grupoEdad,
    required this.profesor,
    required this.year,
  });

  int? id;
  String nombre;
  String grupoEdad;
  String profesor;
  String year;

  factory Clase.fromJson(Map<String, dynamic> json) => Clase(
        id: json["id"],
        nombre: json["nombre"],
        grupoEdad: json["grupo_edad"],
        profesor: json["profesor"],
        year: json["year"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "grupo_edad": grupoEdad,
        "profesor": profesor,
        "year": year,
      };
  Clase copy({
    int? id,
    String? nombre,
    String? grupoEdad,
    String? profesor,
    String? year,
  }) =>
      Clase(
        id: id ?? this.id,
        nombre: nombre ?? this.nombre,
        grupoEdad: grupoEdad ?? this.grupoEdad,
        profesor: profesor ?? this.profesor,
        year: year ?? this.year,
      );
}
