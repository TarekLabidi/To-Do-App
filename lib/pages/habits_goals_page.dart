import 'package:flutter/material.dart';
import 'package:to_do_list_app/components/goals_list_view.dart';
import 'package:to_do_list_app/components/habits_list_view.dart';
import 'package:to_do_list_app/popUpPages/add_goal_page.dart';
import 'package:to_do_list_app/popUpPages/add_habbit_page.dart';
import 'package:to_do_list_app/services/firebaseStroage/goal_moddel.dart';
import 'package:to_do_list_app/services/firebaseStroage/habbit_model.dart';
import 'package:to_do_list_app/services/firebaseStroage/tasks_service.dart';
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
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const AddGoalPage()));
                          },
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
                        ? StreamBuilder(
                            stream: OnlineStorage().getGoals(),
                            builder: (context, snapshots) {
                              if (snapshots.hasError) {
                                return const Text(
                                    'Coudnt Load Data check your internet');
                              } else if (snapshots.hasData) {
                                final goals = snapshots.data!;

                                return ListView(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    children: goals.map(buildGoal).toList());
                              } else {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                            })
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
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const AddHabbitPage()));
                          },
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
                            quarterTurns: (isHabitsshown) ? -1 : 1,
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
                        ? StreamBuilder(
                            stream: OnlineStorage().getHabits(),
                            builder: (context, snapshots) {
                              if (snapshots.hasError) {
                                return const Text(
                                    'Coudnt Load Data check your internet');
                              } else if (snapshots.hasData) {
                                final habits = snapshots.data!;

                                return ListView(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    children: habits.map(buildHabbit).toList());
                              } else {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                            })
                        : const SizedBox.shrink(),
                    sameGap(height),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildHabbit(Habbit habbit) => HabitsListView(
        habbit: habbit,
      );
  Widget buildGoal(Goal habbit) => GoalsListView(
        goal: habbit,
      );
}
