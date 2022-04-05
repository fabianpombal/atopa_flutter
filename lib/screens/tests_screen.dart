import 'package:flutter/material.dart';

class TestsScreen extends StatelessWidget {
  const TestsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cuestionarios = [
      'Cuestionario 1',
      'Cuestionario 2',
      'Cuestionario 3'
    ];
    return Scaffold(
      //TODO: boton para new test

      body: Center(
        child: ListView.separated(
            padding: const EdgeInsets.all(8),
            itemBuilder: (context, index) => ListTile(
                  title: Text(
                    cuestionarios[index],
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  onTap: () {
                    print(cuestionarios[index]);
                    Navigator.pushNamed(context, 'current-test',
                        arguments: {'test': cuestionarios[index]});
                  },
                  trailing: const Icon(
                    Icons.arrow_forward_rounded,
                    color: Color.fromRGBO(13, 96, 254, 1),
                  ),
                ),
            separatorBuilder: (_, __) => const Divider(),
            itemCount: cuestionarios.length),
      ),
    );
  }
}
