import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';

class StudentScreen extends StatelessWidget {
  const StudentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    final clase = args['clase'];
    final alumnos = [
      'Ramon Perez',
      'Fabian Pombal',
      'Carlos Riobo',
      'Samuel Parada'
    ];
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
                              allowedExtensions: ['pdf']);
                      if (result == null)
                        return;
                      else {
                        final file = result.files.first;
                        OpenFile.open(file.path!);
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
            ListView.separated(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              padding: const EdgeInsets.all(8),
              itemBuilder: (context, index) => ListTile(
                title: Text(
                  alumnos[index],
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  print(alumnos[index]);
                },
                trailing: const Icon(
                  Icons.arrow_forward_rounded,
                  color: Color.fromRGBO(13, 96, 254, 1),
                ),
              ),
              separatorBuilder: (_, __) => const Divider(),
              itemCount: alumnos.length,
            ),
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
