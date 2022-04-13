import 'dart:io';
import 'dart:convert';
import 'package:atopa_app_flutter/database/database.dart';
import 'package:atopa_app_flutter/models/alumno.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:csv/csv.dart';
import 'package:open_file/open_file.dart';

class StudentScreen extends StatefulWidget {
  const StudentScreen({Key? key}) : super(key: key);

  @override
  State<StudentScreen> createState() => _StudentScreenState();
}

class _StudentScreenState extends State<StudentScreen> {
  late List<Alumno> alumnosLate = [];
  late List<Alumno> alumnosLateClase = [];
  late String clase;

  @override
  void initState() {
    super.initState();
    refreshAlumnos();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future refreshAlumnos() async {
    this.alumnosLate = await DBProvider.instancia.readAllAlumnos();
    print(this.alumnosLate);
    setState(() {});
  }

  Future alumnosClase() async {
    print('clase: ${clase}');
    this.alumnosLateClase =
        await DBProvider.instancia.readAlumnosByClass(clase);
    alumnosLate.forEach((element) {
      print(element.toJson());
    });
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final args = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    clase = args['clase'];

    return Scaffold(
      appBar: AppBar(
        title: Text(clase),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const _CustomIconButton(
                  icono: Icons.remove_red_eye_rounded,
                ),
                IconButton(
                    iconSize: 30,
                    padding: const EdgeInsets.all(1),
                    onPressed: () async {
                      FilePickerResult? result = await FilePicker.platform
                          .pickFiles(
                              type: FileType.custom,
                              allowedExtensions: ['csv']);
                      if (result != null) {
                        PlatformFile file = result.files.first;
                        File archivo = File(file.path!);
                        archivo
                            .openRead()
                            .transform(utf8.decoder)
                            .transform(CsvToListConverter())
                            .toList()
                            .then((value) async {
                          int index = 0;
                          value.forEach((e) {
                            if (index != 0) {
                              final Alumno al = Alumno(
                                  nombre: e[0],
                                  apellido: e[1] + ' ' + e[2],
                                  alias: '',
                                  clase_id: clase,
                                  dni: e[3],
                                  fechaNacimiento: e[4],
                                  sex: e[5]);
                              print(al.toJson());
                              DBProvider.instancia.createAlumno(al);
                              refreshAlumnos();
                            }
                            index++;
                          });
                        });
                      }
                    },
                    icon: const Icon(Icons.file_present_rounded)),
                IconButton(
                    iconSize: 30,
                    padding: const EdgeInsets.all(1),
                    onPressed: () {
                      Navigator.pushNamed(context, 'new-student');
                    },
                    icon: const Icon(Icons.add)),
                const _CustomIconButton(icono: Icons.edit),
                const _CustomIconButton(
                  icono: Icons.remove_circle_sharp,
                ),
              ],
            ),
            this.alumnosLate.isEmpty
                ? Center(child: Text('no hay Alumnos todavia'))
                : ListView.separated(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(8),
                    itemBuilder: (context, index) => ListTile(
                          title: Text(
                            alumnosLate[index].nombre,
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          onTap: () {
                            print(alumnosLate[index].toJson());
                          },
                          trailing: const Icon(
                            Icons.arrow_forward_rounded,
                            color: Color.fromRGBO(13, 96, 254, 1),
                          ),
                        ),
                    separatorBuilder: (_, __) => const Divider(),
                    itemCount: alumnosLate.length),
          ],
        ),
      ),
    );
  }
}

class _CustomIconButton extends StatelessWidget {
  final IconData icono;
  const _CustomIconButton({
    Key? key,
    required this.icono,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        iconSize: 30,
        padding: const EdgeInsets.all(1),
        onPressed: () {},
        icon: Icon(icono));
  }
}
