// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Center(child: Text('Contact Us')),
          backgroundColor: Colors.red),
      body: Container(
        margin: const EdgeInsets.all(15),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const Icon(
              CupertinoIcons.phone_fill,
              color: Colors.green,
              size: 80.0,
            ),
            const Text(
              'Contact Details',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Dream Team Prediction team is always present to help you. If you face any difficulty while using applicaiton you may contact to us.Our contact details are provided below \n\nemail: mahavirsingh739@gmail.com\nwebsite: technicalkeeda.in',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                launch('https://t.me/dream_team_prediction_app');
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Text(
                    '  Join Our Telegram Group  ',
                    style:
                        TextStyle(fontSize: 18, backgroundColor: Colors.green),
                  ),
                  Icon(
                    Icons.telegram,
                    color: Colors.blue,
                    size: 35,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: () {
                launch('https://t.me/bestteamfordream11app');
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Text(
                    '  Join Our Telegram Channel  ',
                    style:
                        TextStyle(fontSize: 18, backgroundColor: Colors.green),
                  ),
                  Icon(
                    Icons.telegram,
                    color: Colors.blue,
                    size: 35,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
