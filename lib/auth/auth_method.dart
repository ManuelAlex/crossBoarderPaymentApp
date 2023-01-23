import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class AuthMethod {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  //sign up
  Future<String> sighUp({
    required String email,
    required String password,
    required String name,
  }) async {
    String res = 'some error occur';
    try {
      if (email.isNotEmpty || name.isNotEmpty || password.isNotEmpty) {
        UserCredential credSignUp = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        print(credSignUp.user!.uid);
        String userUid = credSignUp.user!.uid;
        _firestore.collection('users').doc(credSignUp.user!.uid).set({
          "uid": userUid,
          "name": name,
          "passcode": 0000,
          "phoneNumber": '',
          "address": '',
          "walletAmount": 0.00,
          "paymentLimit": 1000000,
          "withdrawalLimit": 5000000,
          "transactionHistory": [],
          "userContacts": [],
          "createdAt": FieldValue.serverTimestamp(),
        });
      }

      res = 'success';
    } catch (error) {
      res = error.toString();
    }

    return res;
  }
  //login

  Future<String> login({
    required String email,
    required String password,
  }) async {
    String res = 'some error occured';
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        //credLogin.user!.uid;
        res = 'succes';
      }
    } catch (error) {
      error.toString();
    }

    return res;
  }
}
