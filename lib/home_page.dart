import 'package:flutter/material.dart';
import 'package:tour_app/main.dart';
import 'package:tour_app/tour_target.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final wealthKey = GlobalKey();
  final profileKey = GlobalKey();
  final buttonKey = GlobalKey();
  final pageKey = GlobalKey();

  bool reveal = false;

  late TutorialCoachMark _tutorialCoachMark;

  void _initialPageTour() {
    _tutorialCoachMark = TutorialCoachMark(
        targets: addTourTargets(
            pageKey: pageKey,
            profileKey: profileKey,
            wealthKey: wealthKey,
            buttonKey: buttonKey),
        colorShadow: Colors.teal,
        paddingFocus: 10,
        hideSkip: false,
        opacityShadow: 0.8,
        onFinish: () {
          // The tour finshes here. You can add it to local storage to avoid showing again
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const BankScreen(),
              ));
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
      backgroundColor: const Color(0xff040404),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text('Home',
                    style: const TextStyle(color: Colors.white, fontSize: 22),
                    key: pageKey),
                CircleAvatar(
                  key: profileKey,
                  child: const Icon(Icons.person),
                ),
              ]),
              const Spacer(),
              const Text('You are Rich',
                  style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
              const SizedBox(height: 10),
              Center(
                child: FlutterLogo(
                  key: wealthKey,
                  size: MediaQuery.of(context).size.height * 0.3,
                ),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                  key: buttonKey,
                  onPressed: () => setState(() => reveal = !reveal),
                  child: const Text('Find out More...')),
              const SizedBox(height: 20),
              Visibility(
                visible: reveal,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  color: Colors.white,
                  child: const Text('Your Diamond is Worth\n \$34,000,000',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      )),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
