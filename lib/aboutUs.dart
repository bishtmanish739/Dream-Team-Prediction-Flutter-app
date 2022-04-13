// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  AboutUs({Key? key}) : super(key: key);
  String s =
      "Hey Champs! Welcome to Dream Team Prediction App.\n We are happy to announce that Dream Team Prediction is the number one source for providing accurate statistics for fantasy teams. Dream Team Prediction App also provides you with the best possible team for the upcoming IPL matches. We aim to increase your win percentage by 90% and minimize your loss percentage. Our interface is too simple to use. We cover all the matches for Top Fantasy apps like Dream 11 app, MPL, Halaplay, My11circle, BalleBaazi, FanFight, MyTeam 11, FantasyPower 11, PlayerzPot, Fantain, Gamezy, MyFab 11, 11 Wickets, etc.\n\n Our key features are\n- best fantasy team combinations for every IPL match\n\n- players statistics in all past matches that will help you build your team\n\n- The best suggestion for Captain and Vice-Captain (C & VC).\n\n- Most selected players list\n\n- IPL 2022 latest updates\n\n- IPL 2022 trending memes\n\n- Tips for the best fantasy apps and their bonus offers\n\n- giveaways in our Telegram group";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Center(child: Text('About Us')),
          backgroundColor: Colors.red),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(15),
          child: Column(
            children: [
              const Icon(
                CupertinoIcons.heart_fill,
                color: Colors.red,
                size: 80.0,
              ),
              Text(
                s,
                style: const TextStyle(fontSize: 16, wordSpacing: 5),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
