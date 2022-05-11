import 'package:atopa_app_flutter/screens/screens.dart';
import 'package:atopa_app_flutter/themes/input_decorations.dart';
import 'package:atopa_app_flutter/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

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
              return LogInPage();
            }
          },
        ));
  }
}

class LogInPage extends StatelessWidget {
  const LogInPage({
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
            onPressed: () {
              Navigator.pushReplacementNamed(context, 'sign-up');
            },
            child: const Text('No tienes cuenta? Registrate')),
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
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
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
            TextFormField(
              autocorrect: false,
              obscureText: true,
              controller: passwordController,
              keyboardType: TextInputType.text,
              decoration: InputDecorations.authInputDecoration(
                  hint: '', label: 'Contraseña', icono: Icons.password),
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
                    await FirebaseAuth.instance.signInWithEmailAndPassword(
                        email: emailController.text.trim(),
                        password: passwordController.text.trim());
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
