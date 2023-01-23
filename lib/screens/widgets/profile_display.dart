import 'package:flutter/material.dart';
import 'package:penge_send/constants/colour_const.dart';
import 'package:penge_send/constants/styles_const.dart';
import 'package:penge_send/screens/widgets/circle_icon_avata.dart';

class ProfileDisplay extends StatelessWidget {
  const ProfileDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: const TextSpan(
                text: 'Welcome back 👋🏻',
                style: kRichTextStyle,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            RichText(
              text: const TextSpan(
                text: 'Ayoub',
                style: kRichSmallTextStyle,
              ),
            ),
          ],
        ),
        const Spacer(),
        const CirclcleIconAvater(
          iconData: Icons.person,
          boxDecoration: kCircleIconHumanAvatar,
          color: kCircleAvataIconColour,
        ),
      ],
    );
  }
}
