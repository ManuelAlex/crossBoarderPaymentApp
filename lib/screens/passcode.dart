import 'package:flutter/material.dart';

import 'package:penge_send/constants/colour_const.dart';

import 'package:penge_send/screens/widgets/test_widget.dart';

class PasscodePage extends StatefulWidget {
  const PasscodePage({super.key});

  @override
  State<PasscodePage> createState() => _PasscodePageState();
}

class _PasscodePageState extends State<PasscodePage> {
  List<Dots> dots = [];

  @override
  void initState() {
    super.initState();
  }

  final List _passValues = [];
  void addToList(value) {
    _passValues.add(value);
  }

  void removeFromList() {
    _passValues.removeLast();
  }

  void buttonFunc(keyboard) {
    if (_passValues.length != 4) {
      addToList(keyboard);
      setState(() {
        dots.add(const Dots(color: Colors.red));
      });
    } else {
      _passValues.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 3,
            child: Column(
              children: [
                const SizedBox(
                  height: 60,
                ),
                const TextWidget(
                  title: 'Penge Send',
                  fontsize: 30,
                ),
                const SizedBox(
                  height: 30,
                ),
                const TextWidget(
                  title: 'Enter your Pin',
                  fontsize: 20,
                  fontWeight: FontWeight.normal,
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Dots>[
                    Dots(
                      color:
                          _passValues.isNotEmpty ? Colors.purple : Colors.grey,
                    ),
                    Dots(
                      color:
                          _passValues.length > 1 ? Colors.purple : Colors.grey,
                    ),
                    Dots(
                      color:
                          _passValues.length > 2 ? Colors.purple : Colors.grey,
                    ),
                    Dots(
                      color:
                          _passValues.length > 3 ? Colors.purple : Colors.grey,
                    )
                  ],
                ),
                const SizedBox(
                  height: 80,
                ),
                const TextWidget(
                  title: 'Forgot your Pin?',
                  fontsize: 14,
                  fontWeight: FontWeight.normal,
                ),
              ],
            ),
          ),
          //number keyboard
          Expanded(
            flex: 2,
            child: Container(
              color: kWhite,
              child: Column(children: [
                Expanded(
                  child: Row(
                    children: [
                      PasscodeKeyboardNumbers(
                          keyboardValue: '1',
                          ispressed: () {
                            int keyboard = 1;
                            buttonFunc(keyboard);
                          }),
                      PasscodeKeyboardNumbers(
                          keyboardValue: '2',
                          ispressed: () {
                            int keyboard = 2;
                            buttonFunc(keyboard);
                          }),
                      PasscodeKeyboardNumbers(
                          keyboardValue: '3',
                          ispressed: () {
                            int keyboard = 3;
                            buttonFunc(keyboard);
                          })
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      PasscodeKeyboardNumbers(
                          keyboardValue: '4',
                          ispressed: () {
                            int keyboard = 4;
                            buttonFunc(keyboard);
                          }),
                      PasscodeKeyboardNumbers(
                          keyboardValue: '5',
                          ispressed: () {
                            int keyboard = 5;
                            buttonFunc(keyboard);
                          }),
                      PasscodeKeyboardNumbers(
                          keyboardValue: '6',
                          ispressed: () {
                            int keyboard = 6;
                            buttonFunc(keyboard);
                          })
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      PasscodeKeyboardNumbers(
                          keyboardValue: '7',
                          ispressed: () {
                            int keyboard = 7;
                            buttonFunc(keyboard);
                          }),
                      PasscodeKeyboardNumbers(
                          keyboardValue: '8',
                          ispressed: () {
                            int keyboard = 8;
                            buttonFunc(keyboard);
                          }),
                      PasscodeKeyboardNumbers(
                          keyboardValue: '9',
                          ispressed: () {
                            int keyboard = 9;
                            buttonFunc(keyboard);
                          })
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      PasscodeKeyboardNumbers(
                          keyboardValue: '', ispressed: () {}),
                      PasscodeKeyboardNumbers(
                          keyboardValue: '0',
                          ispressed: () {
                            int keyboard = 0;
                            buttonFunc(keyboard);
                          }),
                      PasscodeKeyboardNumbers(
                          keyboardValue: '<',
                          ispressed: () {
                            setState(() {
                              removeFromList();
                            });
                          }),
                    ],
                  ),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}

class PasscodeKeyboardNumbers extends StatelessWidget {
  final String keyboardValue;
  final Function() ispressed;
  const PasscodeKeyboardNumbers(
      {super.key, required this.keyboardValue, required this.ispressed()});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: ispressed,
        child: Center(
          child: Text(
            keyboardValue,
            style: const TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

class Dots extends StatelessWidget {
  final Color color;
  final double fontSize;
  const Dots({super.key, required this.color, this.fontSize = 40});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        '.',
        style: TextStyle(
            color: color, fontSize: fontSize, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class PasscodeFunc with ChangeNotifier {
  final List _passValues = [];
  void addToList(value) {
    _passValues.add(value);
  }

  void removeFromList(value) {
    _passValues.add(value);
  }
}
