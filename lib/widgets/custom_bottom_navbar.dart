import 'package:atopa_app_flutter/providers/bm_navbar_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bmNavbarProvider = Provider.of<BmNavbarProvider>(context);

    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.person_rounded), label: 'Alumnos'),
        BottomNavigationBarItem(
            icon: Icon(Icons.question_answer_rounded), label: 'Cuestionarios'),
        BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_rounded), label: 'Cuenta')
      ],
      currentIndex: bmNavbarProvider.currentIndex,
      onTap: (value) {
        bmNavbarProvider.currentIndex = value;
      },
    );
  }
}
