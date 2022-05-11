import 'package:atopa_app_flutter/providers/bm_navbar_provider.dart';
import 'package:atopa_app_flutter/screens/screens.dart';
import 'package:atopa_app_flutter/widgets/custom_bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
      onPrimary: Colors.black87,
      primary: Color.fromRGBO(13, 96, 254, 1),
      minimumSize: Size(88, 36),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
    );
    return Scaffold(
      body: _HomeBody(),
      bottomNavigationBar: const CustomBottomNavBar(),
    );
  }
}

class _HomeBody extends StatelessWidget {
  const _HomeBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bmNavbarProvider = Provider.of<BmNavbarProvider>(context);
    final int index = bmNavbarProvider.currentIndex;
    switch (index) {
      case 1:
        return TestsScreen();
      case 2:
        return CuentaScreen();
      default:
        return ClassScreen();
    }
  }
}
