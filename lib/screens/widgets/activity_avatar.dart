import 'package:flutter/material.dart';
import 'package:penge_send/constants/colour_const.dart';
import 'package:penge_send/constants/styles_const.dart';

class ActivityAvater extends StatelessWidget {
  final IconData iconData;
  final Color color;
  final BoxDecoration boxDecoration;
  final int turns;
  final String myText;

  const ActivityAvater(
      {super.key,
      required this.iconData,
      required this.boxDecoration,
      required this.color,
      required this.myText,
      this.turns = 0});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          AnimatedContainer(
            duration: kThemeChangeDuration,
            decoration: boxDecoration,
            child: Padding(
                padding: const EdgeInsets.all(8),
                child: RotatedBox(
                  quarterTurns: turns,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      iconData,
                      color: color,
                    ),
                  ),
                )),
          ),
          const SizedBox(height: 10),
          Text(
            myText,
            style:
                kwalletBalanceDecoration.copyWith(fontSize: 12, color: kWhite),
          ),
        ],
      ),
    );
  }
}
