final String tableAlumnos = 'alumnos';

class AlumnoFields {
  static final List<String> values = [
    id,
    nombre,
    apellido,
    alias,
    clase_id,
    dni,
    fechaNacimiento,
    sex
  ];

  static final String id = '_id';
  static final String nombre = 'nombre';
  static final String apellido = 'apellido';
  static final String alias = 'alias';
  static final String clase_id = 'clase_id';
  static final String dni = 'dni';
  static final String fechaNacimiento = 'fechaNacimiento';
  static final String sex = 'sex';
}

class Alumno {
  final int? id;
  final String nombre;
  final String apellido;
  final String alias;
  final String clase_id;
  final String dni;
  final String fechaNacimiento;
  final String sex;

  const Alumno(
      {this.id,
      required this.nombre,
      required this.apellido,
      required this.alias,
      required this.clase_id,
      required this.dni,
      required this.fechaNacimiento,
      required this.sex});

  static Alumno fromJson(Map<String, Object?> json) => Alumno(
      id: json[AlumnoFields.id] as int?,
      nombre: json[AlumnoFields.nombre] as String,
      apellido: json[AlumnoFields.apellido] as String,
      alias: json[AlumnoFields.alias] as String,
      clase_id: json[AlumnoFields.clase_id] as String,
      dni: json[AlumnoFields.dni] as String,
      fechaNacimiento: json[AlumnoFields.fechaNacimiento] as String,
      sex: json[AlumnoFields.sex] as String);

  Map<String, Object?> toJson() => {
        AlumnoFields.id: id,
        AlumnoFields.nombre: nombre,
        AlumnoFields.apellido: apellido,
        AlumnoFields.alias: alias,
        AlumnoFields.clase_id: clase_id,
        AlumnoFields.dni: dni,
        AlumnoFields.fechaNacimiento: fechaNacimiento,
        AlumnoFields.sex: sex
      };

  Alumno copy(
          {int? id,
          String? nombre,
          String? apellido,
          String? alias,
          String? clase_id,
          String? dni,
          String? fechaNacimiento,
          String? sex}) =>
      Alumno(
          id: id ?? this.id,
          nombre: nombre ?? this.nombre,
          apellido: apellido ?? this.apellido,
          alias: alias ?? this.alias,
          clase_id: clase_id ?? this.clase_id,
          dni: dni ?? this.dni,
          fechaNacimiento: fechaNacimiento ?? this.fechaNacimiento,
          sex: sex ?? this.sex);
}
