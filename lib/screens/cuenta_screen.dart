import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../widgets/widgets.dart';

class CuentaScreen extends StatelessWidget {
  const CuentaScreen({Key? key}) : super(key: key);

  cambiando(String value) {
    print(value);
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Cambio de contraseña',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                  'Por favor, ${user.email}, introduzca su contraseña antigua, por seguridad, y despues introduzca la nueva contraseña dos veces para verificar que la ha escrito correctamente: '),
            ),
            Form(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const SizedBox(height: 5),
                  CustomInputField(
                    hintText: '',
                    labelText: 'Contraseña antigua',
                    helperText: '',
                    password: true,
                    callback: cambiando,
                  ),
                  const SizedBox(height: 5),
                  CustomInputField(
                    hintText: '',
                    labelText: 'Contraseña nueva',
                    helperText: '',
                    password: true,
                    callback: cambiando,
                  ),
                  const SizedBox(height: 5),
                  CustomInputField(
                    hintText: '',
                    labelText: 'Contraseña nueva (confirmacion)',
                    helperText: '',
                    password: true,
                    callback: cambiando,
                  ),
                  Center(
                    child: Row(
                      children: [
                        ElevatedButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text('Siguiente')),
                        SizedBox(
                          width: 10,
                        ),
                        ElevatedButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text('Cancelar')),
                      ],
                    ),
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
