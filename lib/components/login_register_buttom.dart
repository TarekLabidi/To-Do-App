import 'package:flutter/material.dart';
import 'package:to_do_list_app/utils/palette.dart';

class LoginRegisterButton extends StatelessWidget {
  final String title;
  final void Function() onPressed;

  const LoginRegisterButton(
      {Key? key, required this.title, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Container(
          width: double.infinity,
          color: Palette.purpleColor,
          child: TextButton(
            onPressed: onPressed,
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Text(
                title,
                style: const TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
