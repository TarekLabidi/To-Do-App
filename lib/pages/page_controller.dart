import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:to_do_list_app/components/middle_floationg_button.dart';

import 'package:to_do_list_app/pages/profile_page.dart';
import 'package:to_do_list_app/pages/habits_goals_page.dart';
import 'package:to_do_list_app/pages/home_page.dart';
import 'package:to_do_list_app/pages/today_tasks_page.dart';

class PagesController extends StatefulWidget {
  const PagesController({super.key});

  @override
  State<PagesController> createState() => _PagesControllerState();
}

class _PagesControllerState extends State<PagesController> {
  int currentPages = 0;

  bool isentred = false;
  PageController pageController = PageController();
  List<Widget> pages = [
    const HomePage(),
    const TodayTasksPage(),
    const HabitsGoalsPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        onPageChanged: (value) {
          setState(() {
            currentPages = value;
          });
        },
        children: pages,
      ),
      floatingActionButton: const MiddleFloationgButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: customAppBar(),
    );
  }

  Container customAppBar() {
    return Container(
      color: const Color.fromARGB(255, 218, 253, 253),
      child: ClipRRect(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          child: BottomAppBar(
            height: 60,
            color: const Color.fromRGBO(237, 232, 255, 1),
            shape: const AutomaticNotchedShape(
              RoundedRectangleBorder(),
              StadiumBorder(),
            ),
            notchMargin: 5,
            clipBehavior: Clip.antiAlias,
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      pageController.animateToPage(0,
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.linear);
                    });
                  },
                  // adding more space to the gestureDetector becaus the icons are small
                  child: Container(
                    color: Colors.transparent,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.064,
                          vertical: 8),
                      child: FaIcon(
                        FontAwesomeIcons.house,
                        color: (currentPages == 0)
                            ? const Color.fromARGB(255, 53, 4, 200)
                            : const Color.fromRGBO(158, 131, 238, 1.0),
                      ),
                    ),
                  ),
                ),
                // ignore: deprecated_member_use
                GestureDetector(
                  onTap: () {
                    setState(() {
                      pageController.animateToPage(1,
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.linear);
                    });
                  },
                  child: Container(
                    color: Colors.transparent,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.064,
                          vertical: 8),
                      child: FaIcon(
                        FontAwesomeIcons.solidCalendarDays,
                        color: (currentPages == 1)
                            ? const Color.fromARGB(255, 53, 4, 200)
                            : const Color.fromRGBO(158, 131, 238, 1.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.13,
                ),

                GestureDetector(
                  onTap: () {
                    setState(() {
                      pageController.animateToPage(2,
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.linear);
                    });
                  },
                  child: Container(
                    color: Colors.transparent,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.064,
                          vertical: 8),
                      child: FaIcon(
                        FontAwesomeIcons.trophy,
                        color: (currentPages == 2)
                            ? const Color.fromARGB(255, 53, 4, 200)
                            : const Color.fromRGBO(158, 131, 238, 1.0),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      pageController.animateToPage(3,
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.linear);
                    });
                  },
                  child: Container(
                    color: Colors.transparent,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.064,
                          vertical: 4),
                      child: FaIcon(
                        FontAwesomeIcons.solidCircleUser,
                        size: 30,
                        color: (currentPages == 3)
                            ? const Color.fromARGB(255, 53, 4, 200)
                            : const Color.fromRGBO(158, 131, 238, 1.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
