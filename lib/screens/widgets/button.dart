import 'package:flutter/material.dart';
import 'package:penge_send/constants/colour_const.dart';
import 'package:penge_send/constants/styles_const.dart';

class Button extends StatelessWidget {
  final String title;
  final Color color;
  bool hasIcon;
  IconData iconData;

  Button(
      {super.key,
      required this.title,
      this.color = kScalfoldBackgroundColour,
      this.hasIcon = false,
      this.iconData = Icons.email});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
          color: color,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 4,
              offset: const Offset(1, 3), // changes position of shadow
            ),
          ],
          borderRadius: const BorderRadius.all(Radius.circular(4))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          hasIcon ? Icon(iconData) : Container(),
          Text(
            title,
            style: kRichTextStyle.copyWith(color: kScalfoldBackgroundColour),
          ),
        ],
      ),
    );
  }
}
