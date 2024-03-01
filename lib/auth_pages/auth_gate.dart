import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_app/auth_pages/login_page.dart';
import 'package:to_do_list_app/auth_pages/name_gate.dart';
import 'package:to_do_list_app/auth_pages/register_page.dart';

class AuthGate extends StatelessWidget {
  final bool isRegister;
  const AuthGate({Key? key, required this.isRegister})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();

    if (firebaseUser != null) {
      return const NameGate();
    }
    if (isRegister == false) {
      return const LoginPage();
    } else {
      return const RegisterPage();
    }
  }
}
