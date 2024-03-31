import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_app/components/HomePageUI/goals_card_hp.dart';
import 'package:to_do_list_app/components/HomePageUI/habits_card.dart';
import 'package:to_do_list_app/components/HomePageUI/home_page_headder.dart';
import 'package:to_do_list_app/components/HomePageUI/task_group_card.dart';
import 'package:to_do_list_app/services/data/goal_provider.dart';
import 'package:to_do_list_app/services/firebaseStroage/models/goal_moddel.dart';
import 'package:to_do_list_app/services/firebaseStroage/tasks_storage.dart';
import 'package:to_do_list_app/utils/palette.dart';
import 'package:to_do_list_app/utils/utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;
  int prog = 0;
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
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    sameGap(height),
                    const HomePageHeadder(),
                    sameGap(height),
                    HabitsCard(height: height, width: width),
                    sameGap(height),
                    Text(
                      'Goals In Progress',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    sameGap(height),
                    SizedBox(
                      height: height / 5.5,
                      child: StreamBuilder(
                        stream: OnlineStorage().getGoals(),
                        builder: (context, snapshots) {
                          if (snapshots.hasData) {
                            final goals = snapshots.data!;
                            print(goals);
                            return ListView(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              children: goals
                                  .map((goal) => buildGoal(goal, goals.length))
                                  .toList(),
                            );
                          } else if (snapshots.hasError) {
                            return Center(
                              child: Text(
                                snapshots.toString(),
                                style: const TextStyle(fontSize: 20),
                              ),
                            );
                          } else {
                            return const Center(
                                child: CircularProgressIndicator());
                          }
                        },
                      ),
                    ),
                    sameGap(height),
                    Text(
                      'Task Groups',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    sameGap(height),
                    StreamBuilder<List<String>>(
                      stream: OnlineStorage().getGroupTasks(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          final groupTasks = snapshot.data!;
                          return ListView(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            children: groupTasks
                                .map((taskGroup) => buildGroupTask(taskGroup))
                                .toList(),
                          );
                        } else if (snapshot.hasError) {
                          return Center(
                            child: Text(
                              snapshot.toString(),
                              style: const TextStyle(fontSize: 20),
                            ),
                          );
                        } else {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildGroupTask(String taskGroup) {
    return TaskGroupCard(taskGroup: taskGroup);
  }

  Widget buildGoal(Goal goal, int length) {
    index++;
    context.read<GoalsProvider>().calDays;
    if (context
            .read<GoalsProvider>()
            .isInProgress(goal.startDay, goal.endDay) ==
        false) {
      prog++;
    }
    if (prog == length) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(width: MediaQuery.of(context).size.width * 0.15),
          Column(
            children: [
              Text(
                'You Have No Goals In Progress',
                style: GoogleFonts.lato(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Palette.greyColor),
              ),
              Image.asset(
                'assets/images/noGoalsFound.png',
                height: 120,
              )
            ],
          ),
        ],
      );
    }
    return GoalssCardHp(
      goal: goal,
      index: index % 5,
    );
  }
}
