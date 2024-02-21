import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:to_do_list_app/utils/utils.dart';

class TaskGroupCard extends StatelessWidget {
  const TaskGroupCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Card(
        elevation: 0,
        margin: const EdgeInsets.only(bottom: 20),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12),
          child: Row(
            children: [
              containerIcon(40, 40, Icons.work, 30),
              const SizedBox(
                width: 8,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Personal Project',
                    style: GoogleFonts.lato(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Text(
                    '18 Task',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 137, 134, 134),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              CircularPercentIndicator(
                radius: 25.0,
                lineWidth: 5.0,
                percent: 0.60,
                center: const Text(
                  "100%",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
                progressColor: const Color.fromARGB(255, 238, 58, 151),
                backgroundColor: const Color.fromARGB(255, 237, 208, 223),
                reverse: true,
              ),
              const SizedBox(
                width: 10,
              )
            ],
          ),
        ),
      ),
    );
  }
}
