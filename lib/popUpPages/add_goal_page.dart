import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_app/components/Goals&HabitsPageUi/add_goal_container.dart';
import 'package:to_do_list_app/components/Goals&HabitsPageUi/choose_habit_icon.dart';
import 'package:to_do_list_app/components/Goals&HabitsPageUi/select_day_add_goal_page.dart';

import 'package:to_do_list_app/services/data/goal_provider.dart';
import 'package:to_do_list_app/services/firebaseStroage/tasks_storage.dart';
import 'package:to_do_list_app/utils/palette.dart';
import 'package:to_do_list_app/utils/utils.dart';

class AddGoalPage extends StatefulWidget {
  const AddGoalPage({super.key});

  @override
  State<AddGoalPage> createState() => _AddGoalPageState();
}

class _AddGoalPageState extends State<AddGoalPage> {
  final goalNameController = TextEditingController();
  final goalDescController = TextEditingController();
  int? dropdownValueIcon = 1;
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
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  sameGap(height),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                          context.read<GoalsProvider>().resetDates();
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          size: 30,
                        ),
                      ),
                      SizedBox(
                        width: width * 0.23,
                      ),
                      Text(
                        'Add Goal',
                        style: GoogleFonts.roboto(
                            fontSize: 32,
                            fontWeight: FontWeight.w400,
                            color: Palette.purpleColor),
                      ),
                    ],
                  ),
                  sameGap(height * 2),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      children: [
                        AddGoalContainer(
                            height: height,
                            title: 'Goal title',
                            hintText: 'Enter the title of your goal',
                            controller: goalNameController,
                            maxLines: 1),
                        sameGap(height),
                        AddGoalContainer(
                            height: height,
                            title: 'Goal description',
                            hintText: 'Enter your description',
                            controller: goalDescController,
                            maxLines: 4),
                        sameGap(height),
                        SelectDayAddGoalPage(
                          width: width,
                          title: 'Start Day',
                        ),
                        sameGap(height),
                        SelectDayAddGoalPage(
                          width: width,
                          title: 'End Day',
                        ),
                        sameGap(height),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(14.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(width: width * 0.04),
                                ChooseHabitIcon(
                                    dropdownValueIcon: dropdownValueIcon,
                                    chosed1: ((value) {
                                      setState(() {
                                        dropdownValueIcon = value;
                                      });
                                    })),
                                const Spacer(),
                                Container(
                                  decoration: BoxDecoration(
                                      color: SecondaryColors.pruple,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12.0, vertical: 4),
                                    child: Text(
                                      "Change Logo",
                                      style: GoogleFonts.roboto(
                                          fontSize: 16,
                                          color: PrimaryColors.pruple,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: height * 0.02),
                        TextButton(
                          onPressed: () {
                            if (goalNameController.text.isNotEmpty) {
                              Navigator.pop(context);
                              OnlineStorage().createGoal(
                                  title: goalNameController.text,
                                  desc: goalDescController.text,
                                  startDay:
                                      context.read<GoalsProvider>().endDay,
                                  endDay:
                                      context.read<GoalsProvider>().startDay,
                                  icon: dropdownValueIcon!);
                              context.read<GoalsProvider>().resetDates();
                            }
                          },
                          child: Container(
                            width: double.infinity,
                            height: height * 0.06,
                            decoration: BoxDecoration(
                              color: Palette.purpleColor,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Text(
                                "Done",
                                style: GoogleFonts.roboto(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: height * 0.1),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
