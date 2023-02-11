import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';
import 'package:penge_send/constants/colour_const.dart';
import 'package:penge_send/constants/styles_const.dart';

class DottedCircleIcon extends StatelessWidget {
  const DottedCircleIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 15),
          Text(
            'Send Money',
            style: kwalletBalanceDecoration.copyWith(
                fontSize: 18, color: kWhite, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              DottedAddContainer(
                paddingValue: 16,
                iconOrImage: const Icon(
                  Icons.person,
                  color: kWhite,
                ),
                boxDecoration: kCircleIconHumanAvatar.copyWith(
                    color: kScalfoldBackgroundColour),
                color: kWhite,
                myText: '+ Add',
              ),
              DottedAddContainer(
                  iconOrImage: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                    child: Image.asset(
                      'lib/assets/images/black_pink_guy_avatar.png',
                      width: 42,
                      fit: BoxFit.contain,
                    ),
                  ),
                  boxDecoration: kCircleIconHumanAvatar,
                  color: kScalfoldBackgroundColour,
                  myText: 'Ayoub'),
              DottedAddContainer(
                  iconOrImage: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                    child: Image.asset(
                      'lib/assets/images/yellow_cute_guy_avatar.png',
                      width: 42,
                      fit: BoxFit.contain,
                    ),
                  ),
                  boxDecoration: kCircleIconHumanAvatar,
                  color: kScalfoldBackgroundColour,
                  myText: 'Baba'),
              DottedAddContainer(
                  iconOrImage: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                    child: Image.asset(
                      'lib/assets/images/yellow_cute_girl_avatar.png',
                      width: 42,
                      fit: BoxFit.contain,
                    ),
                  ),
                  boxDecoration: kCircleIconHumanAvatar,
                  color: kScalfoldBackgroundColour,
                  myText: 'Mercy'),
              DottedAddContainer(
                  iconOrImage: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                    child: Image.asset(
                      'lib/assets/images/yellow_cute_gir_avatar2.png',
                      width: 42,
                      fit: BoxFit.contain,
                    ),
                  ),
                  boxDecoration: kCircleIconHumanAvatar,
                  color: kScalfoldBackgroundColour,
                  myText: 'Hijab'),
            ],
          ),
        ],
      ),
    );
  }
}

class DottedAddContainer extends StatelessWidget {
  final Widget iconOrImage;
  final Color color;
  final BoxDecoration boxDecoration;
  final double paddingValue;

  final String myText;

  const DottedAddContainer(
      {super.key,
      required this.iconOrImage,
      required this.boxDecoration,
      required this.color,
      required this.myText,
      this.paddingValue = 8});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AnimatedContainer(
            duration: kThemeChangeDuration,
            decoration: DottedDecoration(
              strokeWidth: 3,
              shape: Shape.circle,
              dash: const <int>[4, 4],
            ),
            child: Padding(
              padding: EdgeInsets.all(paddingValue),
              child: iconOrImage,
              // child: Icon(
              //   iconData,
              //   color: color,
              // ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: Text(
              myText,
              style: kwalletBalanceDecoration.copyWith(
                  fontSize: 12, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
