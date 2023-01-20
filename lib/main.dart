import 'package:flutter/material.dart';
import 'package:tour_app/home_page.dart';
import 'package:tour_app/tour_target.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'In-App Tour',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const HomePage(),
    );
  }
}
