import 'package:flutter/material.dart';
import 'package:penge_send/constants/colour_const.dart';

class KeyBoardMinus extends StatelessWidget {
  final Function() oppressed;
  const KeyBoardMinus({super.key, required this.oppressed()});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: kScalfoldBackgroundColour.withOpacity(0.1),
      ),
      alignment: Alignment.center,
      child: MaterialButton(
          onPressed: oppressed,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          child: Icon(
            Icons.arrow_back,
            size: 24 * MediaQuery.of(context).textScaleFactor,
            color: kWhite,
          )),
    );
  }
}
