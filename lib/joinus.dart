import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:my_dream_prediction/ad_helper.dart';
import 'package:my_dream_prediction/admob_service.dart';
import 'package:url_launcher/url_launcher.dart';

class JoinUs extends StatefulWidget {
  const JoinUs({Key? key}) : super(key: key);

  @override
  _JoinUsState createState() => _JoinUsState();
}

class _JoinUsState extends State<JoinUs> {
  List<OtherPlatform> allPlatform = [
    OtherPlatform(
        name: 'Earn More',
        url:
            'https://static.toiimg.com/thumb/msid-75491454,width-1200,height-900,resizemode-4/.jpg',
        download: 'https://dream11.onelink.me/hNTA/2f51d458',
        refcode: 'PARAS16790Z'),
    OtherPlatform(
        name: 'Dream11',
        url:
            'https://i0.wp.com/logotaglines.com/wp-content/uploads/2021/06/dream11-logo-tagline-slogan-motto.jpg?fit=640%2C640&ssl=1',
        download: 'https://dream11.onelink.me/hNTA/2f51d458',
        refcode: 'PARAS16790Z'),
    OtherPlatform(
        name: 'Halaplay',
        url: 'https://www.nicepng.com/png/detail/270-2707401_halaplay.png',
        download: 'http://bit.ly/2YH3NqE',
        refcode: 'W7ASES1U'),
    OtherPlatform(
        name: 'A23 Games',
        url: 'https://www.a23.com/assets/images/a23-games-logo.png',
        download: 'https://pf.a23.in/raf24j?rc=F4T3K0&c=w',
        refcode: 'F4T3K0'),
    OtherPlatform(
        name: 'MPL',
        url:
            'https://p.kindpng.com/picc/s/775-7756351_mpl-app-download-hd-png-download.png',
        download: 'https://referral-mpl-pro.onelink.me/eMpV/1c7702d3',
        refcode: 'E7P8FE'),
    OtherPlatform(
        name: 'My11circle',
        url:
            'https://lh3.googleusercontent.com/Fq2fLx4JLizq_zO1eE8n0J-MPsKjesf-ocggqQ8GM0dQEAv-yHY596-9DXl6Hf-8ot16',
        download:
            'https://www.my11circle.com/baf.html?refId=48567065&baf_promo_code=BAF.Bonus500&cid=2003&refCode=PARA1491&utm_medium=baf_whatsapp',
        refcode: 'PARA1491'),
    OtherPlatform(
        name: 'MyFab11',
        url: 'https://myfab11.com/images/logo.png',
        download: 'https://myfab11.onelink.me/kBvZ/b3bfc7a3',
        refcode: 'DHACIDJ53'),
    OtherPlatform(
        name: 'Paytm First Game',
        url:
            'https://static.toiimg.com/thumb/msid-75491454,width-1200,height-900,resizemode-4/.jpg',
        download: 'https://firstgames.onelink.me/wElH/50bbf2f4',
        refcode: 'xrKihj152'),
    OtherPlatform(
        name: 'BalleBaazi',
        url:
            'https://static-s.aa-cdn.net/img/ios/1438726846/37dde5e7e800f8ffd8cdad5c8155bce9?v=1',
        download: 'https://ballebaazi.app.link/refer?refercode=ELSJFS1',
        refcode: 'ELSJFS1'),
    OtherPlatform(
        name: 'Gamezy',
        url: 'https://www.gamezy.com/images/gamezy_logo.jpg',
        download: 'https://gamezy.page.link/5U3SXrAmJZgv1yZK6',
        refcode: '8Q1V68'),
    OtherPlatform(
        name: '11Wickets',
        url: 'https://www.11wickets.com/static/img/11wicket-icon.png',
        download: 'https://www.11wickets.com/game/register?r=34ccb82',
        refcode: '34ccb82'),
  ];

  @override
  Widget build(BuildContext context) {
    return allPlatform.length == 0
        ? const CircularProgressIndicator()
        : ListView.builder(
            itemCount: allPlatform.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                  child: index == 0
                      ? Container(
                          margin: const EdgeInsets.all(20),
                          child: Center(
                            child: Column(
                              children: [
                                const Text(
                                  'Join More Earn More !',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                InkWell(
                                  onTap: () {
                                    launch(
                                        'https://t.me/dream_team_prediction_app');
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Text(
                                        'Click Here Join Our Telegram ',
                                        style: TextStyle(
                                            fontSize: 18,
                                            backgroundColor: Colors.green),
                                      ),
                                      Icon(
                                        Icons.telegram,
                                        color: Colors.blue,
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      : Center(
                          child: Container(
                            height: index % 3 == 0 ? 280 : 200,
                            margin: const EdgeInsets.fromLTRB(5, 10, 5, 10),
                            child: Center(
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.amber,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Column(
                                          children: [
                                            Image.network(
                                              allPlatform[index].url.toString(),
                                              height: 90,
                                            ),
                                            Text(
                                              allPlatform[index]
                                                  .name
                                                  .toString(),
                                              style: const TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Container(
                                              height: 50,
                                              margin: const EdgeInsets.all(10),
                                              padding: const EdgeInsets.all(10),
                                              decoration: BoxDecoration(
                                                  color: Colors.green[300],
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: TextButton.icon(
                                                  onPressed: () {
                                                    launch(allPlatform[index]
                                                        .download
                                                        .toString());
                                                  },
                                                  icon: const Icon(
                                                    Icons.download,
                                                    color: Colors.white,
                                                  ),
                                                  label: const Text(
                                                    "download",
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  )),
                                            ),
                                            Container(
                                              height: 50,
                                              margin: const EdgeInsets.all(10),
                                              decoration: BoxDecoration(
                                                  color: Colors.grey,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: TextButton.icon(
                                                  onPressed: () {
                                                    AdmobService
                                                        .showInterstitialAd();
                                                    Clipboard.setData(
                                                        ClipboardData(
                                                            text: allPlatform[
                                                                    index]
                                                                .refcode));
                                                    final snackBar = SnackBar(
                                                        content: Text(
                                                            'Code Copied to Clipboard'));

                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(snackBar);
                                                  },
                                                  icon: const Icon(
                                                    Icons.copy,
                                                    color: Colors.white,
                                                  ),
                                                  label: Text(
                                                    "Code:" +
                                                        allPlatform[index]
                                                            .refcode
                                                            .toString(),
                                                    style: const TextStyle(
                                                        color: Colors.white),
                                                  )),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    index % 3 == 0
                                        ? Container(
                                            margin: const EdgeInsets.all(20),
                                            height: 60,
                                            child: AdWidget(
                                              ad: AdmobService.createBannerAd2()
                                                ..load(),
                                              key: UniqueKey(),
                                            ),
                                          )
                                        : Container()
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ));
            },
          );
  }

  @override
  void initState() {
    super.initState();
  }
}

class OtherPlatform {
  String? name = '';
  String? url = '';
  String? download = '';
  String? refcode = '';

  OtherPlatform({this.name, this.url, this.download, this.refcode});
}
