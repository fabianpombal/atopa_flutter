import 'package:flutter/material.dart';
import '../widgets/widgets.dart';

class StudentFormScreen extends StatelessWidget {
  const StudentFormScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> myFormKey = GlobalKey<FormState>();
    final Map<String, String> formValues = {
      'nombre': 'fabian',
      'apellidos': 'pombal martinez',
      'alias': 'fulanito',
      'dni': '77015086T',
      'fecha': '22/12/1999'
    };
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crear nuevo estudiante'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: [
                const CustomInputField(
                  hintText: 'Fabian',
                  labelText: 'Nombre',
                  helperText: 'Obligatorio',
                ),
                const SizedBox(
                  height: 20,
                ),
                const CustomInputField(
                  hintText: 'Pombal Martinez',
                  labelText: 'Apellidos',
                  helperText: 'Obligatorio',
                ),
                const SizedBox(
                  height: 20,
                ),
                const CustomInputField(
                  hintText: 'Fulanito',
                  labelText: 'Alias',
                  helperText: '',
                ),
                const SizedBox(
                  height: 20,
                ),
                const CustomInputField(
                  hintText: '12345678Y',
                  labelText: 'DNI',
                  helperText: '',
                ),
                const SizedBox(
                  height: 20,
                ),
                const CustomInputField(
                  hintText: '22/12/1999',
                  labelText: 'Fecha de nacimiento',
                  helperText: 'Obligatorio',
                  inputType: TextInputType.datetime,
                ),
                const SizedBox(
                  height: 20,
                ),
                DropdownButtonFormField(
                    value: 'none1',
                    items: const [
                      DropdownMenuItem(child: Text('Sexo'), value: 'none1'),
                      DropdownMenuItem(child: Text('Hombre'), value: 'Hombre'),
                      DropdownMenuItem(child: Text('Mujer'), value: 'Mujer'),
                      DropdownMenuItem(
                          child: Text('Prefiere no decirlo'), value: 'none'),
                    ],
                    onChanged: (value) {
                      print(value);
                    }),
                ElevatedButton(
                    onPressed: () {
                      print(formValues);
                    },
                    child: const Text('Guardar'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
