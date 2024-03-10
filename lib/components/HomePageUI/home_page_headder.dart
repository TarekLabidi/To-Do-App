import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_list_app/components/OtherUi/text_field.dart';
import 'package:to_do_list_app/services/firebaseStroage/tasks_storage.dart';
import 'package:to_do_list_app/utils/palette.dart';

class HomePageHeadder extends StatefulWidget {
  const HomePageHeadder({
    super.key,
  });

  @override
  State<HomePageHeadder> createState() => _HomePageHeadderState();
}

class _HomePageHeadderState extends State<HomePageHeadder> {
  final TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
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
            Row(
              children: [
                StreamBuilder(
                    stream: OnlineStorage().getName(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Text(snapshot.error.toString());
                      }
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      }
                      final data = snapshot.data;
                      String name = data!['Username'];
                      return ConstrainedBox(
                        constraints: BoxConstraints(
                            maxWidth: width * 0.5, maxHeight: 30),
                        child: Text(
                          name,
                          style: Theme.of(context).textTheme.titleLarge,
                          overflow: TextOverflow.ellipsis,
                        ),
                      );
                    }),
                GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return Center(
                              child: Card(
                                margin: EdgeInsets.symmetric(
                                    horizontal: width * 0.1,
                                    vertical: height * 0.3),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Enter Your Name',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge!
                                          .copyWith(fontSize: 22),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 40.0),
                                      child: TextFieldE(
                                        hinttext: 'Tarek Labidi',
                                        isObscure: false,
                                        changeObscure: (value) {},
                                        isPassword: false,
                                        controller: nameController,
                                      ),
                                    ),
                                    const SizedBox(height: 40),
                                    Container(
                                        decoration: BoxDecoration(
                                            color: Palette.purpleColor,
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: TextButton(
                                            onPressed: () {
                                              if (nameController
                                                  .text.isNotEmpty) {
                                                OnlineStorage().createName(
                                                    name: nameController.text);
                                                Navigator.pop(context);
                                              }
                                            },
                                            child: const Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 12.0,
                                                  vertical: 3),
                                              child: Text(
                                                "Enter",
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white),
                                              ),
                                            )))
                                  ],
                                ),
                              ),
                            );
                          });
                    },
                    child: Icon(
                      Icons.edit,
                      color: Palette.purpleColorscondary,
                    ))
              ],
            )
          ],
        ),
        const Spacer(),
        const Icon(
          Icons.notifications,
          color: Colors.black,
          size: 30,
        ),
      ],
    );
  }
}
