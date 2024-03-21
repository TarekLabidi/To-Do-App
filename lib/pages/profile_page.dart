import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:to_do_list_app/components/ProfilePageUi/daily_widget.dart';
import 'package:to_do_list_app/components/ProfilePageUi/profile_page_headder.dart';
import 'package:to_do_list_app/components/ProfilePageUi/profile_page_icon.dart';
import 'package:to_do_list_app/components/ProfilePageUi/profile_page_row.dart';

import 'package:to_do_list_app/components/ProfilePageUi/weekly_widget.dart';
import 'package:to_do_list_app/utils/utils.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                        GestureDetector(
                          onTap: () {},
                          child: const GoalsPageIcon(
                            icon: FontAwesomeIcons.trophy,
                            title: 'Goals',
                          ),
                        ),
                        sameGap(height),
                        GestureDetector(
                          onTap: () {},
                          child: const GoalsPageIcon(
                            icon: FontAwesomeIcons.recycle,
                            title: 'Habits',
                          ),
                        ),
                        sameGap(height),
                        GestureDetector(
                          onTap: () {},
                          child: const GoalsPageIcon(
                            // ignore: deprecated_member_use
                            icon: FontAwesomeIcons.checkCircle,
                            title: 'Complited',
                          ),
                        ),
                        sameGap(height),
                        GestureDetector(
                          onTap: () {},
                          child: const GoalsPageIcon(
                            icon: FontAwesomeIcons.trash,
                            title: 'Deleted',
                          ),
                        ),
                      ],
                    ),
                  ),
                  sameGap(height),
                  GoalsPageRow(
                    rowPosition: rowPoistion,
                    clicked: (value) {
                      setState(() {
                        rowPoistion = value;
                      });
                    },
                  ),
                  (rowPoistion == 0)
                      ? DailyWidget(height: height)
                      : WeeklyWidget(height: height)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
