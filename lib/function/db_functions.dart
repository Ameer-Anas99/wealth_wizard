import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:wealth_wizard/model/add_data.dart';
import 'package:wealth_wizard/transaction/transactions.dart';

const transactionDBName = 'Transaction_database';

class TransactionDB extends ChangeNotifier {
  TransactionDB.internal();

  static TransactionDB instance = TransactionDB.internal();

  factory TransactionDB() {
    return instance;
  }
  ValueNotifier<List<TransactionModel>> transactionListNotifier =
      ValueNotifier([]);

  Future<void> getAllTransactions() async {
    final transactionDB =
        await Hive.openBox<TransactionModel>(transactionDBName);
    transactionListNotifier.value.clear();

    transactionListNotifier.value.addAll(transactionDB.values);

    transactionListNotifier.notifyListeners();
  }

  Future<void> insertTransaction(TransactionModel obj) async {
    final transactionDB =
        await Hive.openBox<TransactionModel>(transactionDBName);
    transactionDB.put(obj.id, obj);
    overViewListNotifier.notifyListeners();
    notifyListeners();
    getAllTransactions();
  }

  Future<void> deleteTransaction(TransactionModel transactionModel) async {
    final transactionDB =
        await Hive.openBox<TransactionModel>(transactionDBName);
    transactionDB.delete(transactionModel.id);
    overViewListNotifier.notifyListeners();
    getAllTransactions();
  }

  Future<void> editTransaction(TransactionModel value) async {
    final transactionDB =
        await Hive.openBox<TransactionModel>(transactionDBName);
    transactionDB.put(value.id, value);
    overViewListNotifier.notifyListeners();
    getAllTransactions();
  }
}
