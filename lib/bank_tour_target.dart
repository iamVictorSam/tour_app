import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

List<TargetFocus> addBankTargets({
  required GlobalKey cardKey,
  required GlobalKey moneyKey,
  required GlobalKey withdrawKey,
  required GlobalKey investKey,
}) {
  List<TargetFocus> targets = [];
  targets.add(
    TargetFocus(
      keyTarget: cardKey,
      alignSkip: Alignment.bottomRight,
      shape: ShapeLightFocus.RRect,
      radius: 10,
      contents: [
        TargetContent(
          align: ContentAlign.bottom,
          builder: (context, controller) => Container(
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Text('Here is your Bank!!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 25,
                    )),
              ],
            ),
          ),
        ),
      ],
    ),
  );

  targets.add(
    TargetFocus(
      keyTarget: moneyKey,
      alignSkip: Alignment.bottomLeft,
      shape: ShapeLightFocus.RRect,
      radius: 10,
      contents: [
        TargetContent(
          align: ContentAlign.top,
          builder: (context, controller) => Container(
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Text('This is your Current amount',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 25,
                    ))
              ],
            ),
          ),
        ),
      ],
    ),
  );

  targets.add(
    TargetFocus(
      keyTarget: withdrawKey,
      alignSkip: Alignment.topRight,
      shape: ShapeLightFocus.RRect,
      radius: 10,
      contents: [
        TargetContent(
          align: ContentAlign.bottom,
          builder: (context, controller) => Container(
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Text('You can withdraw your cash!!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 25,
                    ))
              ],
            ),
          ),
        ),
      ],
    ),
  );

  targets.add(
    TargetFocus(
      keyTarget: investKey,
      alignSkip: Alignment.topRight,
      shape: ShapeLightFocus.RRect,
      radius: 10,
      contents: [
        TargetContent(
          align: ContentAlign.bottom,
          builder: (context, controller) => Container(
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Text('Or, invest it and get a double',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ))
              ],
            ),
          ),
        ),
      ],
    ),
  );

  return targets;
}
