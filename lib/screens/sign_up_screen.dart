import 'package:atopa_app_flutter/screens/screens.dart';
import 'package:atopa_app_flutter/themes/input_decorations.dart';
import 'package:atopa_app_flutter/widgets/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('ATOPA'),
          backgroundColor: const Color.fromRGBO(13, 96, 254, 1),
          actions: [
            IconButton(
                onPressed: () => FirebaseAuth.instance.signOut(),
                icon: Icon(Icons.logout))
          ],
        ),
        body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return MenuScreen();
            } else {
              return SignUpPage();
            }
          },
        ));
  }
}

class SignUpPage extends StatelessWidget {
  const SignUpPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                'Registrate',
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
            onPressed: () {
              Navigator.pushReplacementNamed(context, 'sign-in');
            },
            child: const Text('Ya tienes cuenta? Inicia Sesion')),
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
    );
  }
}

class _SignForm extends StatelessWidget {
  const _SignForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> myFormKey = GlobalKey<FormState>();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final passwordController2 = TextEditingController();
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
                  hint: 'profesor@dominio.com',
                  label: 'Email',
                  icono: Icons.person),
            ),
            TextFormField(
              autocorrect: false,
              obscureText: true,
              controller: passwordController,
              keyboardType: TextInputType.text,
              decoration: InputDecorations.authInputDecoration(
                  hint: '', label: 'Contraseña', icono: Icons.password),
            ),
            TextFormField(
              autocorrect: false,
              obscureText: true,
              controller: passwordController2,
              keyboardType: TextInputType.text,
              decoration: InputDecorations.authInputDecoration(
                hint: '',
                label: 'Confirma contraseña',
                icono: Icons.password,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            ElevatedButton(
                onPressed: () async {
                  print(
                      "${emailController.text.trim()} y ${passwordController.text.trim()}");
                  try {
                    await FirebaseAuth.instance.createUserWithEmailAndPassword(
                        email: emailController.text.trim(),
                        password: passwordController.text.trim());
                  } on FirebaseAuthException {}
                },
                child: Text('Registrate'))
          ],
        ));
  }
}
