import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:to_do_list_app/components/days_card.dart';
import 'package:to_do_list_app/components/filters_card.dart';
import 'package:to_do_list_app/components/goal_task_card.dart';
import 'package:to_do_list_app/components/goal_task_card_tp.dart';
import 'package:to_do_list_app/components/habbit_task_card_tp.dart';
import 'package:to_do_list_app/components/tasks_card.dart';
import 'package:to_do_list_app/services/firebaseStroage/models/goal_task_model.dart';
import 'package:to_do_list_app/services/firebaseStroage/models/habbit_task_model.dart';
import 'package:to_do_list_app/services/firebaseStroage/models/task_model.dart';
import 'package:to_do_list_app/services/firebaseStroage/tasks_service.dart';
import 'package:to_do_list_app/utils/utils.dart';

class TodayTasksPage extends StatefulWidget {
  const TodayTasksPage({super.key});

  @override
  State<TodayTasksPage> createState() => _TodayTasksPageState();
}

class _TodayTasksPageState extends State<TodayTasksPage> {
  int poistionDay = 2;
  int poistionFilter = 0;
  String day = DateFormat("EEE").format(DateTime.now());
  String date = DateFormat('dd MM yyyy').format(DateTime.now());
  List<String> filters = ['All', 'To Do', 'Habits', 'Goals Tasks'];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Image.asset(
              'assets/images/background.png',
              height: height,
              width: width,
              fit: BoxFit.cover,
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  sameGap2(height),
                  Row(
                    children: [
                      SizedBox(
                        width: width / 2.4,
                      ),
                      Text(
                        'Tasks',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.notifications,
                        color: Colors.black,
                        size: 30,
                      ),
                      SizedBox(
                        width: width / 18,
                      ),
                    ],
                  ),
                  sameGap2(height),
                  SizedBox(
                    height: height / 8,
                    child: ListView.builder(
                        itemCount: 14,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          bool isPressed = (index == poistionDay);
                          return Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: DaysCard(
                              height: height,
                              width: width,
                              index: index,
                              isPressed: isPressed,
                              clicked: (value) {
                                setState(() {
                                  poistionDay = index;
                                  day = value;
                                });
                              },
                              changeDate: (value) {
                                setState(() {
                                  date = value;
                                });
                              },
                            ),
                          );
                        }),
                  ),
                  sameGap2(height),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: SizedBox(
                      height: height / 20,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: filters.length,
                        itemBuilder: (context, index) {
                          bool isPressed = (poistionFilter == index);
                          final filter = filters[index];
                          return FiltersCard(
                            isPressed: isPressed,
                            filter: filter,
                            clicked: (value) {
                              setState(() {
                                poistionFilter = index;
                              });
                            },
                          );
                        },
                      ),
                    ),
                  ),
                  sameGap2(height),
                  StreamBuilder<List<Task>>(
                    stream:
                        OnlineStorage().getTasks(filters[poistionFilter], date),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        final tasks = snapshot.data;
                        return ListView(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          children: tasks!.map(buildTask).toList(),
                        );
                      } else if (snapshot.hasError) {
                        return Center(
                          child: Text(
                            snapshot.toString(),
                            style: const TextStyle(fontSize: 20),
                          ),
                        );
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    },
                  ),
                  (poistionFilter == 0 || poistionFilter == 2)
                      ? StreamBuilder<List<HabbitTask>>(
                          stream: OnlineStorage().getHabitTasksTP(day: day),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              final groupTasks = snapshot.data!;
                              return ListView(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                children: groupTasks
                                    .map((taskGroup) =>
                                        buildHabitTask(taskGroup))
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
                        )
                      : const SizedBox.shrink(),
                  (poistionFilter == 0 || poistionFilter == 3)
                      ? StreamBuilder<List<GoalTask>>(
                          stream: OnlineStorage().getGoalTasksTP(date: date),
                          builder: (context, snapshot) {
                            print('date $date');
                            if (snapshot.hasData) {
                              final groupTasks = snapshot.data!;
                              return ListView(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                children: groupTasks
                                    .map((taskGroup) =>
                                        buildGoalTasks(taskGroup))
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
                        )
                      : const SizedBox.shrink(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTask(Task task) => TasksCard(task: task);
  Widget buildHabitTask(HabbitTask habittask) =>
      HabbitTasksTPCard(habbitTask: habittask);
  Widget buildGoalTasks(GoalTask goalTask) =>
      GoalTasksCardTP(goalTask: goalTask);
}
