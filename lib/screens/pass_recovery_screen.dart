import 'package:atopa_app_flutter/themes/input_decorations.dart';
import 'package:atopa_app_flutter/widgets/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PassRecoveryScreen extends StatelessWidget {
  const PassRecoveryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('ATOPA'),
          backgroundColor: const Color.fromRGBO(13, 96, 254, 1),
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            const Image(
              image: AssetImage('assets/topo.png'),
              height: 150,
            ),
            CardContainer(
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Log in',
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  const _SignForm(),
                ],
              ),
            ),
          ]),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        ));
  }
}

class _SignForm extends StatelessWidget {
  const _SignForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();

    final GlobalKey<FormState> myFormKey = GlobalKey<FormState>();

    return Form(
        key: myFormKey,
        child: Column(
          children: [
            TextFormField(
              autocorrect: false,
              obscureText: false,
              controller: emailController,
              keyboardType: TextInputType.name,
              decoration: InputDecorations.authInputDecoration(
                  hint: 'Profesor1',
                  label: 'Nombre de usuario',
                  icono: Icons.person),
            ),
            const SizedBox(
              height: 25,
            ),
            ElevatedButton(
                onPressed: () async {
                  showDialog(
                      context: context,
                      builder: (context) => Center(
                            child: CircularProgressIndicator(
                              color: Color.fromRGBO(13, 96, 254, 1),
                            ),
                          ),
                      barrierDismissible: false);
                  try {
                    await FirebaseAuth.instance.sendPasswordResetEmail(
                        email: emailController.text.trim());
                    SnackBar(content: Text('Yay! A SnackBar!'));
                  } on FirebaseAuthException catch (e) {
                    print(e);
                  }
                  Navigator.pop(context);
                },
                child: Text('Entrar'))
          ],
        ));
  }
}
