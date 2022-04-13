import 'package:atopa_app_flutter/database/database.dart';
import 'package:atopa_app_flutter/models/alumno.dart';
import 'package:atopa_app_flutter/providers/alumnos.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/widgets.dart';

class StudentFormScreen extends StatelessWidget {
  const StudentFormScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final alumnosFormProv = Provider.of<AlumnosProvider>(context);
    final GlobalKey<FormState> myFormKey = GlobalKey<FormState>();
    final hintText = 'hintText';
    final helperText = 'helperText';
    final labelText = 'labelText';
    alumnosFormProv.nuevoAlumno = Alumno(
        nombre: alumnosFormProv.nombre,
        apellido: alumnosFormProv.apellidos,
        alias: alumnosFormProv.alias,
        clase_id: 'aux',
        dni: alumnosFormProv.dni,
        fechaNacimiento: alumnosFormProv.fechaNacimiento,
        sex: alumnosFormProv.sex);

    cambaindo(String value) {
      print(value);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Crear nuevo estudiante'),
      ),
      body: Center(
        child: Form(
          key: alumnosFormProv.formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  CustomInputField(
                    hintText: 'Fabian',
                    labelText: 'Nombre',
                    helperText: 'Obligatorio',
                    callback: alumnosFormProv.cambiarNombre,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomInputField(
                    hintText: 'Pombal Martinez',
                    labelText: 'Apellidos',
                    helperText: 'Obligatorio',
                    callback: alumnosFormProv.cambiarApellidos,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomInputField(
                    hintText: 'Fulanito',
                    labelText: 'Alias',
                    helperText: '',
                    callback: alumnosFormProv.cambiarAlias,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomInputField(
                    hintText: '12345678Y',
                    labelText: 'DNI',
                    helperText: '',
                    callback: alumnosFormProv.CambiarDni,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomInputField(
                    hintText: '22/12/1999',
                    labelText: 'Fecha de nacimiento',
                    helperText: 'Obligatorio',
                    inputType: TextInputType.datetime,
                    callback: alumnosFormProv.cambiarFechaNacimiento,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  DropdownButtonFormField(
                      value: 'null',
                      items: const [
                        DropdownMenuItem(child: Text('Sexo'), value: 'null'),
                        DropdownMenuItem(
                            child: Text('Hombre'), value: 'Hombre'),
                        DropdownMenuItem(child: Text('Mujer'), value: 'Mujer'),
                        DropdownMenuItem(
                            child: Text('Prefiere no decirlo'), value: 'none'),
                      ],
                      onChanged: (value) {
                        print(value);
                        alumnosFormProv.sex = value.toString();
                      }),
                  ElevatedButton(
                      onPressed: () {
                        print(alumnosFormProv.nuevoAlumno!.toJson());
                        DBProvider.instancia
                            .createAlumno(alumnosFormProv.nuevoAlumno!);
                        Navigator.pop(context);
                      },
                      child: const Text('Guardar'))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
