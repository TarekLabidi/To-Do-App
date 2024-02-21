import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_list_app/utils/palette.dart';
import 'package:to_do_list_app/utils/utils.dart';

class TasksCard extends StatefulWidget {
  const TasksCard({
    super.key,
    required this.height,
  });

  final double height;

  @override
  State<TasksCard> createState() => _TasksCardState();
}

class _TasksCardState extends State<TasksCard> {
  bool isDone = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: widget.height / 7.5,
      margin: const EdgeInsets.symmetric(horizontal: 30).copyWith(bottom: 20),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Color.fromARGB(255, 245, 245, 245),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  'Learing Flutter',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 157, 157, 157),
                      letterSpacing: 1.5),
                ),
                const Spacer(),
                containerIcon(30, 30, Icons.flutter_dash_outlined, 20),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
            Text(
              'Create a To-Do-App',
              style:
                  GoogleFonts.lato(fontSize: 17, fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const FaIcon(
                  FontAwesomeIcons.solidClock,
                  color: Palette.purpleColorscondary,
                  size: 15,
                ),
                const SizedBox(width: 8),
                Text(
                  '12:00 PM',
                  style: GoogleFonts.lato(
                    color: Palette.purpleColorscondary,
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isDone = !isDone;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: (isDone)
                            ? const Color.fromARGB(255, 209, 250, 210)
                            : const Color.fromARGB(255, 255, 236, 207),
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 4.0, horizontal: 15),
                      child: Text(
                        (isDone) ? 'Done ✔' : 'Not Done',
                        style: GoogleFonts.lato(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: (isDone) ? Colors.green : Colors.orange),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
            const SizedBox(height: 5)
          ],
        ),
      ),
    );
  }
}
