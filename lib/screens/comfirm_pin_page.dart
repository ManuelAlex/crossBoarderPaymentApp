// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:penge_send/auth/passcode_brain.dart';
import 'package:penge_send/constants/colour_const.dart';
import 'package:penge_send/platform/android_platform/android_platform.dart';
import 'package:penge_send/resources/global_methods.dart';
import 'package:penge_send/screens/widgets/key_minus.dart';
import 'package:penge_send/screens/widgets/keyboard_num.dart';
import 'package:penge_send/screens/widgets/test_widget.dart';

class ComfirmPinPageScreen extends StatefulWidget {
  const ComfirmPinPageScreen({super.key});

  @override
  State<ComfirmPinPageScreen> createState() => _ComfirmPinPageScreenState();
}

class _ComfirmPinPageScreenState extends State<ComfirmPinPageScreen> {
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
  String? _isComfired;
  void onCLick(String set) async {
    await myPassSecStore.passcodeComfirPinSetUp(passValue: set);
  }

  void onload() async {
    _isComfired = await const FlutterSecureStorage().read(key: 'PassCodekey');
  }

  Future<void> comfirm(String pwStr) async {
    if (_isComfired == pwStr) {
      await const FlutterSecureStorage()
          .write(key: 'setPasscodekey', value: pwStr);
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const AndroidPlatform()));
    } else {
      showSnackBar(context, "your Pin do not match");
    }
  }

  @override
  void initState() {
    onload();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                  const TextWidget(
                    title: 'Comfirm  your Pin',
                    color: Colors.white70,
                    fontWeight: FontWeight.bold,
                    fontsize: 21,
                  ),
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
      pinIndex = 0;
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
    if (pinIndex == 4) {
      pinIndex = 1;
    } else if (pinIndex < 4) {
      pinIndex++;
      setPin(pinIndex, pinText);
      // print();
      currentPin[pinIndex - 1] = pinText;
      String strPin = "";
      for (var element in currentPin) {
        strPin += element;
      }
      if (pinIndex == 4) {
        onCLick(strPin);

        print('this is me $_isComfired');
        comfirm(strPin);
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
