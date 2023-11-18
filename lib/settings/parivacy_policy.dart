import 'package:flutter/material.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 122, 27, 139),
          title: Center(
            child: Text(
              "Privacy Policy",
              style: TextStyle(fontSize: 25),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            children: const [
              Padding(
                padding: EdgeInsets.all(15.0),
                child: Text(
                    """Ameer Anas built the wealth_wizard app as a Free app. This SERVICE is provided by Ameer Anas at no cost and is intended for use as is.

This page is used to inform visitors regarding my policies with the collection, use, and disclosure of Personal Information if anyone decided to use my Service.

If you choose to use my Service, then you agree to the collection and use of information in relation to this policy. The Personal Information that I collect is used for providing and improving the Service. I will not use or share your information with anyone except as described in this Privacy Policy.

The terms used in this Privacy Policy have the same meanings as in our Terms and Conditions, which are accessible at wealth_wizard unless otherwise defined in this Privacy Policy.
                        
              """,
                    style: TextStyle(fontSize: 15, color: Colors.black87)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
