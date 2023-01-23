import 'package:flutter/material.dart';
import 'package:penge_send/auth/auth_method.dart';
import 'package:penge_send/auth/register.dart';
import 'package:penge_send/constants/colour_const.dart';
import 'package:penge_send/constants/styles_const.dart';
import 'package:penge_send/resources/global_methods.dart';
import 'package:penge_send/screens/widgets/textfield_input.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late final TextEditingController emailTextEditingCtrl;
  late final TextEditingController passwordTextEditingCtrl;
  bool _isloading = false;
  @override
  void initState() {
    emailTextEditingCtrl = TextEditingController();
    passwordTextEditingCtrl = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailTextEditingCtrl.dispose();
    passwordTextEditingCtrl.dispose();
    super.dispose();
  }

  void loginUser() async {
    setState(() => _isloading = true);
    String res = await AuthMethod().login(
        email: emailTextEditingCtrl.text.trim(),
        password: passwordTextEditingCtrl.text.trim());
    if (res == 'success') {
    } else {
      showSnackBar(context, res);
    }
    setState(() => _isloading = true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 10,
              ),
              //name
              Text(
                'Penge Send',
                style: kRichTextStyle.copyWith(
                    fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 60,
              ),
              //container wrapper
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: kwalletContainerColour,
                      borderRadius: BorderRadius.all(Radius.circular(4))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TexteildInput(
                        title: 'Email',
                        hintText: 'please enter you Email',
                        textEditingController: emailTextEditingCtrl,
                        keyBoardType: TextInputType.emailAddress,
                      ),
                      TexteildInput(
                        title: 'Password',
                        hintText: 'please enter you password',
                        textEditingController: passwordTextEditingCtrl,
                        keyBoardType: TextInputType.number,
                        isPasswprd: true,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              InkWell(
                onTap: () {
                  loginUser();
                },
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  decoration: BoxDecoration(
                      color: kwalletContainerColour,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 4,
                          offset:
                              const Offset(1, 3), // changes position of shadow
                        ),
                      ],
                      borderRadius: const BorderRadius.all(Radius.circular(4))),
                  child: _isloading
                      ? const CircularProgressIndicator(
                          color: kScalfoldBackgroundColour,
                        )
                      : Text(
                          'Login',
                          style: kRichTextStyle.copyWith(
                              color: kScalfoldBackgroundColour),
                        ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: const Text('Don\t have an accout ?'),
                  ),
                  GestureDetector(
                    onTap: (() {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Register()));
                    }),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: const Text(
                        ' Register Here',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
