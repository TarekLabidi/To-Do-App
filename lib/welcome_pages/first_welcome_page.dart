import 'package:flutter/material.dart';

import 'package:to_do_list_app/utils/palette.dart';
import 'package:to_do_list_app/welcome_pages/second_welcome_page.dart';

class FirstWelcomePage extends StatelessWidget {
  const FirstWelcomePage({super.key});

  final LinearGradient _gradient = const LinearGradient(colors: <Color>[
    Color.fromARGB(255, 209, 21, 242),
    Color.fromARGB(255, 220, 225, 70),
    Colors.red,
    Color.fromARGB(255, 14, 248, 22)
  ]);
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: height / 14),
          Image.asset(
            'assets/images/firstwelcomeimage.png',
          ),
          SizedBox(height: height / 40),
          ShaderMask(
            shaderCallback: (Rect rect) {
              return _gradient.createShader(rect);
            },
            child: const Text.rich(
              TextSpan(
                text: "Task Manegment & \n",
                style: TextStyle(
                  fontSize: 32,
                  color: Colors.white,
                  letterSpacing: 1.5,
                ),
                children: [
                  TextSpan(
                    text: '        To-Do App',
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: height / 40),
          const Text.rich(
            TextSpan(
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color.fromARGB(255, 120, 118, 118)),
                text: 'This productive tool is designed to help \n',
                children: [
                  TextSpan(text: '          you better manage your task\n'),
                  TextSpan(text: '             project-wise conveniently!\n')
                ]),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 6,
                backgroundColor: Colors.blue,
              ),
              SizedBox(
                width: 5,
              ),
              CircleAvatar(
                radius: 5,
                backgroundColor: Colors.grey,
              ),
              SizedBox(
                width: 5,
              ),
              CircleAvatar(
                radius: 5,
                backgroundColor: Colors.grey,
              ),
            ],
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const SecondWelcomePage()),
              );
            },
            child: Card(
              elevation: 15,
              color: Palette.purpleColor,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: width / 3,
                    ),
                    const Text(
                      'Next',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    SizedBox(
                      width: width / 3 - 20,
                    ),
                    const Icon(
                      Icons.double_arrow_rounded,
                      size: 30,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
