import 'package:flutter/material.dart';
import 'package:penge_send/constants/colour_const.dart';
import 'package:penge_send/constants/styles_const.dart';

class TransanctionHistory extends StatelessWidget {
  const TransanctionHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 15),
        Text(
          'Transactions',
          style: kwalletBalanceDecoration.copyWith(
              fontSize: 18, color: kWhite, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        const CardContainer(
            paymentTitle: 'Netflix Subscribsion',
            paymentDate: '12:00 am 21 jun 2022',
            paymentAmount: '\$180',
            paymentImageurl:
                'lib/assets/images/transaction_image/Untitled design (2).png'),
        const SizedBox(height: 2),
        const CardContainer(
            paymentTitle: 'Apple Subscribsion',
            paymentDate: '09:00 am 19 jun 2022',
            paymentAmount: '\$17',
            paymentImageurl:
                'lib/assets/images/transaction_image/Untitled design (3).png'),
        const SizedBox(height: 2),
        const CardContainer(
            paymentTitle: 'Dribbble Subscribsion',
            paymentDate: '06:00 am 17 jun 2022',
            paymentAmount: '\$9.99',
            paymentImageurl:
                'lib/assets/images/transaction_image/Untitled design (1).png'),
      ],
    );
  }
}

class CardContainer extends StatelessWidget {
  final String paymentTitle;
  final String paymentDate;
  final String paymentAmount;
  final String paymentImageurl;

  const CardContainer(
      {super.key,
      required this.paymentTitle,
      required this.paymentDate,
      required this.paymentAmount,
      required this.paymentImageurl});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 13,
      decoration: const BoxDecoration(
          color: kSecondaryColour,
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.grey.withOpacity(0.5),
          //     spreadRadius: 2,
          //     blurRadius: 4,
          //     offset: const Offset(1, 3), // changes position of shadow
          //   ),
          // ],
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20))),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(35)),
              child: Image.asset(
                paymentImageurl,
                width: 40,
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                paymentTitle,
                style: kwalletBalanceDecoration.copyWith(
                    fontSize: 14, color: kWhite, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                paymentDate,
                style: kwalletBalanceDecoration.copyWith(
                    fontSize: 10, color: kWhite, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Text(
              paymentAmount,
              style: kwalletBalanceDecoration.copyWith(
                  fontSize: 15, color: kWhite, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
