// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:penge_send/auth/passcode_brain.dart';
import 'package:penge_send/constants/colour_const.dart';
import 'package:penge_send/platform/android_platform/android_platform.dart';
import 'package:penge_send/provider/user_provider.dart';
import 'package:penge_send/resources/global_methods.dart';
import 'package:penge_send/screens/setup_pin_screeen.dart';
import 'package:penge_send/screens/widgets/key_minus.dart';
import 'package:penge_send/screens/widgets/keyboard_num.dart';
import 'package:penge_send/screens/widgets/test_widget.dart';
import 'package:provider/provider.dart';

class PinCode extends StatefulWidget {
  const PinCode({super.key});

  @override
  State<PinCode> createState() => _PinCodeState();
}

String _checkStr = '';

class _PinCodeState extends State<PinCode> {
  //bool pinStatus = false;
  // Future<void> mySpinState() async {
  //   pinStatus = await PasscodeSecureStorage().hasPassCode();
  // }

  Future<void> checkString() async {
    _checkStr =
        await const FlutterSecureStorage().read(key: 'setPasscodekey') ?? '';
    setState(() {
      _checkStr;
    });
  }

  Future<void> loadUserDetails() async {
    UserProvider userProvider = Provider.of(context, listen: false);
    await userProvider.refreshUser();
  }

  @override
  void initState() {
    checkString();
    loadUserDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            colors: [kScalfoldBackgroundColour, kwalletContainerColour],
            begin: Alignment.topRight),
      ),
      child: _checkStr != ''
          ? const ButtonKeyBoardScreen()
          : const SetUpInScreen(),
    );
  }
}

class ButtonKeyBoardScreen extends StatefulWidget {
  const ButtonKeyBoardScreen({super.key});

  @override
  State<ButtonKeyBoardScreen> createState() => _ButtonKeyBoardScreenState();
}

class _ButtonKeyBoardScreenState extends State<ButtonKeyBoardScreen> {
  List<String> currentPin = ["", "", "", ""];
  TextEditingController pinOneController = TextEditingController();
  TextEditingController pinTwoController = TextEditingController();
  TextEditingController pinThreeController = TextEditingController();
  TextEditingController pinFourController = TextEditingController();
  var outLineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Colors.transparent));
  int pinIndex = 0;
  final PasscodeSecureStorage myPassSecStore = PasscodeSecureStorage();
  late bool pinStatus;
  late String res;

  void clearTextField() {
    pinOneController.clear();
    pinTwoController.clear();
    pinThreeController.clear();
    pinFourController.clear();
  }

  String _checkStr = '';
  Future<void> checkStr() async {
    _checkStr =
        await const FlutterSecureStorage().read(key: 'setPasscodekey') ?? '';
    setState(() {
      _checkStr;
    });
  }

  Future<void> checkString() async {}

  @override
  void initState() {
    checkStr();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(_checkStr);
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              alignment: const Alignment(0, 0.5),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  buildSecurityText(),
                  const SizedBox(height: 40),
                  buildPinRow(),
                ],
              ),
            ),
          ),
          buildKeyBoardPad(),
        ],
      )),
    );
  }

  Widget buildKeyBoardPad() {
    return Expanded(
        child: Container(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 36),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                KeyBoardNumber(
                    n: 1,
                    oppressed: () {
                      pinIndexSetUp("1");
                    }),
                KeyBoardNumber(
                    n: 2,
                    oppressed: () {
                      pinIndexSetUp("2");
                    }),
                KeyBoardNumber(
                    n: 3,
                    oppressed: () {
                      pinIndexSetUp("3");
                    }),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                KeyBoardNumber(
                    n: 4,
                    oppressed: () {
                      pinIndexSetUp("4");
                    }),
                KeyBoardNumber(
                    n: 5,
                    oppressed: () {
                      pinIndexSetUp("5");
                    }),
                KeyBoardNumber(
                    n: 6,
                    oppressed: () {
                      pinIndexSetUp("6");
                    }),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                KeyBoardNumber(
                    n: 7,
                    oppressed: () {
                      pinIndexSetUp("7");
                    }),
                KeyBoardNumber(
                    n: 8,
                    oppressed: () {
                      pinIndexSetUp("8");
                    }),
                KeyBoardNumber(
                    n: 9,
                    oppressed: () {
                      pinIndexSetUp("9");
                    }),
              ],
            ),

            //edit for down button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(
                  height: 50,
                  width: 50,
                ),
                KeyBoardNumber(
                    n: 0,
                    oppressed: () {
                      pinIndexSetUp("0");
                    }),
                KeyBoardMinus(oppressed: () {
                  clearPin();
                }),
              ],
            ),
          ],
        ),
      ),
    ));
  }

  void clearPin() {
    if (pinIndex == 0) {
      pinIndex = 1;
    } else if (pinIndex == 4) {
      setPin(pinIndex, "");
      currentPin[pinIndex - 1] = "";
      pinIndex--;
    } else {
      setPin(pinIndex, "");
      currentPin[pinIndex - 1] = "";
      pinIndex--;
    }
  }

  void pinIndexSetUp(String pinText) {
    String strPin = "";
    if (pinIndex == 4) {
      pinIndex = 1;
    } else if (pinIndex < 4) {
      pinIndex++;
      setPin(pinIndex, pinText);
      // print();
      currentPin[pinIndex - 1] = pinText;

      for (var element in currentPin) {
        strPin += element;
      }
      if (pinIndex == 4) {
        if (_checkStr == strPin) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const AndroidPlatform()));
        } else {
          showSnackBar(context, "your Pin do not match");
          clearTextField();
          pinIndex = 0;
        }
      }
    }
  }

  void setPin(int pin, String pinText) {
    switch (pin) {
      case 1:
        pinOneController.text = pinText;
        break;
      case 2:
        pinTwoController.text = pinText;
        break;
      case 3:
        pinThreeController.text = pinText;
        break;
      case 4:
        pinFourController.text = pinText;
        break;
    }
  }

  Widget buildPinRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        PinNumber(
          outLineInputBorder: outLineInputBorder,
          textEditingController: pinOneController,
        ),
        PinNumber(
          outLineInputBorder: outLineInputBorder,
          textEditingController: pinTwoController,
        ),
        PinNumber(
          outLineInputBorder: outLineInputBorder,
          textEditingController: pinThreeController,
        ),
        PinNumber(
          outLineInputBorder: outLineInputBorder,
          textEditingController: pinFourController,
        ),
      ],
    );
  }

  Widget buildSecurityText() {
    return const TextWidget(
      title: 'Enter Your Pin',
      color: Colors.white70,
      fontWeight: FontWeight.bold,
      fontsize: 21,
    );
  }
}

class PinNumber extends StatelessWidget {
  final OutlineInputBorder outLineInputBorder;
  final TextEditingController textEditingController;
  const PinNumber({
    super.key,
    required this.outLineInputBorder,
    required this.textEditingController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      child: TextField(
        controller: textEditingController,
        enabled: false,
        obscureText: true,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(16),
          border: outLineInputBorder,
          filled: true,
          fillColor: Colors.white38,
        ),
        style: const TextStyle(fontWeight: FontWeight.bold, color: kWhite),
      ),
    );
  }
}
