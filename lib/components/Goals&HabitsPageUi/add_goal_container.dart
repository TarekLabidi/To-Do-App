import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddGoalContainer extends StatelessWidget {
  const AddGoalContainer(
      {super.key,
      required this.height,
      required this.title,
      required this.hintText,
      required this.controller,
      required this.maxLines});

  final double height;
  final String title;
  final TextEditingController controller;
  final String hintText;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: GoogleFonts.lato(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey)),
            SizedBox(
              height: height * 0.01,
            ),
            TextField(
              maxLines: maxLines,
              keyboardType:
                  TextInputType.multiline, // Enable multiline keyboard
              textInputAction:
                  TextInputAction.none, // Disable automatic capitalization
              textCapitalization: TextCapitalization.sentences,
              textAlignVertical: TextAlignVertical.center,
              style: GoogleFonts.roboto(fontSize: 20),
              controller: controller,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: const TextStyle(
                    color: Color.fromARGB(255, 139, 139, 139),
                    fontSize: 20,
                    fontWeight: FontWeight.w300),
                border: const OutlineInputBorder(),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
