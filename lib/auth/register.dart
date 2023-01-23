import 'package:flutter/material.dart';
import 'package:penge_send/auth/auth_method.dart';
import 'package:penge_send/auth/login_screen.dart';
import 'package:penge_send/auth/verify_email_page.dart';
import 'package:penge_send/constants/colour_const.dart';
import 'package:penge_send/constants/styles_const.dart';
import 'package:penge_send/resources/global_methods.dart';
import 'package:penge_send/screens/widgets/textfield_input.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  // final AuthMethod authMethod = AuthMethod();
  late final TextEditingController nameTextEditingCtrl;
  late final TextEditingController emailTextEditingCtrl;
  late final TextEditingController passwordTextEditingCtrl;
  bool _isLoading = false;

  @override
  void initState() {
    nameTextEditingCtrl = TextEditingController();
    emailTextEditingCtrl = TextEditingController();
    passwordTextEditingCtrl = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    nameTextEditingCtrl.dispose();
    emailTextEditingCtrl.dispose();
    passwordTextEditingCtrl.dispose();
    super.dispose();
  }

  void registerUser() async {
    setState(() => _isLoading = true);
    String res = await AuthMethod().sighUp(
        email: emailTextEditingCtrl.text.trim(),
        password: passwordTextEditingCtrl.text.trim(),
        name: nameTextEditingCtrl.text);
    if (res == 'success') {
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const VerifyEmailPage()));
    } else {
      showSnackBar(context, res);
    }
    setState(() => _isLoading = false);
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
                        title: 'Name',
                        hintText: 'please enter you name',
                        textEditingController: nameTextEditingCtrl,
                        keyBoardType: TextInputType.name,
                      ),
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
                        keyBoardType: TextInputType.visiblePassword,
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
                onTap: () async {
                  registerUser();
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
                  child: _isLoading
                      ? const CircularProgressIndicator(
                          color: kScalfoldBackgroundColour,
                        )
                      : Text(
                          'Register',
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
                    child: const Text('Already have an account ?'),
                  ),
                  GestureDetector(
                    onTap: (() {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Login()));
                    }),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: const Text(
                        ' Login Here',
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
