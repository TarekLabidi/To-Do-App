import 'package:flutter/material.dart';

class TextFieldE extends StatefulWidget {
  final String hinttext;
  final bool isObscure;
  final bool isPassword;
  final ValueChanged? changeObscure;
  final TextEditingController controller;
  const TextFieldE(
      {super.key,
      required this.hinttext,
      required this.isObscure,
      required this.changeObscure,
      required this.isPassword,
      required this.controller});

  @override
  State<TextFieldE> createState() => _TextFieldEState();
}

class _TextFieldEState extends State<TextFieldE> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 2.0, top: 12, right: 4),
      child: SizedBox(
        height: 55,
        child: TextField(
          controller: widget.controller,
          textAlignVertical: TextAlignVertical.center,
          style: const TextStyle(fontSize: 18),
          obscureText: widget.isObscure,
          decoration: InputDecoration(
            suffixIcon: (widget.isPassword == true)
                ? IconButton(
                    onPressed: () {
                      widget.changeObscure!(true);
                    },
                    icon: const Icon(
                      Icons.remove_red_eye,
                      color: Colors.grey,
                    ))
                : const SizedBox.shrink(),
            hintText: widget.hinttext,
            hintStyle: const TextStyle(
                color: Colors.grey, fontWeight: FontWeight.w400),
            border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                  color: Color.fromARGB(255, 213, 209, 209), width: 1.5),
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                  color: Color.fromARGB(255, 213, 209, 209), width: 1.5),
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
