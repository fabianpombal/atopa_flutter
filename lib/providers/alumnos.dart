import 'package:flutter/material.dart';

import '../models/alumno.dart';

class AlumnosProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  Alumno? nuevoAlumno;

  String _nombre = '';
  String _apellidos = '';
  String _alias = '';
  String _dni = '';
  String _fechaNacimiento = '';
  String _sex = '';

  void cambiarNombre(String nombre) {
    _nombre = nombre;
    notifyListeners();
  }

  void cambiarApellidos(String apellidos) {
    _apellidos = apellidos;
    notifyListeners();
  }

  void cambiarAlias(String alias) {
    _alias = alias;
    notifyListeners();
  }

  void CambiarDni(String dni) {
    _dni = dni;
    notifyListeners();
  }

  void cambiarFechaNacimiento(String fecha) {
    _fechaNacimiento = fecha;
    notifyListeners();
  }

  void set sex(String sex) => _sex = sex;

  String get nombre => _nombre;
  String get apellidos => _apellidos;
  String get alias => _alias;
  String get dni => _dni;
  String get fechaNacimiento => _fechaNacimiento;
  String get sex => _sex;
}
