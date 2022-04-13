// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: deprecated_member_use, file_names

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_dream_prediction/ShowNotification.dart';
import 'package:my_dream_prediction/Stats.dart';
import 'package:my_dream_prediction/aboutUs.dart';
import 'package:my_dream_prediction/Contactus.dart';
import 'package:my_dream_prediction/PrivacyPolicy.dart';
import 'package:my_dream_prediction/admob_service.dart';
import 'package:my_dream_prediction/joinus.dart';
import 'package:my_dream_prediction/myDreamTeam.dart';
import 'package:my_dream_prediction/news.dart';
import 'package:my_dream_prediction/notificationservice/local_notification_service.dart';
import 'package:my_dream_prediction/schedule.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class MyNavigationBar extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  MyNavigationBar({Key? key}) : super(key: key);

  @override
  _MyNavigationBarState createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    Schedule(),
    MyDreamTeam(),
    News(),
    MyStats()
  ];

  @override
  void initState() {
    super.initState();

    // 1. This method call when app in terminated state and you get a notification
    // when you click on notification app open from terminated state and you can get notification data in this method

    FirebaseMessaging.instance.getInitialMessage().then(
      (message) {
        print("FirebaseMessaging.instance.getInitialMessage");
        if (message != null) {
          print("New Notification");
          if (message.data['_id'] != null) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ShowNotification(
                  id: message.data['_id'],
                ),
              ),
            );
          }
        }
      },
    );

    // 2. This method only call when App in forground it mean app must be opened
    FirebaseMessaging.onMessage.listen(
      (message) {
        print("FirebaseMessaging.onMessage.listen");
        if (message.notification != null) {
          print(message.notification!.title);
          print(message.notification!.body);
          print("message.data11 ${message.data}");
          LocalNotificationService.createanddisplaynotification(message);
        }
      },
    );

    // 3. This method only call when App in background and not terminated(not closed)
    FirebaseMessaging.onMessageOpenedApp.listen(
      (message) {
        print("FirebaseMessaging.onMessageOpenedApp.listen");
        if (message.notification != null) {
          print(message.notification!.title);
          print(message.notification!.body);
          print("message.data22 ${message.data['_id']}");
        }
      },
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void onSelected(BuildContext context, int item) {
    switch (item) {
      case 0:
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => AboutUs()),
        );
        AdmobService.showInterstitialAd();
        break;
      case 1:
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => ContactUs()),
        );
        AdmobService.showInterstitialAd();
        break;
      case 2:
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => PrivacyPolicy()),
        );
        AdmobService.showInterstitialAd();
        break;
      case 3:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Center(child: Text('Dream Team Prediction')),
          actions: [
            TextButton(
              child: const Text(
                '\u{20B9}',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
              onPressed: () {
                // do something
                AdmobService.showInterstitialAd();
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => Scaffold(
                            appBar: AppBar(
                                title: const Center(
                                    child: Text('Dream Team Prediction')),
                                backgroundColor: Colors.red),
                            body: const JoinUs(),
                          )),
                );
              },
            ),
            Theme(
              data: Theme.of(context).copyWith(
                dividerColor: Colors.white,
                iconTheme: const IconThemeData(color: Colors.white),
                textTheme: const TextTheme().apply(bodyColor: Colors.white),
              ),
              child: PopupMenuButton<int>(
                color: Colors.blue,
                onSelected: (item) => onSelected(context, item),
                itemBuilder: (context) => [
                  const PopupMenuItem<int>(
                    value: 0,
                    child: Text('About Us'),
                  ),
                  const PopupMenuItem<int>(
                    value: 1,
                    child: Text('Contact Us'),
                  ),
                  const PopupMenuDivider(),
                  PopupMenuItem<int>(
                    value: 2,
                    child: Row(
                      children: const [
                        Icon(Icons.lock),
                        SizedBox(width: 8),
                        Text('Privacy Policy'),
                      ],
                    ),
                  ),
                  PopupMenuItem<int>(
                    child: InkWell(
                      onTap: () {
                        Share.share(
                            'Download Dream Team Prediction App. It is one of the best application to win grand league of fantasy apps.  https://play.google.com/store/apps/details?id=in.technicalkeeda.dtp',
                            subject: 'Share this App');
                      },
                      child: Row(
                        children: const [
                          Icon(Icons.share),
                          SizedBox(width: 8),
                          Text('Share This App'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
          backgroundColor: Colors.red),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.watch),
                label: 'Schedule',
                backgroundColor: Colors.red),
            BottomNavigationBarItem(
                icon: Icon(Icons.sports_cricket),
                label: 'Dream Team',
                backgroundColor: Colors.red),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.highlight,
                color: Colors.white,
              ),
              label: 'Highlight',
              backgroundColor: Colors.red,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.graphic_eq,
                color: Colors.white,
              ),
              label: 'Stats',
              backgroundColor: Colors.red,
            ),
          ],
          type: BottomNavigationBarType.shifting,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.white,
          iconSize: 40,
          onTap: _onItemTapped,
          elevation: 5),
    );
  }
}
