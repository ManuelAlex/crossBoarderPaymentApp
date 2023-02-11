import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:penge_send/models/user.dart' as model;
import 'package:flutter/material.dart';
import 'package:penge_send/auth/login_screen.dart';
import 'package:penge_send/constants/colour_const.dart';
import 'package:penge_send/constants/styles_const.dart';
import 'package:penge_send/provider/user_provider.dart';
import 'package:penge_send/screens/widgets/circle_icon_avata.dart';
import 'package:penge_send/screens/widgets/test_widget.dart';
import 'package:provider/provider.dart';

class ProfileDisplay extends StatefulWidget {
  const ProfileDisplay({super.key});

  @override
  State<ProfileDisplay> createState() => _ProfileDisplayState();
}

class _ProfileDisplayState extends State<ProfileDisplay> {
  // Future<void> getUserName() async {
  //   DocumentSnapshot snap = await FirebaseFirestore.instance
  //       .collection('users')
  //       .doc(FirebaseAuth.instance.currentUser!.uid)
  //       .get();
  //   print(snap.data());
  //   setState(() {
  //     user = (snap.data() as Map<String, dynamic>)['name'];
  //   });
  // }

  void logOut() async {
    await FirebaseAuth.instance.signOut();
    // ignore: use_build_context_synchronously
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: ((context) => const Login())));
  }

  @override
  Widget build(BuildContext context) {
    model.User user = Provider.of<UserProvider>(context).getUser;
    print(user);
    return Expanded(
      flex: 2,
      child: Padding(
        padding: const EdgeInsets.only(top: 8),
        child: Row(
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
                  text: TextSpan(
                    text: user.name,
                    style: kRichSmallTextStyle,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Row(
              children: [
                TextButton(
                    onPressed: () {
                      logOut();
                    },
                    child: const TextWidget(title: 'LogOut')),
                const CirclcleIconAvater(
                  iconData: Icons.person,
                  boxDecoration: kCircleIconHumanAvatar,
                  color: kCircleAvataIconColour,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
