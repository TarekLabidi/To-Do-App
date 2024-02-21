import 'package:flutter/material.dart';
import 'package:to_do_list_app/components/habits_goals_list_view.dart';
import 'package:to_do_list_app/dummy_data.dart';
import 'package:to_do_list_app/utils/utils.dart';

class HabitsGoalsPage extends StatefulWidget {
  const HabitsGoalsPage({super.key});

  @override
  State<HabitsGoalsPage> createState() => _HabitsGoalsPageState();
}

class _HabitsGoalsPageState extends State<HabitsGoalsPage> {
  bool isGoalsShown = true;
  bool isHabitsshown = true;
  bool isTaskGroupShown = true;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Image.asset(
              'assets/images/background.png',
              height: height,
              width: width,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    sameGap(height),
                    Center(
                      child: Text(
                        'Goals & Habits',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                    sameGap(height),
                    sameGap(height),
                    Row(
                      children: [
                        Text(
                          'My Goals',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const Spacer(),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.add),
                        ),
                        SizedBox(
                          width: width * 0.009,
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              isGoalsShown = !isGoalsShown;
                            });
                          },
                          icon: RotatedBox(
                            quarterTurns: (isGoalsShown) ? -1 : 1,
                            child: const Icon(
                              Icons.arrow_forward_ios,
                              size: 20.0,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                    (isGoalsShown)
                        ? HabitsGoalsListView(
                            height: height,
                            widht: width,
                            goalOrHabit: 'goals',
                            lists: goals,
                          )
                        : const SizedBox.shrink(),
                    sameGap(height),
                    Row(
                      children: [
                        Text(
                          'My Habits',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const Spacer(),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.add),
                        ),
                        SizedBox(
                          width: width * 0.009,
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              isHabitsshown = !isHabitsshown;
                            });
                          },
                          icon: RotatedBox(
                            quarterTurns: (isGoalsShown) ? -1 : 1,
                            child: const Icon(
                              Icons.arrow_forward_ios,
                              size: 20.0,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                    (isHabitsshown)
                        ? HabitsGoalsListView(
                            height: height,
                            widht: width,
                            goalOrHabit: 'habits',
                            lists: habits,
                          )
                        : const SizedBox.shrink(),
                    sameGap(height),
                    Row(
                      children: [
                        Text(
                          'Task groups',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const Spacer(),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.add),
                        ),
                        SizedBox(
                          width: width * 0.009,
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              isTaskGroupShown = !isTaskGroupShown;
                            });
                          },
                          icon: RotatedBox(
                            quarterTurns: (isGoalsShown) ? -1 : 1,
                            child: const Icon(
                              Icons.arrow_forward_ios,
                              size: 20.0,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                    (isTaskGroupShown)
                        ? HabitsGoalsListView(
                            height: height,
                            widht: width,
                            goalOrHabit: 'Task group',
                            lists: taskGroups,
                          )
                        : const SizedBox.shrink(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
