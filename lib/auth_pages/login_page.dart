import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_list_app/auth_pages/register_page.dart';
import 'package:to_do_list_app/components/login_register_buttom.dart';
import 'package:to_do_list_app/components/text_field.dart';
import 'package:to_do_list_app/services/auth/auth_methods.dart';
import 'package:to_do_list_app/utils/palette.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isObscure = true;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final AuthMethods _auth = AuthMethods();

  void loginUser() {
    _auth.loginWithEmailAndPassword(
      context,
      emailController.text,
      passwordController.text,
    );
  }

  void googleSignIn() {
    _auth.signInWithGoogle(context);
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: height / 3),
            Text(
              'Login',
              style:
                  GoogleFonts.lato(fontWeight: FontWeight.w800, fontSize: 36),
            ),
            SizedBox(height: height / 48),
            Text(
              'Welcome back to the app',
              style: GoogleFonts.lato(
                fontWeight: FontWeight.w800,
                fontSize: 18,
                color: const Color.fromARGB(255, 142, 140, 140),
              ),
            ),
            SizedBox(height: height / 10),
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
              isObscure: isObscure,
              changeObscure: (value) {
                setState(() {
                  isObscure = !isObscure;
                });
              },
              isPassword: true,
              controller: passwordController,
            ),
            SizedBox(height: height / 8),
            LoginRegisterButton(title: 'Login', onPressed: loginUser),
            SizedBox(height: height / 16),
            const Center(
              child: Text(
                'or sign in with',
                style: TextStyle(
                    color: Color.fromARGB(255, 142, 140, 140), fontSize: 17),
              ),
            ),
            SizedBox(height: height / 16),
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Container(
                  width: double.infinity,
                  color: const Color.fromARGB(255, 208, 211, 213),
                  child: TextButton(
                    onPressed: googleSignIn,
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/google_icon.png',
                            height: 35,
                            width: 35,
                          ),
                          const SizedBox(width: 5),
                          const Text(
                            'Continue With Google',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RegisterPage()));
              },
              child: const Center(
                child: Text.rich(
                  TextSpan(
                      text: 'You don\'t have an account? ',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.grey,
                      ),
                      children: [
                        TextSpan(
                          text: 'Register in here',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Palette.purpleColor),
                        ),
                      ]),
                ),
              ),
            ),
            SizedBox(
              height: height / 4.7,
            )
          ],
        ),
      ),
    );
  }
}
