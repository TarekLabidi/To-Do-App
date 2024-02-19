import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:to_do_list_app/auth_pages/auth_gate.dart';
import 'package:to_do_list_app/welcome_pages/first_welcome_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
