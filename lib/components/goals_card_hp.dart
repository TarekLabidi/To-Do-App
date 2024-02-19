import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:to_do_list_app/utils/utils.dart';

class GoalssCardHp extends StatelessWidget {
  final double height;
  final double width;
  const GoalssCardHp({super.key, required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4.0, right: 14),
      child: Container(
        height: double.infinity,
        width: width * 0.57,
        decoration: const BoxDecoration(
          color: Color.fromRGBO(213, 234, 255, 1),
          borderRadius: BorderRadius.all(
            Radius.circular(25),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Personal Project',
                    style: GoogleFonts.lato(
                        fontSize: 15,
                        color: const Color.fromARGB(255, 139, 137, 137),
                        fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  containerIcon(30, 30, Icons.work, 20)
                ],
              ),
              SizedBox(height: height / 100),
              Text(
                'Get a nice and a good someting in the somting',
                style:
                    GoogleFonts.lato(fontSize: 18, fontWeight: FontWeight.bold),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(
                height: 10,
              ),
              LinearPercentIndicator(
                width: width * 0.47,
                lineHeight: 14.0,
                percent: 0.2,
                backgroundColor: const Color.fromARGB(255, 236, 243, 250),
                progressColor: Colors.blue,
                padding: const EdgeInsets.only(top: 5),
                barRadius: const Radius.circular(5),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
