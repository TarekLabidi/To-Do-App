import 'package:flutter/material.dart';

class GolasPageHeadder extends StatelessWidget {
  const GolasPageHeadder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(width: MediaQuery.of(context).size.width / 3.6),
            Text(
              "Productivity",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const Spacer(),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.notifications,
                  color: Colors.black,
                  size: 30,
                )),
          ],
        ),
        SizedBox(height: MediaQuery.of(context).size.height / 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 25,
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
                Text("Tarek Labidi",
                    style: Theme.of(context).textTheme.titleLarge),
                const Text("15 completed tasks",
                    style: TextStyle(
                        color: Color.fromARGB(255, 146, 128, 203),
                        fontSize: 15,
                        fontWeight: FontWeight.bold)),
              ],
            ),
            const Spacer(),
            const Icon(
              Icons.logout_rounded,
              color: Colors.black,
              size: 30,
            ),
          ],
        ),
      ],
    );
  }
}
