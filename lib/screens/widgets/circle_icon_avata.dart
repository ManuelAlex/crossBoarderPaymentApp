import 'package:flutter/material.dart';

class CirclcleIconAvater extends StatelessWidget {
  final IconData iconData;
  final Color color;
  final BoxDecoration boxDecoration;
  const CirclcleIconAvater(
      {super.key,
      required this.iconData,
      required this.boxDecoration,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: kThemeChangeDuration,
      decoration: boxDecoration,
      child: Padding(
          padding: const EdgeInsets.all(8),
          child: Icon(
            iconData,
            color: color,
          )),
    );
  }
}
