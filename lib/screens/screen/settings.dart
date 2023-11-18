import 'package:flutter/material.dart';
import 'package:wealth_wizard/settings/about.dart';
import 'package:wealth_wizard/settings/parivacy_policy.dart';
import 'package:wealth_wizard/settings/reset.dart';
import 'package:wealth_wizard/settings/terms_condition.dart';

class settings extends StatelessWidget {
  const settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Color.fromARGB(255, 95, 13, 109),
        title: const Center(
          child: Text(
            'Settings',
            style: TextStyle(fontSize: 25),
          ),
        ),
      ),
      body: SafeArea(
        child: Card(
          child: ListView(
            children: [
              Divider(
                thickness: 3,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => PrivacyPolicy(),
                  ));
                },
                child: ListTile(
                  title: Text(
                    'Privacy and Policy',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              Divider(
                thickness: 3,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => TermsCondition(),
                  ));
                },
                child: ListTile(
                  title: Text(
                    'Terms and Conditions',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              Divider(
                thickness: 3,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => About(),
                  ));
                },
                child: ListTile(
                  title: Text(
                    'About',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              Divider(
                thickness: 3,
              ),
              GestureDetector(
                onTap: () {
                  reset().resetApp(context);
                },
                child: ListTile(
                  title: Text(
                    'Reset',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              Divider(thickness: 3)
            ],
          ),
        ),
      ),
    );
  }
}
