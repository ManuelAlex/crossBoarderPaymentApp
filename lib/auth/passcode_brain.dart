import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:penge_send/resources/global_methods.dart';

class PasscodeSecureStorage {
  static const setPassCodekey = 'setPasscodekey';
  String? passCode;
  static const _passCodekey = 'PassCodekey';

  static const _comfirmPasscodekey = 'comfirmPasscodekey';

  static const FlutterSecureStorage myPassStorage = FlutterSecureStorage();
//read user pincode status
  Future<bool> hasPassCode() async {
    String setPassCode =
        (await myPassStorage.read(key: "setPassCodekey")) ?? '';
    if (setPassCode == '') {
      return false;
    }
    return true;
  }

  Future<String> hasPassString() async {
    String setPassCode =
        (await myPassStorage.read(key: "_setPassCodekey")) ?? '';
    if (setPassCode == '') {
      return "empty";
    }
    return "success";
  }

//write to set first passcode
  Future<void> passcodeSetUp({required String passValue}) async {
    await myPassStorage.write(key: _passCodekey, value: passValue);
    print('successful in pw1scrn');
    print(passValue);
    return;
  }

  Future<void> passcodeComfirPinSetUp({required String passValue}) async {
    await myPassStorage.write(key: _comfirmPasscodekey, value: passValue);
  }

  //write to set comfirm passcode
//   Future<String> comfirmPasscodeSetUp({required String comfirmPw}) async {
//     String setPassCode = (await myPassStorage.read(key: _passCodekey)) ?? '';
//     String comfirmPasscode = comfirmPw;
//     String res = 'emptyklll';
//     if ((setPassCode) == (comfirmPw)) {
//       await myPassStorage.write(key: setPassCodekey, value: comfirmPasscode);
//       print(comfirmPasscode);
//       res = 'success';
//       return res;
//     } else {
//       print(res);
//     }

//     return res;
//   }
}
