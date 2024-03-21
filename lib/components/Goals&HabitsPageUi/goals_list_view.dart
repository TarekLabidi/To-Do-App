import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_app/popUpPages/goal_tasks_page.dart';
import 'package:to_do_list_app/services/data/provider.dart';
import 'package:to_do_list_app/services/firebaseStroage/models/goal_moddel.dart';
import 'package:to_do_list_app/services/firebaseStroage/tasks_storage.dart';
import 'package:to_do_list_app/utils/palette.dart';
import 'package:to_do_list_app/utils/utils.dart';

class GoalsListView extends StatelessWidget {
  final Goal goal;
  const GoalsListView({super.key, required this.goal});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => GoalTaskspage(goal: goal)));
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
                  context.read<ToDoProvider>().getIcon(goal.icon),
                  30,
                  Palette.purpleColor,
                  Colors.transparent,
                ),
                const SizedBox(width: 12.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      goal.title,
                      style: const TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                    FutureBuilder(
                        future:
                            OnlineStorage().getNumberOfTasksInGoal(goal.title),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Text('Loading...');
                          }
                          if (snapshot.hasData) {
                            return Text(
                              '${snapshot.data.toString()} Tasks',
                              style: const TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              ),
                            );
                          }
                          return const Text('Some Error Has Occured');
                        })
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
