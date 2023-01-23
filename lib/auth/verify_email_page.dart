import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:penge_send/constants/colour_const.dart';
import 'package:penge_send/resources/global_methods.dart';
import 'package:penge_send/screens/passcode.dart';
import 'package:penge_send/screens/widgets/button.dart';
import 'package:penge_send/screens/widgets/test_widget.dart';

class VerifyEmailPage extends StatefulWidget {
  const VerifyEmailPage({super.key});

  @override
  State<VerifyEmailPage> createState() => _VerifyEmailPageState();
}

class _VerifyEmailPageState extends State<VerifyEmailPage> {
  bool isEmailVerified = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Timer? timer;
  bool isLoading = false;
  bool canResendEmail = false;
  @override
  void initState() {
    isEmailVerified = _auth.currentUser!.emailVerified;
    if (!isEmailVerified) {
      sendVerificationEmail();
      timer = Timer.periodic(
          const Duration(seconds: 3), (_) => checkEmailVerified());
    }
    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  Future<void> checkEmailVerified() async {
    await _auth.currentUser!.reload();
    setState(() {
      isEmailVerified = _auth.currentUser!.emailVerified;
    });
    if (isEmailVerified) {
      timer?.cancel();
    }
  }

  void sendVerificationEmail() async {
    final user = _auth.currentUser!;
    try {
      await user.sendEmailVerification();
      setState(() => canResendEmail = false);
      Future.delayed(const Duration(seconds: 3));
      setState(() => canResendEmail = true);
    } catch (error) {
      showSnackBar(context, error.toString());
    }
  }

  @override
  Widget build(BuildContext context) => isEmailVerified
      ? const PasscodePage()
      : Scaffold(
          appBar: AppBar(
            title: const TextWidget(title: 'Verify Email'),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const TextWidget(
                title: 'A verification to your email',
                fontsize: 18,
              ),
              InkWell(
                onTap: (() {
                  canResendEmail ? sendVerificationEmail() : () {};
                }),
                child: Button(
                  title: 'Resend Email',
                  hasIcon: true,
                ),
              ),
              Center(
                child: TextButton(
                    onPressed: (() => _auth.signOut()),
                    child: const TextWidget(
                      title: 'Cancel',
                      color: kWhite,
                    )),
              )
            ],
          ),
        );
}
