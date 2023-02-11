import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:penge_send/models/user.dart' as model;

class AuthMethod {
  static final FirebaseAuth _auth = FirebaseAuth.instance;
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
        String userUid = credSignUp.user!.uid;

        print(credSignUp.user!.uid);
        model.User user = model.User(
          uid: userUid,
          surname: '',
          name: name,
          email: email,
          phoneNumber: '',
          address: '',
          password: password,
          walletAmout: 0.00,
          paymentLimit: 1000000,
          withdrawalLimit: 5000000,
          transactionHistory: [],
          userContacts: [],
        );
        _firestore.collection('users').doc(userUid).set(user.toJson());
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

  Future<model.User> getUserDetails() async {
    User currentUser = _auth.currentUser!;

    DocumentSnapshot docSnapUser =
        await _firestore.collection('users').doc(currentUser.uid).get();

    return model.User.fromSnap(snap: docSnapUser);
  }
}
