import 'package:flutter/material.dart';
import 'package:to_do_list_app/components/goals_card_hp.dart';
import 'package:to_do_list_app/components/habits_card.dart';
import 'package:to_do_list_app/components/home_page_headder.dart';
import 'package:to_do_list_app/components/task_group_card.dart';
import 'package:to_do_list_app/utils/utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Padding(
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
                  child: ListView.builder(
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return GoalssCardHp(height: height, width: width);
                      }),
                ),
                sameGap(height),
                Text(
                  'Task Groups',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                sameGap(height),
                ListView.builder(
                    itemCount: 4,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return const TaskGroupCard();
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
