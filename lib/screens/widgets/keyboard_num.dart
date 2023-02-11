import 'package:flutter/material.dart';
import 'package:penge_send/constants/colour_const.dart';

class KeyBoardNumber extends StatelessWidget {
  final int n;
  final Function() oppressed;
  const KeyBoardNumber({super.key, required this.n, required this.oppressed()});

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
        child: Text(
          '$n',
          style: TextStyle(
              fontSize: 24 * MediaQuery.of(context).textScaleFactor,
              color: kWhite),
        ),
      ),
    );
  }
}
