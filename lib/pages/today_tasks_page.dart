import 'package:flutter/material.dart';
import 'package:to_do_list_app/components/days_card.dart';
import 'package:to_do_list_app/components/filters_card.dart';
import 'package:to_do_list_app/components/tasks_card.dart';
import 'package:to_do_list_app/utils/utils.dart';

class TodayTasksPage extends StatefulWidget {
  const TodayTasksPage({super.key});

  @override
  State<TodayTasksPage> createState() => _TodayTasksPageState();
}

class _TodayTasksPageState extends State<TodayTasksPage> {
  int poistionDay = 3;
  int poistionFilter = 0;
  List<String> filters = ['All', 'To Do', 'Habits', 'Goals Tasks'];
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
            Column(
              children: [
                sameGap2(height),
                Row(
                  children: [
                    SizedBox(
                      width: width / 3.5,
                    ),
                    Text(
                      'Today\'s Tasks',
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
                      itemCount: 5,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        bool isPressed = (index == poistionDay);
                        return Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: DaysCard(
                            height: height,
                            width: width,
                            isPressed: isPressed,
                            clicked: (value) {
                              setState(() {
                                poistionDay = index;
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
                Expanded(
                  child: ListView.builder(
                    itemCount: 8,
                    itemBuilder: (context, index) {
                      return TasksCard(height: height);
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
