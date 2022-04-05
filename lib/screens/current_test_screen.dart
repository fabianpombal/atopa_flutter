import 'package:flutter/material.dart';

class CurrentTestScreen extends StatelessWidget {
  const CurrentTestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    final test = args['test'];
    return Scaffold(
      appBar: AppBar(
        title: Text(test),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'Percepcion de grupo positiva:',
            style: TextStyle(fontSize: 14),
          ),
          SizedBox(
            width: 20,
            height: 20,
          ),
          Text(
            'Percepcion de grupo negativa:',
            style: TextStyle(fontSize: 14),
          ),
          SizedBox(
            width: 20,
            height: 20,
          ),
          Text(
            'Percepcion propia positiva:',
            style: TextStyle(fontSize: 14),
          ),
          SizedBox(
            width: 20,
            height: 20,
          ),
          Text(
            'Percepcion propia negativa:',
            style: TextStyle(fontSize: 14),
          ),
          SizedBox(
            width: 20,
            height: 20,
          ),
          Text(
            'Asociacion de atributos positiva:',
            style: TextStyle(fontSize: 14),
          ),
          SizedBox(
            width: 20,
            height: 20,
          ),
          Text(
            'Asociacion de atributos negativa:',
            style: TextStyle(fontSize: 14),
          )
        ],
      ),
    );
  }
}
