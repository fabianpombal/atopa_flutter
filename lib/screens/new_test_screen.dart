import 'package:flutter/material.dart';

class NewTestScreen extends StatelessWidget {
  const NewTestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nuevo cuestionario')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Percepcion de grupo positiva:',
                  style: TextStyle(fontSize: 14),
                ),
                DropdownButtonFormField(
                    items: [
                      DropdownMenuItem(
                        child: Text(
                            "Compañer@s con que seguirias el año que viene"),
                        value: "1",
                      ),
                      DropdownMenuItem(
                        child: Text("Compañer@s para jugar en el recreo"),
                        value: "2",
                      ),
                      DropdownMenuItem(
                        child: Text("Compañer@s que echarias de menos"),
                        value: "3",
                      ),
                      DropdownMenuItem(
                        child: Text("Compañer@s para sentarte en el aula"),
                        value: "4",
                      ),
                    ],
                    onChanged: (value) {
                      print(value);
                    }),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Percepcion de grupo negativa:',
                  style: TextStyle(fontSize: 14),
                ),
                DropdownButtonFormField(
                    items: [
                      DropdownMenuItem(
                        child: Text(
                            "Compañer@s con que seguirias el año que viene"),
                        value: "1",
                      ),
                      DropdownMenuItem(
                        child: Text("Compañer@s para jugar en el recreo"),
                        value: "2",
                      ),
                      DropdownMenuItem(
                        child: Text("Compañer@s que echarias de menos"),
                        value: "3",
                      ),
                      DropdownMenuItem(
                        child: Text("Compañer@s para sentarte en el aula"),
                        value: "4",
                      ),
                    ],
                    onChanged: (value) {
                      print(value);
                    }),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Percepcion propia positiva:',
                  style: TextStyle(fontSize: 14),
                ),
                DropdownButtonFormField(
                    items: [
                      DropdownMenuItem(
                        child: Text(
                            "Compañer@s con que seguirias el año que viene"),
                        value: "1",
                      ),
                      DropdownMenuItem(
                        child: Text("Compañer@s para jugar en el recreo"),
                        value: "2",
                      ),
                      DropdownMenuItem(
                        child: Text("Compañer@s que echarias de menos"),
                        value: "3",
                      ),
                      DropdownMenuItem(
                        child: Text("Compañer@s para sentarte en el aula"),
                        value: "4",
                      ),
                    ],
                    onChanged: (value) {
                      print(value);
                    }),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Percepcion propia negativa:',
                  style: TextStyle(fontSize: 14),
                ),
                DropdownButtonFormField(
                    items: [
                      DropdownMenuItem(
                        child: Text(
                            "Compañer@s con que seguirias el año que viene"),
                        value: "1",
                      ),
                      DropdownMenuItem(
                        child: Text("Compañer@s para jugar en el recreo"),
                        value: "2",
                      ),
                      DropdownMenuItem(
                        child: Text("Compañer@s que echarias de menos"),
                        value: "3",
                      ),
                      DropdownMenuItem(
                        child: Text("Compañer@s para sentarte en el aula"),
                        value: "4",
                      ),
                    ],
                    onChanged: (value) {
                      print(value);
                    }),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Asociacion de atributos positiva:',
                  style: TextStyle(fontSize: 14),
                ),
                DropdownButtonFormField(
                    items: [
                      DropdownMenuItem(
                        child: Text(
                            "Compañer@s con que seguirias el año que viene"),
                        value: "1",
                      ),
                      DropdownMenuItem(
                        child: Text("Compañer@s para jugar en el recreo"),
                        value: "2",
                      ),
                      DropdownMenuItem(
                        child: Text("Compañer@s que echarias de menos"),
                        value: "3",
                      ),
                      DropdownMenuItem(
                        child: Text("Compañer@s para sentarte en el aula"),
                        value: "4",
                      ),
                    ],
                    onChanged: (value) {
                      print(value);
                    }),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Asociacion de atributos negativa:',
                  style: TextStyle(fontSize: 14),
                ),
                DropdownButtonFormField(
                    elevation: 0,
                    items: [
                      DropdownMenuItem(
                        child: Text(
                            "Compañer@s con que seguirias el año que viene"),
                        value: "1",
                      ),
                      DropdownMenuItem(
                        child: Text("Compañer@s para jugar en el recreo"),
                        value: "2",
                      ),
                      DropdownMenuItem(
                        child: Text("Compañer@s que echarias de menos"),
                        value: "3",
                      ),
                      DropdownMenuItem(
                        child: Text("Compañer@s para sentarte en el aula"),
                        value: "4",
                      ),
                    ],
                    onChanged: (value) {
                      print(value);
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
