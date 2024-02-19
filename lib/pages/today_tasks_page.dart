import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_list_app/components/days_card.dart';
import 'package:to_do_list_app/components/filters_card.dart';
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
        body: Column(
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
                      })),
            ),
            sameGap2(height),
            Expanded(
              child: ListView.builder(
                itemCount: 8,
                itemBuilder: (context, index) {
                  return Container(
                    width: double.infinity,
                    height: height / 7,
                    margin: const EdgeInsets.symmetric(horizontal: 30)
                        .copyWith(bottom: 20),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 247, 245, 245),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: const Color.fromARGB(255, 208, 207, 207),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Learing Flutter',
                                style: GoogleFonts.lato(
                                    fontSize: 16,
                                    color: const Color.fromARGB(
                                        255, 117, 115, 115),
                                    letterSpacing: 1.5),
                              ),
                              const Spacer(),
                              containerIcon(
                                  30, 30, Icons.flutter_dash_outlined, 20),
                              const SizedBox(
                                width: 10,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 7,
                          ),
                          Text(
                            'Create a To-Do-App',
                            style: GoogleFonts.lato(
                                fontSize: 18, fontWeight: FontWeight.w700),
                          ),
                          const Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const FaIcon(
                                FontAwesomeIcons.solidClock,
                                color: Color.fromRGBO(177, 156, 255, 1.0),
                                size: 20,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                '12:00 PM',
                                style: GoogleFonts.lato(
                                  color:
                                      const Color.fromRGBO(177, 156, 255, 1.0),
                                ),
                              ),
                              const Spacer(),
                              const SizedBox(
                                width: 10,
                              ),
                            ],
                          ),
                          const SizedBox(height: 5)
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
