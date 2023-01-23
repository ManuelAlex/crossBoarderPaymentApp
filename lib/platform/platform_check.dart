import 'package:flutter/material.dart';
import 'dart:io' show Platform;

class PlatformCheck extends StatelessWidget {
  final Widget iosplatform;
  final Widget androidPlatform;
  const PlatformCheck(
      {super.key, required this.iosplatform, required this.androidPlatform});

  Widget getPlatform() {
    if (Platform.isIOS) {
      return iosplatform;
    }
    return androidPlatform;
  }

  @override
  Widget build(BuildContext context) {
    return getPlatform();
  }
}
