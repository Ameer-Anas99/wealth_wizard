import 'package:flutter/material.dart';
import 'package:wealth_wizard/function/db_functions.dart';
import 'package:wealth_wizard/screens/widget/search.dart';
import 'package:wealth_wizard/transaction/transactions.dart';

ValueNotifier showCategory = ValueNotifier('All');

class TransactionList extends StatefulWidget {
  const TransactionList({super.key});

  @override
  State<TransactionList> createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  ValueNotifier showCategory = ValueNotifier('All');

  @override
  void initState() {
    overViewListNotifier.value =
        TransactionDB.instance.transactionListNotifier.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          color: Color.fromARGB(255, 95, 13, 109),
        ),
        title: Center(
          child: const Text(
            'Transactions History',
            style: TextStyle(fontSize: 23),
          ),
        ),
      ),
      body: SafeArea(
        child: const Column(
          children: [
            SearchField(),
            Expanded(
              child: Transactions(),
            ),
          ],
        ),
      ),
    );
  }
}
