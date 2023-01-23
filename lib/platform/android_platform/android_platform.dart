import 'package:flutter/material.dart';
import 'package:penge_send/constants/styles_const.dart';
import 'package:penge_send/screens/widgets/activity_avatar.dart';
import 'package:penge_send/screens/widgets/dottet_circle_icon.dart';

import 'package:penge_send/screens/widgets/profile_display.dart';
import 'package:penge_send/screens/widgets/transaction_history.dart';
import 'package:penge_send/screens/widgets/wallet_container.dart';

class AndroidPlatform extends StatelessWidget {
  const AndroidPlatform({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              ProfileDisplay(),
              WalletContainer(),
              ActiveCircleIcons(),
              DottedCircleIcon(),
              TransanctionHistory(),
            ],
          ),
        ),
      ),
    );
  }
}

class ActiveCircleIcons extends StatelessWidget {
  const ActiveCircleIcons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ActivityAvater(
          iconData: Icons.send,
          boxDecoration: kCircleIconHumanAvatar.copyWith(
              color: Colors.lightBlue.withOpacity(0.5)),
          color: Colors.lightBlue,
          turns: 3,
          myText: 'send',
        ),
        const SizedBox(
          width: 10,
        ),
        ActivityAvater(
          iconData: Icons.payment,
          boxDecoration: kCircleIconHumanAvatar.copyWith(
              color: Colors.red.withOpacity(0.5)),
          color: Colors.red,
          myText: 'Pay',
        ),
        const SizedBox(
          width: 10,
        ),
        ActivityAvater(
          iconData: Icons.wallet,
          boxDecoration: kCircleIconHumanAvatar.copyWith(
              color: Colors.green.withOpacity(0.5)),
          color: Colors.green,
          myText: 'Withdraw',
        ),
        const SizedBox(
          width: 10,
        ),
        ActivityAvater(
          iconData: Icons.money,
          boxDecoration: kCircleIconHumanAvatar.copyWith(
              color: Colors.purple.withOpacity(0.5)),
          color: Colors.purple,
          myText: 'bill',
        ),
        const SizedBox(
          width: 10,
        ),
        ActivityAvater(
          iconData: Icons.stairs,
          boxDecoration: kCircleIconHumanAvatar.copyWith(
              color: Colors.orange.withOpacity(0.5)),
          color: Colors.orange,
          myText: 'voucher',
        ),
      ],
    );
  }
}
