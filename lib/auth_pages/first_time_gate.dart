import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:to_do_list_app/auth_pages/auth_gate.dart';
import 'package:to_do_list_app/welcome_pages/first_welcome_page.dart';

class FirstTimeGate extends StatefulWidget {
  const FirstTimeGate({super.key});

  @override
  State<FirstTimeGate> createState() => _MyHomFirstTimeGate();
}

class _MyHomFirstTimeGate extends State<FirstTimeGate> {
  final _myBox = Hive.box("todo");

  @override
  Widget build(BuildContext context) {
    return (_myBox.get('firstTime') == null)
        ? const FirstWelcomePage()
        : const AuthGate(
            isRegister: false,
          );
  }
}
