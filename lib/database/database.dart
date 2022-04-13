import 'package:atopa_app_flutter/models/alumno.dart';
import 'package:atopa_app_flutter/models/clase.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBProvider {
  static final DBProvider instancia = DBProvider._init();
  static Database? _database;

  DBProvider._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('atopa.db');
    return _database!;
  }

  Future<Database> _initDB(String filepath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filepath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = 'INTEGER NOT NULL';

    await db.execute('''
CREATE TABLE $tableAlumnos(
  ${AlumnoFields.id} $idType,
  ${AlumnoFields.nombre} $textType,
  ${AlumnoFields.apellido} $textType,
  ${AlumnoFields.alias} $textType,
  ${AlumnoFields.clase_id} $textType,
  ${AlumnoFields.dni} $textType,
  ${AlumnoFields.fechaNacimiento} $textType,
  ${AlumnoFields.sex} $textType
  )
  ''');

    await db.execute('''
CREATE TABLE $tableClase(
  ${ClaseFields.id} $idType,
  ${ClaseFields.nombre} $textType,
  ${ClaseFields.grupo_edad} $textType,
  ${ClaseFields.profesor} $textType,
  ${ClaseFields.year} $textType
)
''');
  }

  Future<Alumno> createAlumno(Alumno alumno) async {
    final db = await instancia.database;
    final id = await db.insert(tableAlumnos, alumno.toJson());
    return alumno.copy(id: id);
  }

  Future<Clase> createClase(Clase clase) async {
    final db = await instancia.database;
    final id = await db.insert(tableClase, clase.toJson());
    return clase.copy(id: id);
  }

  Future<Alumno> readOneAlumno(int id) async {
    final db = await instancia.database;
    final maps = await db.query(tableAlumnos,
        columns: AlumnoFields.values,
        where: '${AlumnoFields.id} = ?',
        whereArgs: [id]);

    if (maps.isNotEmpty) {
      return Alumno.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<List<Alumno>> readAllAlumnos() async {
    final db = await instancia.database;
    final res = await db.query(tableAlumnos);
    return res.map((e) => Alumno.fromJson(e)).toList();
  }

  Future<List<Clase>> readAllClases() async {
    final db = await instancia.database;
    final res = await db.query(tableClase);
    return res.map((e) => Clase.fromJson(e)).toList();
  }

  Future<int> update(Alumno alumno) async {
    final db = await instancia.database;
    return db.update(tableAlumnos, alumno.toJson(),
        where: '${AlumnoFields.id} = ?', whereArgs: [alumno.id]);
  }

  Future<List<Alumno>> readAlumnosByClass(String clase) async {
    final db = await instancia.database;
    final res = await db.query(tableAlumnos,
        where: '${AlumnoFields.clase_id} = ?', whereArgs: [clase]);
    if (res.isNotEmpty) {
      return res.map((e) => Alumno.fromJson(e)).toList();
    } else {
      throw Exception('No hay alumnos con esa clase');
    }
  }

  Future close() async {
    final db = await instancia.database;
    db.close();
  }
}
