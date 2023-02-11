import 'package:flutter/material.dart';
import 'package:penge_send/screens/widgets/test_widget.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: TextWidget(title: 'User Screen'),
      )),
    );
  }
}
