import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePageHeadder extends StatelessWidget {
  const HomePageHeadder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: const Color.fromRGBO(33, 16, 95, 1.0),
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Image.asset('assets/images/logo1.png'),
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hello!",
              style: GoogleFonts.lato(
                  fontSize: 18,
                  color: const Color.fromARGB(255, 113, 112, 112),
                  fontWeight: FontWeight.w500),
            ),
            Text("Tarek Labidi", style: Theme.of(context).textTheme.titleLarge),
          ],
        ),
        const Spacer(),
        const Icon(
          Icons.notifications,
          color: Colors.black,
          size: 40,
        ),
      ],
    );
  }
}
