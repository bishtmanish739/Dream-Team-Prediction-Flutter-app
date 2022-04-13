import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

import 'package:my_dream_prediction/admob_service.dart';

class News extends StatefulWidget {
  const News({Key? key}) : super(key: key);

  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {
  String stringres = "";
  List<dynamic> newslist = [];
  Future getnews() async {
    var response = await http
        .get(Uri.parse('https://protected-bayou-79974.herokuapp.com/getnews'));

    if (response.statusCode == 200) {
      // print(response.body);
      setState(() {
        newslist = json.decode(response.body);
      });
    }
    return "Success!";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: newslist.length == 0
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: newslist.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.network(
                            newslist[newslist.length - index - 1]['img']),
                        Text(
                          newslist[newslist.length - index - 1]['title'],
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(2, 20, 2, 10),
                            child: Text(
                              newslist[newslist.length - index - 1]['desc'],
                              style: TextStyle(
                                  fontSize: 18, color: Colors.grey[700]),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'Credit',
                              style:
                                  TextStyle(fontSize: 15, color: Colors.grey),
                            ),
                            Text(
                              newslist[newslist.length - index - 1]['credit'],
                              style:
                                  TextStyle(fontSize: 15, color: Colors.grey),
                            ),
                          ],
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
                          height: 10,
                          color: Colors.black,
                        )
                      ],
                    ));
              }),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    getnews();
    super.initState();
  }
}
