import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_app/services/data/habit_provider.dart';
import 'package:to_do_list_app/services/data/provider.dart';
import 'package:to_do_list_app/services/firebaseStroage/models/habbit_task_model.dart';
import 'package:to_do_list_app/utils/palette.dart';

class HabbitTasksCard extends StatefulWidget {
  final HabbitTask habbitTask;
  const HabbitTasksCard({super.key, required this.habbitTask});

  @override
  State<HabbitTasksCard> createState() => _HabbitTasksCardState();
}

class _HabbitTasksCardState extends State<HabbitTasksCard> {
  List<Map<String, dynamic>> presentDays = [];

  @override
  Widget build(BuildContext context) {
    presentDays =
        context.read<HabitsProvider>().targetDays(widget.habbitTask.days);
    final height = MediaQuery.of(context).size.height;
    return Container(
      width: double.infinity,
      height: height / 6,
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
            const Text(
              'Targeted days :',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(255, 205, 192, 255)),
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: presentDays.map((day) => buildDay(day)).toList(),
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
                const SizedBox(width: 10),
              ],
            ),
            const SizedBox(height: 5)
          ],
        ),
      ),
    );
  }

  Widget buildDay(Map map) {
    if (map['present'] == true) {
      return SizedBox(
        height: MediaQuery.of(context).size.height * 0.035,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(right: 6),
              height: 5,
              width: 5,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Palette.purpleColor),
            ),
            const Spacer(),
            Text(
              '${map['day'][0]}  ',
              style: const TextStyle(color: Palette.purpleColor),
            )
          ],
        ),
      );
    } else {
      return SizedBox(
        height: MediaQuery.of(context).size.height * 0.035,
        child: Column(
          children: [
            const Spacer(),
            Text(
              '${map['day'][0]}  ',
              style: const TextStyle(color: Palette.greyColor),
            ),
          ],
        ),
      );
    }
  }
}
