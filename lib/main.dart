import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:penge_send/auth/login_screen.dart';
import 'package:penge_send/auth/register.dart';
import 'package:penge_send/auth/verify_email_page.dart';
import 'package:penge_send/constants/colour_const.dart';
import 'package:penge_send/screens/passcode.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  );
  await Firebase.initializeApp();
  runApp(const PengeSend());
}

class PengeSend extends StatelessWidget {
  const PengeSend({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Penge',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: kScalfoldBackgroundColour,
      ),
      // home: const PlatformCheck(
      //   androidPlatform: AndroidPlatform(),
      //   iosplatform: IosPlatform(),
      // ),
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (
          BuildContext context,
          snapshot,
        ) {
          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.hasData) {
              return const VerifyEmailPage();
            } else if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            }
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: kScalfoldBackgroundColour,
              ),
            );
          }
          return const Login();
        },
      ),
    );
  }
}
