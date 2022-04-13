import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:my_dream_prediction/admob_service.dart';

class MyStats extends StatefulWidget {
  const MyStats({Key? key}) : super(key: key);

  @override
  State<MyStats> createState() => _MyStatsState();
}

class _MyStatsState extends State<MyStats> {
  String stringres = "";
  List<dynamic> templist = [];
  List<dynamic> statslist = [];
  Future getstats() async {
    var response = await http
        .get(Uri.parse('https://protected-bayou-79974.herokuapp.com/getstats'));

    if (response.statusCode == 200) {
      // print(response.body);
      setState(() {
        statslist = json.decode(response.body);
      });
    }
    return "Success!";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: statslist.length == 0
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Column(
                      children: [
                        Text(
                          statslist[statslist.length - 1]['stat1title'],
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Image.network(
                          statslist[statslist.length - 1]['stat1content'],
                          fit: BoxFit.fill,
                        ),
                        Container(
                          margin: const EdgeInsets.all(20),
                          height: 60,
                          child: AdWidget(
                            ad: AdmobService.createBannerAd()..load(),
                            key: UniqueKey(),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          statslist[statslist.length - 1]['stat2title'],
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Image.network(
                          statslist[statslist.length - 1]['stat2content'],
                          fit: BoxFit.cover,
                        ),
                        Container(
                          margin: const EdgeInsets.all(20),
                          height: 60,
                          child: AdWidget(
                            ad: AdmobService.createBannerAd()..load(),
                            key: UniqueKey(),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          statslist[statslist.length - 1]['stat3title'],
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Image.network(
                          statslist[statslist.length - 1]['stat3content'],
                          fit: BoxFit.cover,
                        ),
                        Container(
                          margin: const EdgeInsets.all(20),
                          height: 60,
                          child: AdWidget(
                            ad: AdmobService.createBannerAd()..load(),
                            key: UniqueKey(),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          statslist[statslist.length - 1]['stat4title'],
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Image.network(
                          statslist[statslist.length - 1]['stat4content'],
                          fit: BoxFit.cover,
                        ),
                        Container(
                          margin: const EdgeInsets.all(20),
                          height: 60,
                          child: AdWidget(
                            ad: AdmobService.createBannerAd()..load(),
                            key: UniqueKey(),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          statslist[statslist.length - 1]['stat5title'],
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Image.network(
                          statslist[statslist.length - 1]['stat5content'],
                          fit: BoxFit.cover,
                        ),
                        Container(
                          margin: const EdgeInsets.all(20),
                          height: 60,
                          child: AdWidget(
                            ad: AdmobService.createBannerAd()..load(),
                            key: UniqueKey(),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          statslist[statslist.length - 1]['stat6title'],
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Image.network(
                          statslist[statslist.length - 1]['stat6content'],
                          fit: BoxFit.cover,
                        ),
                        Container(
                          margin: const EdgeInsets.all(20),
                          height: 60,
                          child: AdWidget(
                            ad: AdmobService.createBannerAd()..load(),
                            key: UniqueKey(),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          statslist[statslist.length - 1]['stat7title'],
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Image.network(
                          statslist[statslist.length - 1]['stat7content'],
                          fit: BoxFit.cover,
                        ),
                        Container(
                          margin: const EdgeInsets.all(20),
                          height: 60,
                          child: AdWidget(
                            ad: AdmobService.createBannerAd()..load(),
                            key: UniqueKey(),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )));
  }

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    getstats();
  }
}
