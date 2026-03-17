import 'package:flutter/material.dart';
import 'package:varadvani/theme/color_code.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color(ColorCode.scaffoldBackground),
      child: Column(
        children: [
          DrawerHeader(
            child: Image.asset(
              width: 300,
              'assets/image/dasganu_logo.png',
              //fit: BoxFit.fitWidth,
            ),
          ),
        ],
      ),
    );
  }
}
