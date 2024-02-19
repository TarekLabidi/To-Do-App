import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:to_do_list_app/pages/goals_page.dart';
import 'package:to_do_list_app/pages/habits_page.dart';
import 'package:to_do_list_app/pages/home_page.dart';
import 'package:to_do_list_app/pages/today_tasks_page.dart';
import 'package:to_do_list_app/utils/palette.dart';

class PagesController extends StatefulWidget {
  const PagesController({super.key});

  @override
  State<PagesController> createState() => _PagesControllerState();
}

class _PagesControllerState extends State<PagesController> {
  int currentPages = 0;
  List<Widget> pages = [
    const HomePage(),
    const TodayTasksPage(),
    const GoalsPage(),
    const HabitsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentPages],
      floatingActionButton: FloatingActionButton(
        elevation: 30,
        backgroundColor: Palette.purpleColor,
        shape: const CircleBorder(),
        onPressed: () {},
        child: const Icon(
          Icons.add,
          size: 30,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        height: 60,
        color: const Color.fromRGBO(237, 232, 255, 1),
        shape: const CircularNotchedRectangle(),
        notchMargin: 5,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  currentPages = 0;
                });
              },
              child: FaIcon(
                FontAwesomeIcons.house,
                color: (currentPages == 0)
                    ? const Color.fromRGBO(95, 51, 224, 1.0)
                    : const Color.fromRGBO(158, 131, 238, 1.0),
              ),
            ),
            // ignore: deprecated_member_use
            GestureDetector(
              onTap: () {
                setState(() {
                  currentPages = 1;
                });
              },
              child: FaIcon(
                FontAwesomeIcons.tasks,
                size: 30,
                color: (currentPages == 1)
                    ? const Color.fromRGBO(95, 51, 224, 1.0)
                    : const Color.fromRGBO(158, 131, 238, 1.0),
              ),
            ),
            const SizedBox(),
            const SizedBox(),
            const SizedBox(),
            GestureDetector(
              onTap: () {
                setState(() {
                  currentPages = 2;
                });
              },
              child: FaIcon(
                FontAwesomeIcons.trophy,
                color: (currentPages == 2)
                    ? const Color.fromRGBO(95, 51, 224, 1.0)
                    : const Color.fromRGBO(158, 131, 238, 1.0),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  currentPages = 3;
                });
              },
              child: FaIcon(
                FontAwesomeIcons.recycle,
                color: (currentPages == 3)
                    ? const Color.fromRGBO(95, 51, 224, 1.0)
                    : const Color.fromRGBO(158, 131, 238, 1.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
