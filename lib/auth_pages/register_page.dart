import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_list_app/auth_pages/login_page.dart';
import 'package:to_do_list_app/components/login_register_buttom.dart';
import 'package:to_do_list_app/components/text_field.dart';
import 'package:to_do_list_app/services/auth_methods.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final AuthMethods _authgate = AuthMethods();

  void signUp() {
    _authgate.signUpWithEmail(
        emailController.text, passwordController.text, context);
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  bool isObscured = true;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: height / 9),
            Text(
              'Create an account',
              style: GoogleFonts.lato(
                  fontWeight: FontWeight.w800, fontSize: 36, letterSpacing: 1),
            ),
            SizedBox(height: height / 18),
            SizedBox(height: height / 18),
            Text(
              'Email Address',
              style: GoogleFonts.lato(
                  fontWeight: FontWeight.w800,
                  fontSize: 18,
                  color: Colors.black),
            ),
            TextFieldE(
              hinttext: 'hello@example.com',
              isObscure: false,
              changeObscure: (value) {},
              isPassword: false,
              controller: emailController,
            ),
            SizedBox(height: height / 18),
            Text(
              'Password',
              style: GoogleFonts.lato(
                  fontWeight: FontWeight.w800,
                  fontSize: 18,
                  color: Colors.black),
            ),
            TextFieldE(
              hinttext:
                  '\u2022\u2022\u2022\u2022\u2022\u2022\u2022\u2022\u2022\u2022',
              isObscure: isObscured,
              changeObscure: (value) {
                setState(() {
                  isObscured = !isObscured;
                });
              },
              isPassword: true,
              controller: passwordController,
            ),
            SizedBox(height: height / 16),
            LoginRegisterButton(
              title: 'Register',
              onPressed: signUp,
            ),
            SizedBox(height: height / 16),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginPage(),
                  ),
                );
              },
              child: const Center(
                child: Text.rich(
                  TextSpan(
                      text: 'Already have an account? ',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.grey,
                      ),
                      children: [
                        TextSpan(
                            text: 'Login in here',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Color.fromRGBO(95, 51, 225, 1.0),
                            ))
                      ]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
