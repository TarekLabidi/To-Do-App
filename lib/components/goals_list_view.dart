import 'package:flutter/material.dart';
import 'package:to_do_list_app/services/firebaseStroage/goal_moddel.dart';
import 'package:to_do_list_app/services/firebaseStroage/habbit_model.dart';

class GoalsListView extends StatelessWidget {
  final Goal goal;
  const GoalsListView({super.key, required this.goal});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 12.0),
          child: Text.rich(
            TextSpan(
              text: '  #  ',
              style: const TextStyle(
                fontSize: 29.0,
                fontWeight: FontWeight.w700,
                color: Color.fromARGB(255, 99, 44, 249),
              ),
              children: [
                TextSpan(
                  text: '${goal.title} \n',
                  style: const TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
                // FutureBuilder(future: future, builder: builder)
                TextSpan(
                  text: '               11 Tasks',
                  style: const TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
