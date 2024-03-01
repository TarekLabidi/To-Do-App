import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_app/popUpPages/habit_tasks_page.dart';
import 'package:to_do_list_app/services/data/provider.dart';
import 'package:to_do_list_app/services/firebaseStroage/models/habbit_model.dart';
import 'package:to_do_list_app/utils/palette.dart';
import 'package:to_do_list_app/utils/utils.dart';

class HabitsListView extends StatelessWidget {
  final Habbit habbit;
  const HabitsListView({super.key, required this.habbit});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => HabitTaskspage(habit: habbit)));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: Row(
              children: [
                containerIcon(
                  40,
                  40,
                  context.read<ToDoProvider>().getIcon(habbit.icon),
                  30,
                  Palette.purpleColor,
                  Colors.transparent,
                ),
                const SizedBox(width: 12.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      habbit.title,
                      style: const TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                    const Text(
                      '11 Tasks',
                      style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
