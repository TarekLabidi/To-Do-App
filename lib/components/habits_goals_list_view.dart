import 'package:flutter/material.dart';
import 'package:to_do_list_app/popUpPages/edit_goal_page.dart';
import 'package:to_do_list_app/popUpPages/edit_habbit_page.dart';

class HabitsGoalsListView extends StatelessWidget {
  const HabitsGoalsListView(
      {super.key,
      required this.height,
      required this.widht,
      required this.goalOrHabit,
      required this.lists});

  final double height;
  final double widht;
  final String goalOrHabit;
  final List<Map<String, dynamic>> lists;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: lists.length,
          itemBuilder: (context, index) {
            final habit = lists[index];
            return GestureDetector(
              onTap: () {
                if (goalOrHabit == 'goal') {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const EdirtGoalPage()));
                } else {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const EditHabbitPage()));
                }
              },
              child: Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: Text.rich(
                  TextSpan(
                    text: '  #  ',
                    style: const TextStyle(
                      fontSize: 29.0,
                      fontWeight: FontWeight.w700,
                      color: Color.fromARGB(255, 99, 44, 249),
                    ),
                    children: [
                      TextSpan(
                        text: '${habit["title"].toString()} \n',
                        style: const TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text:
                            '               ${List.from(habit["tasks"]).length} Tasks',
                        style: const TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
