import 'package:flutter/material.dart';

class ClassScreen extends StatelessWidget {
  const ClassScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final clases = ['Clase 1', 'Clase 2', 'Clase 3'];
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: ListView.separated(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            padding: const EdgeInsets.all(8),
            itemBuilder: (context, index) => ListTile(
              title: Text(
                clases[index],
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              onTap: () {
                print(clases[index]);
                Navigator.pushNamed(context, 'students',
                    arguments: {'clase': clases[index]});
              },
              trailing: const Icon(
                Icons.arrow_forward_rounded,
                color: Color.fromRGBO(13, 96, 254, 1),
              ),
            ),
            separatorBuilder: (_, __) => const Divider(),
            itemCount: clases.length,
          ),
        ),
      ),
    );
  }
}
