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

class BankScreen extends StatefulWidget {
  const BankScreen({super.key});

  @override
  State<BankScreen> createState() => _BankScreenState();
}

class _BankScreenState extends State<BankScreen> {
  final cardKey = GlobalKey();
  final moneyKey = GlobalKey();
  final withdrawKey = GlobalKey();
  final investKey = GlobalKey();

  bool reveal = false;

  late TutorialCoachMark _tutorialCoachMark;

  void _initialPageTour() {
    _tutorialCoachMark = TutorialCoachMark(
        targets: addBankTargets(
            cardKey: cardKey,
            moneyKey: moneyKey,
            withdrawKey: withdrawKey,
            investKey: investKey),
        colorShadow: Colors.white,
        paddingFocus: 10,
        hideSkip: false,
        opacityShadow: 0.3,
        onFinish: () {
          // The tour finshes here. You can add it to local storage to avoid showing again
          print('Finished Tour');
        },
        onSkip: () {
          // The tour finshes here. You can add it to local storage to avoid showing again
          print('Skipped');
        });
  }

  void _ShowTour() {
    Future.delayed(const Duration(seconds: 1),
        () => _tutorialCoachMark.show(context: context));
  }

  @override
  void initState() {
    super.initState();

    _initialPageTour();
    _ShowTour();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF292D32),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Center(
          child: Container(
            key: cardKey,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.white.withOpacity(0.1),
                  offset: const Offset(-6.0, -6.0),
                  blurRadius: 16.0,
                ),
                BoxShadow(
                  color: Colors.black.withOpacity(0.4),
                  offset: const Offset(6.0, 6.0),
                  blurRadius: 16.0,
                ),
              ],
              color: const Color(0xFF292D32),
              borderRadius: BorderRadius.circular(12.0),
            ),
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Total Amount:\n \$240,000,000',
                  key: moneyKey,
                  style: const TextStyle(
                      color: Color.fromARGB(255, 212, 212, 212),
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                        key: withdrawKey,
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                        ),
                        child: const Text('Withdraw',
                            style: TextStyle(color: Colors.white))),
                    ElevatedButton(
                        key: investKey,
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                        ),
                        child: const Text('Invest',
                            style: TextStyle(color: Colors.white))),
                  ],
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}
