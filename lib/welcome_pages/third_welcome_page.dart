import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:to_do_list_app/auth_pages/auth_gate.dart';
import 'package:to_do_list_app/utils/palette.dart';

class ThirdWelcomePage extends StatelessWidget {
  const ThirdWelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final _myBox = Hive.box('todo');
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: height / 9),
          Image.asset(
            'assets/images/thirdwelcomepageimage.png',
            height: height / 2,
            fit: BoxFit.fitWidth,
          ),
          const Spacer(),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
              SizedBox(
                width: 5,
              ),
              CircleAvatar(
                radius: 6,
                backgroundColor: Colors.blue,
              )
            ],
          ),
          TextButton(
            onPressed: () {
              _myBox.put('firstTime', false);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AuthGate(isRegister: false),
                ),
              );
            },
            child: const Card(
              elevation: 15,
              margin: EdgeInsets.symmetric(horizontal: 60),
              color: Palette.purpleColor,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Log In',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: height / 60),
          TextButton(
            onPressed: () {
              _myBox.put('firstTime', false);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AuthGate(
                    isRegister: true,
                  ),
                ),
              );
            },
            child: const Text(
              'Resgister Now',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: height / 30),
        ],
      ),
    );
  }
}
