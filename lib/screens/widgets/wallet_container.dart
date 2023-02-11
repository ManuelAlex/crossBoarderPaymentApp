import 'package:flutter/material.dart';
import 'package:penge_send/constants/colour_const.dart';
import 'package:penge_send/constants/styles_const.dart';

class WalletContainer extends StatelessWidget {
  const WalletContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 5,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 8),
        child: Container(
          height: MediaQuery.of(context).size.height / 6,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: kwalletContainerColour,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 4,
                  offset: const Offset(1, 3), // changes position of shadow
                ),
              ],
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30))),
          child: const WalletContent(),
        ),
      ),
    );
  }
}

class WalletContent extends StatelessWidget {
  const WalletContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const CurrencyList(),
        const Text(
          '50,000',
          style: kwalletBalanceDecoration,
        ),
        Text(
          'available Balance',
          style: kwalletBalanceDecoration.copyWith(
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}

class CurrencyList extends StatefulWidget {
  const CurrencyList({super.key});

  @override
  State<CurrencyList> createState() => _CurrencyListState();
}

class _CurrencyListState extends State<CurrencyList> {
  String selectedSortBy = 'NGN';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: const BoxDecoration(
            color: kIconSendColour,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20))),
        height: MediaQuery.of(context).size.height / 26,
        width: MediaQuery.of(context).size.width / 3.8,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 4, top: 2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.money_sharp,
                size: 18,
              ),
              const SizedBox(
                width: 5,
              ),
              DropdownButton<String>(
                  //icon: Icon(Icons.arrow_downward),
                  underline: const SizedBox(),
                  borderRadius: BorderRadius.circular(20),
                  value: selectedSortBy,
                  items: const [
                    DropdownMenuItem(value: 'NGN', child: Text('NGN')),
                    DropdownMenuItem(value: 'KES', child: Text('KES')),
                    DropdownMenuItem(value: 'EUR', child: Text('EUR')),
                  ],
                  onChanged: (value) {
                    setState(() {
                      selectedSortBy = value!;
                    });
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
