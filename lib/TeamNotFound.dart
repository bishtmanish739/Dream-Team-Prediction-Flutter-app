import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:my_dream_prediction/admob_service.dart';

class TeamNotFound extends StatelessWidget {
  const TeamNotFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Icon(
                Icons.error,
                color: Colors.red,
                size: 80,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'The team will be uploaded 24 hours before the match. Please visit again to create your dream team.\n\nThank You',
                style: TextStyle(wordSpacing: 5, fontSize: 16),
              ),
              const SizedBox(
                height: 20,
              ),
              Image.network(
                  'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjzxXbWEz5IyUATYIT643xT8_NMa6nOolM4YQUuQbaxv_BjjUYDiA3Ptipx0hZcQSkzm4KBqSdiXk0bw4gl_r81ju2U7zO1odcYBGA5a0uWf2iLZyTTo1bqd4DibxTA55bdMn63XiKV1fj2LR_rEdmjTKfYnuYT-oMSspIXkfTQZ80UaEvO-4V83_Zx/w621-h435/Oh,%20Hum%20Bhi%20Bna%20Lenge%20Dream%20Team.png'),
              Container(
                margin: EdgeInsets.all(20),
                height: 60,
                child: AdWidget(
                  ad: AdmobService.createBannerAd()..load(),
                  key: UniqueKey(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
