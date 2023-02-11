import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:penge_send/constants/colour_const.dart';
import 'package:penge_send/models/user.dart' as model;

import 'package:penge_send/provider/user_provider.dart';
import 'package:penge_send/resources/global_methods.dart';

import 'package:penge_send/screens/pincode.dart';
import 'package:penge_send/screens/widgets/button.dart';
import 'package:penge_send/screens/widgets/test_widget.dart';

import 'package:provider/provider.dart';

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
      // loadUserDetails();
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: isEmailVerified
          ? null
          : AppBar(
              title: const TextWidget(title: 'Verify Email'),
            ),
      body: isEmailVerified
          ? const PinCode()
          : Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const TextWidget(
                    title: 'A verification has been sent to your email',
                    fontsize: 18,
                  ),
                  const SizedBox(height: 100),
                  InkWell(
                    onTap: (() {
                      canResendEmail ? sendVerificationEmail() : () {};
                    }),
                    child: Button(
                      title: 'Resend Email',
                      hasIcon: true,
                      color: kwalletContainerColour,
                    ),
                  ),
                  const SizedBox(height: 20),
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
            ),
    );
  }
}

class PushNav extends StatefulWidget {
  const PushNav({super.key});
  @override
  State<PushNav> createState() => _PushNavState();
}

class _PushNavState extends State<PushNav> {
  @override
  void initState() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const PinCode()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator();
  }
}
