import 'package:flutter/material.dart';

import 'package:agoris_admin/common/size_constants.dart';

class Transactions extends StatefulWidget {
  const Transactions({super.key});

  @override
  State<Transactions> createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueGrey,
        body: const Center(
          child: Text('Transactions', style: TextStyle(color: Colors.white, fontSize: Sizes.dimen_40),),
        ),
      ),
    );
  }

}