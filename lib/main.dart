import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_app/auth_pages/first_time_gate.dart';
import 'package:to_do_list_app/firebase_options.dart';
import 'package:to_do_list_app/popUpPages/habit_tasks_page.dart';
import 'package:to_do_list_app/services/auth/auth_methods.dart';
import 'package:to_do_list_app/services/data/goal_provider.dart';
import 'package:to_do_list_app/services/data/habit_provider.dart';
import 'package:to_do_list_app/services/data/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('todo');
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthMethods>(
          create: (_) => AuthMethods(),
        ),
        StreamProvider(
            create: (context) => context.read<AuthMethods>().authState,
            initialData: null),
        ChangeNotifierProvider(create: (context) => ToDoProvider()),
        ChangeNotifierProvider(create: (context) => GoalsProvider()),
        ChangeNotifierProvider(create: (context) => HabitsProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            useMaterial3: true,
            textTheme: TextTheme(
              titleLarge: GoogleFonts.lato(
                fontSize: 26,
                color: Colors.black,
                fontWeight: FontWeight.w800,
              ),
              titleMedium: GoogleFonts.lato(
                fontSize: 22,
                color: Colors.black,
                fontWeight: FontWeight.w700,
              ),
            )),
        home: const FirstTimeGate(),
      ),
    );
  }
}
