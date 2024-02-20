import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:to_do_list_app/components/goals_page_headder.dart';
import 'package:to_do_list_app/components/goals_page_icon.dart';
import 'package:to_do_list_app/components/goals_page_row.dart';
import 'package:to_do_list_app/utils/utils.dart';

class GoalsPage extends StatefulWidget {
  const GoalsPage({super.key});

  @override
  State<GoalsPage> createState() => _GoalsPageState();
}

class _GoalsPageState extends State<GoalsPage> {
  int rowPoistion = 0;

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
                sameGap(height),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: GolasPageHeadder(),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Divider(
                  thickness: 1,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: Column(
                    children: [
                      sameGap(height),
                      const GoalsPageIcon(
                        icon: FontAwesomeIcons.trophy,
                        title: 'Goals',
                      ),
                      sameGap(height),
                      const GoalsPageIcon(
                        icon: FontAwesomeIcons.recycle,
                        title: 'Habits',
                      ),
                      sameGap(height),
                      const GoalsPageIcon(
                        // ignore: deprecated_member_use
                        icon: FontAwesomeIcons.checkCircle,
                        title: 'Goals',
                      ),
                    ],
                  ),
                ),
                GoalsPageRow(
                  rowPosition: rowPoistion,
                  clicked: (value) {
                    setState(() {
                      rowPoistion = value;
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
