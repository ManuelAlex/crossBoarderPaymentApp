import 'package:flutter/material.dart';
import 'package:penge_send/constants/colour_const.dart';

class TextWidget extends StatelessWidget {
  final String title;
  final Color color;
  final double fontsize;
  final FontWeight fontWeight;
  const TextWidget(
      {super.key,
      required this.title,
      this.color = kWhite,
      this.fontsize = 18,
      this.fontWeight = FontWeight.bold});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: color,
        fontSize: fontsize,
        fontWeight: fontWeight,
      ),
    );
  }
}
