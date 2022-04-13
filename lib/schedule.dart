import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:http/http.dart' as http;
import 'package:my_dream_prediction/GetClickedTeam.dart';
import 'dart:async';

import 'package:my_dream_prediction/admob_service.dart';
import 'package:my_dream_prediction/myDreamTeam.dart';

class Schedule extends StatefulWidget {
  @override
  State<Schedule> createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  String stringres = "";
  List<dynamic> templist = [];
  List<dynamic> schedulelist = [];
  Future getSchedule() async {
    var response = await http.get(
        Uri.parse('https://protected-bayou-79974.herokuapp.com/getschedule'));

    if (response.statusCode == 200) {
      // print(response.body);
      setState(() {
        schedulelist = json.decode(response.body);
      });
    }
    return "Success!";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: schedulelist.length == 0
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              addAutomaticKeepAlives: true,
              itemCount: schedulelist.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () => {
                    AdmobService.showInterstitialAd(),
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => Scaffold(
                                appBar: AppBar(
                                    title: const Center(
                                        child: Text('Dream Team Prediction')),
                                    backgroundColor: Colors.red),
                                body: GetClickedTeam(schedulelist[
                                            schedulelist.length - index - 1]
                                        ['team_A'] +
                                    " vs " +
                                    schedulelist[schedulelist.length -
                                        index -
                                        1]['team_B']),
                              )),
                    )
                  },
                  child: Container(
                    height: index % 5 == 0 ? 300 : 200,
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(color: Colors.green, spreadRadius: 8),
                        BoxShadow(color: Colors.yellow, spreadRadius: 5),
                      ],
                    ),
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.network(
                                    schedulelist[schedulelist.length -
                                        index -
                                        1]['team_A_logo'],
                                    height: 90,
                                  ),
                                  Text(
                                    schedulelist[schedulelist.length -
                                        index -
                                        1]['team_A'],
                                    style: const TextStyle(
                                        color: Colors.red,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      'Vs',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Text(
                                    schedulelist[schedulelist.length -
                                        index -
                                        1]['timing'],
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.network(
                                    schedulelist[schedulelist.length -
                                        index -
                                        1]['team_B_logo'],
                                    height: 90,
                                  ),
                                  Text(
                                    schedulelist[schedulelist.length -
                                        index -
                                        1]['team_B'],
                                    style: const TextStyle(
                                        color: Colors.red,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          index % 5 == 0
                              ? Container(
                                  margin: EdgeInsets.all(20),
                                  height: 60,
                                  child: AdWidget(
                                    ad: AdmobService.createBannerAd()..load(),
                                    key: UniqueKey(),
                                  ),
                                )
                              : Container()
                        ],
                      ),
                    ),
                  ),
                );
              }),
    );
  }

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    getSchedule();
  }
}
