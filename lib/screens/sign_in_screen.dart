import 'package:atopa_app_flutter/themes/input_decorations.dart';
import 'package:atopa_app_flutter/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('ATOPA'),
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
            const SizedBox(
              height: 10,
            ),
            TextButton(
                onPressed: () async {
                  const url = 'https://www.atopa.es/pdd.html';
                  if (await canLaunch(url)) {
                    await launch(url, forceWebView: true);
                  }
                },
                child: const Text('Aviso Legal')),
            TextButton(
                onPressed: () async {
                  const url = 'https://www.atopa.es/contacto.html';
                  if (await canLaunch(url)) {
                    await launch(url, forceWebView: true);
                  }
                },
                child: const Text('Participa')),
            TextButton(
                onPressed: () async {
                  const url = 'https://www.atopa.es/agradecimientos.html';
                  if (await canLaunch(url)) {
                    await launch(url, forceWebView: true);
                  }
                },
                child: const Text('Agradecimientos'))
          ]),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        ));
  }
}

class _SignForm extends StatelessWidget {
  const _SignForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> myFormKey = GlobalKey<FormState>();
    final Map<String, String> formValues = {"usuario": 'pr', "password": 'pr'};
    return Form(
        key: myFormKey,
        child: Column(
          children: [
            TextFormField(
              autocorrect: false,
              obscureText: false,
              onChanged: (value) {
                formValues["usuario"] = value;
              },
              keyboardType: TextInputType.name,
              decoration: InputDecorations.authInputDecoration(
                  hint: 'Profesor1',
                  label: 'Nombre de usuario',
                  icono: Icons.person),
            ),
            TextFormField(
              autocorrect: false,
              obscureText: true,
              onChanged: (value) {
                formValues["password"] = value;
              },
              keyboardType: TextInputType.text,
              decoration: InputDecorations.authInputDecoration(
                  hint: '', label: 'Contraseña', icono: Icons.password),
            ),
            const SizedBox(
              height: 25,
            ),
            ElevatedButton(
                onPressed: () {
                  if (formValues["usuario"] == "prueba" &&
                      formValues["password"] == "123456") {
                    Navigator.pushReplacementNamed(context, 'menu');
                  }

                  print(formValues);
                },
                child: Text('Entrar'))
          ],
        ));
  }
}
