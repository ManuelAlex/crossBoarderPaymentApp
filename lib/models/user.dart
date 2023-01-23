import 'package:penge_send/models/transaction_details.dart';
import 'package:penge_send/models/user_contacts.dart';

class User {
  //auth
  final String uid;
  final String surname;
  final String name;
  final String email;
  final String phoneNumber;
  final String address;
  final String password;
  //payment
  final double walletAmout;
  final double paymentLimit;
  final double withdrawalLimit;
  final List<TranactionDetails> transactionHistory;
  final List<UserContacts> userContacts;

  User(
      {required this.uid,
      required this.surname,
      required this.name,
      required this.email,
      required this.phoneNumber,
      required this.address,
      required this.password,
      required this.walletAmout,
      required this.paymentLimit,
      required this.withdrawalLimit,
      required this.transactionHistory,
      required this.userContacts});

  Map<String, dynamic> toJson() => {
        "surname": surname,
        "uid": uid,
        "name": name,
        "email": email,
        "password": password,
        "phoneNumber": phoneNumber,
        "address": address,
        "walletAmount": walletAmout,
        "paymentLimit": paymentLimit,
        "withdrawalLimit": withdrawalLimit,
        "transactionHistory": transactionHistory,
        "userContacts": userContacts
      };
}
