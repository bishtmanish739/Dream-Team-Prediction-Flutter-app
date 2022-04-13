// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:url_launcher/url_launcher.dart';

class PrivacyPolicy extends StatelessWidget {
  PrivacyPolicy({Key? key}) : super(key: key);
  String s =
      "This Privacy Policy describes Our policies and procedures on the collection, use and disclosure of Your information when You use the Service and tells You about Your privacy rights and how the law protects You.We use Your Personal data to provide and improve the Service. By using the Service, You agree to the collection and use of information in accordance with this Privacy Policy. This Privacy Policy has been created with the help of the Privacy Policy Template";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Center(child: Text('Privacy Policy')),
          backgroundColor: Colors.red),
      body: Container(
        margin: const EdgeInsets.all(15),
        child: Column(
          children: [
            const Icon(
              CupertinoIcons.lock_fill,
              color: Colors.green,
              size: 80.0,
            ),
            Text(
              s,
              style: const TextStyle(fontSize: 18, wordSpacing: 5),
            ),
            TextButton.icon(
                onPressed: () {
                  launch(
                      "https://www.technicalkeeda.in/2022/03/dtp-privacy-policy.html");
                },
                icon: const Icon(
                  Icons.read_more,
                ),
                label: const Text(
                  "Read More",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
