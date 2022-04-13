import 'package:atopa_app_flutter/providers/alumnos.dart';
import 'package:atopa_app_flutter/providers/bm_navbar_provider.dart';
import 'package:atopa_app_flutter/themes/custom_theme.dart';
import 'package:flutter/material.dart';
import './screens/screens.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static const String atopaPdd = 'https://www.atopa.es/pdd.html';
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => BmNavbarProvider()),
        ChangeNotifierProvider(
          create: (context) => AlumnosProvider(),
        )
      ],
      child: MaterialApp(
        title: 'Material App',
        debugShowCheckedModeBanner: false,
        theme: CustomTheme.lightTheme,
        home: Scaffold(
          appBar: AppBar(
            title: const Text('ATOPA'),
            backgroundColor: const Color.fromRGBO(13, 96, 254, 1),
          ),
          body: const Center(
            child: Text('Hello World'),
          ),
        ),
        initialRoute: 'menu',
        routes: {
          'sign-in': (_) => const SignInScreen(),
          'sign-up': (_) => const SignUpScreen(),
          'menu': (_) => const MenuScreen(),
          'years': (_) => const AcademyYearScreen(),
          'pass-recovery': (_) => const PassRecoveryScreen(),
          'tests': (_) => const TestsScreen(),
          'classes': (_) => const ClassScreen(),
          'micuenta': (_) => const CuentaScreen(),
          'students': (_) => const StudentScreen(),
          'new-student': (_) => const StudentFormScreen(),
          'new-test': (_) => const NewTestScreen(),
          'current-test': (_) => const CurrentTestScreen()
        },
      ),
    );
  }
}
