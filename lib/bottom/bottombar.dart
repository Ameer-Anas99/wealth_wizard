import 'package:flutter/material.dart';
import 'package:wealth_wizard/screens/screen/home_screen.dart';
import 'package:wealth_wizard/screens/screen/settings.dart';
import 'package:wealth_wizard/screens/screen/statistics.dart';
import 'package:wealth_wizard/screens/screen/transaction_list.dart';
import 'package:wealth_wizard/transaction/add_screen.dart';

class BottomBar extends StatefulWidget {
  String username;
  String file;
  BottomBar({super.key, required this.username, required this.file});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int index_color = 0;
  List screen = [];

  @override
  void initState() {
    super.initState();
    screen = [
      HomeScreen(username: widget.username, file: widget.file),
      StatisticsScreen(),
      TransactionList(),
      settings(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screen[index_color],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => AddTransaction(file: widget.file),
            ),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.purple,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    index_color = 0;
                  });
                },
                child: Icon(
                  Icons.home,
                  size: 30,
                  color: index_color == 0
                      ? Color.fromARGB(255, 122, 27, 139)
                      : Colors.grey,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    index_color = 1;
                  });
                },
                child: Icon(
                  Icons.bar_chart_outlined,
                  size: 30,
                  color: index_color == 1
                      ? Color.fromARGB(255, 122, 27, 139)
                      : Colors.grey,
                ),
              ),
              SizedBox(width: 10),
              GestureDetector(
                onTap: () {
                  setState(() {
                    index_color = 2;
                  });
                },
                child: Icon(
                  Icons.list,
                  size: 30,
                  color: index_color == 2
                      ? Color.fromARGB(255, 122, 27, 139)
                      : Colors.grey,
                ),
              ),
              SizedBox(width: 10),
              GestureDetector(
                onTap: () {
                  setState(() {
                    index_color = 3;
                  });
                },
                child: Icon(
                  Icons.settings,
                  size: 30,
                  color: index_color == 3
                      ? Color.fromARGB(255, 122, 27, 139)
                      : Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
