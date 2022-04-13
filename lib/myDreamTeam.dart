// ignore_for_file: file_names
import 'package:flutter/cupertino.dart';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

import 'package:my_dream_prediction/admob_service.dart';

class MyDreamTeam extends StatefulWidget {
  const MyDreamTeam({Key? key}) : super(key: key);

  @override
  _MyDreamTeamState createState() => _MyDreamTeamState();
}

class _MyDreamTeamState extends State<MyDreamTeam> {
  String stringres = "";
  List<dynamic> myteamlist = [];
  Future getTeams() async {
    var response = await http
        .get(Uri.parse('https://protected-bayou-79974.herokuapp.com/getteam'));

    if (response.statusCode == 200) {
      setState(() {
        myteamlist = json.decode(response.body);
      });
    }
    return "Success!";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: myteamlist.isEmpty
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: myteamlist.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                      margin: const EdgeInsets.fromLTRB(5, 10, 3, 10),
                      padding: const EdgeInsets.all(2),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Match: ${index + 1}",
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            myteamlist[myteamlist.length - index - 1]['match'],
                            style: const TextStyle(
                                color: Colors.black, fontSize: 16),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            'Pitch Report',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                              myteamlist[myteamlist.length - index - 1]
                                  ['pitchreport'],
                              style: TextStyle(
                                  color: Colors.grey[700], fontSize: 16)),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            margin: const EdgeInsets.all(20),
                            height: 60,
                            child: AdWidget(
                              ad: AdmobService.createBannerAd()..load(),
                              key: UniqueKey(),
                            ),
                          ),
                          const Text(
                            'Team 1',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Image.network(
                            myteamlist[myteamlist.length - index - 1]['team1'],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            'Match Preview ',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                              myteamlist[myteamlist.length - index - 1]
                                  ['matchPreview'],
                              style: TextStyle(
                                  color: Colors.grey[700], fontSize: 16)),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            margin: const EdgeInsets.all(20),
                            height: 60,
                            child: AdWidget(
                              ad: AdmobService.createBannerAd2()..load(),
                              key: UniqueKey(),
                            ),
                          ),
                          const Text(
                            'Team 2',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Image.network(
                            myteamlist[myteamlist.length - index - 1]['team2'],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            'Top Players',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                              myteamlist[myteamlist.length - index - 1]
                                  ['topPlayer'],
                              style: TextStyle(
                                  color: Colors.grey[700], fontSize: 16)),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            'Key Players ',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                              myteamlist[myteamlist.length - index - 1]
                                  ['keyPlayer'],
                              style: TextStyle(
                                  color: Colors.grey[700], fontSize: 16)),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            margin: const EdgeInsets.all(20),
                            height: 60,
                            child: AdWidget(
                              ad: AdmobService.createBannerAd2()..load(),
                              key: UniqueKey(),
                            ),
                          ),
                          const Text(
                            'Best Choice for Captain And VC',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                              myteamlist[myteamlist.length - index - 1]['cpvc'],
                              style: TextStyle(
                                  color: Colors.grey[700], fontSize: 16)),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            'Head to Head ',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(myteamlist[myteamlist.length - index - 1]['h2h'],
                              style: TextStyle(
                                  color: Colors.grey[700], fontSize: 16)),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            'Team 3',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Image.network(
                            myteamlist[myteamlist.length - index - 1]['team3'],
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          Container(
                            margin: const EdgeInsets.all(20),
                            height: 60,
                            child: AdWidget(
                              ad: AdmobService.createBannerAd()..load(),
                              key: UniqueKey(),
                            ),
                          ),
                          const Divider(
                            color: Colors.black,
                            thickness: 5.0,
                          )
                        ],
                      ));
                }));
  }

  @override
  void initState() {
    getTeams();
    super.initState();
  }
}
