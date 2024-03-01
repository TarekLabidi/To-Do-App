import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_app/services/data/provider.dart';
import 'package:to_do_list_app/services/firebaseStroage/models/habbit_task_model.dart';
import 'package:to_do_list_app/utils/palette.dart';
import 'package:to_do_list_app/utils/utils.dart';

class HabbitTasksTPCard extends StatefulWidget {
  final HabbitTask habbitTask;
  const HabbitTasksTPCard({super.key, required this.habbitTask});

  @override
  State<HabbitTasksTPCard> createState() => _HabbitTasksTPCardState();
}

class _HabbitTasksTPCardState extends State<HabbitTasksTPCard> {
  bool isDone = false;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Container(
      width: double.infinity,
      height: height / 5.5,
      margin: const EdgeInsets.symmetric(horizontal: 30).copyWith(bottom: 20),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color.fromARGB(255, 245, 245, 245),
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
                Text(
                  context
                      .read<ToDoProvider>()
                      .getCategory(widget.habbitTask.icon),
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 157, 157, 157),
                      letterSpacing: 1.5),
                ),
                const Spacer(),
                Container(
                  decoration: BoxDecoration(
                      color: context.read<ToDoProvider>().getPrioritySecondary(
                          int.parse(widget.habbitTask.priority[9])),
                      borderRadius: BorderRadius.circular(5)),
                  child: Icon(
                    Icons.flag,
                    size: 25,
                    color: context
                        .read<ToDoProvider>()
                        .getPriority(int.parse(widget.habbitTask.priority[9])),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                containerIcon(
                    30,
                    30,
                    context
                        .read<ToDoProvider>()
                        .getIcon(widget.habbitTask.icon),
                    20,
                    context
                        .read<ToDoProvider>()
                        .getPriority(int.parse(widget.habbitTask.priority[9])),
                    context.read<ToDoProvider>().getPrioritySecondary(
                        int.parse(widget.habbitTask.priority[9]))),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
            Text(
              widget.habbitTask.title,
              style:
                  GoogleFonts.lato(fontSize: 17, fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const FaIcon(
                      FontAwesomeIcons.solidClock,
                      color: Palette.purpleColorscondary,
                      size: 15,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      widget.habbitTask.time,
                      style: GoogleFonts.lato(
                        color: Palette.purpleColorscondary,
                      ),
                    ),
                  ],
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
                const SizedBox(width: 10),
              ],
            ),
            const SizedBox(height: 5),
            Text(
              'Habit : ${widget.habbitTask.habit}',
              maxLines: 1,
              style: GoogleFonts.roboto(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: const Color.fromARGB(255, 120, 208, 255)),
            ),
            const SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}
