import 'dart:io';
import 'package:google_mobile_ads/google_mobile_ads.dart';

const String testDevice = '8AF74256D8D5C1E9EF7F4C87D703027E';
const int maxFailedLoadAttempts = 3;

///https://stackoverflow.com/questions/50972863/admob-banner-how-to-show-only-on-home
///
class AdmobService {
  static late BannerAd _bannerAd;
  static InterstitialAd? _interstitialAd;
  static int _numInterstitialLoadAttempts = 0;

  static BannerAd get bannerAd => _bannerAd;
  static String get bannerAdUnitId => Platform.isAndroid
      ? 'ca-app-pub-3624608645361712/2918740988'
      : 'ca-app-pub-3940256099942544/2934735716';

  static String get bannerAdUnitId2 => Platform.isAndroid
      ? 'ca-app-pub-3624608645361712/6430556684'
      : 'ca-app-pub-3940256099942544/2934735716';

  static String get iOSInterstitialAdUnitID => Platform.isAndroid
      ? 'ca-app-pub-3624608645361712/1676336729'
      : 'ca-app-pub-3624608645361712/1676336729';

  static initialize() {
    if (MobileAds.instance == null) {
      print("initialize:AdMob");
      MobileAds.instance.initialize();
    }
  }

  static BannerAd createBannerAd() {
    // ignore: unnecessary_new
    BannerAd ad = new BannerAd(
      adUnitId: bannerAdUnitId,
      size: AdSize.banner,
      request: const AdRequest(keywords: [
        'Earn,Games,earn money,work from home, Earn More,Car,Bike,cyle,dream11'
      ]),
      //listener: null,
      listener: BannerAdListener(
        onAdLoaded: (Ad ad) => print('Ad loaded.'),
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          print('Ad failed to load: $error');
          ad.dispose();
        },
        onAdOpened: (Ad ad) => print('Ad opened.'),
        onAdClosed: (Ad ad) => print('Ad closed.'),
      ),
    );

    return ad;
  }

  static BannerAd createBannerAd2() {
    // ignore: unnecessary_new
    BannerAd ad = new BannerAd(
      adUnitId: bannerAdUnitId,
      size: AdSize.banner,
      request: const AdRequest(keywords: [
        'Earn,Games,earn money,work from home, Earn More,Car,Bike,cyle,dream11'
      ]),
      //listener: null,
      listener: BannerAdListener(
        onAdLoaded: (Ad ad) => print('Ad loaded.'),
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          print('Ad failed to load: $error');
          ad.dispose();
        },
        onAdOpened: (Ad ad) => print('Ad opened.'),
        onAdClosed: (Ad ad) => print('Ad closed.'),
      ),
    );

    return ad;
  }

  static void showBannerAd() {
    if (_bannerAd != null) {
      return;
    }
    _bannerAd = createBannerAd();
    _bannerAd..load();
  }

  void disposeAds() {
    print("disposeAds");
    if (_bannerAd != null) {
      _bannerAd.dispose();
    }
  }

  static _createInterstitialAd() {
    InterstitialAd.load(
      adUnitId: iOSInterstitialAdUnitID,
      request: AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (InterstitialAd ad) {
          print('$ad loaded');
          _interstitialAd = ad;
          _numInterstitialLoadAttempts = 0;

          _interstitialAd!.show();
          _interstitialAd = null;
        },
        onAdFailedToLoad: (LoadAdError error) {
          print('InterstitialAd failed to load: $error.');
          _numInterstitialLoadAttempts += 1;
          _interstitialAd = null;
          if (_numInterstitialLoadAttempts <= maxFailedLoadAttempts) {
            _createInterstitialAd();
          }
        },
      ),
    );
  }

  static void showInterstitialAd() {
    if (_interstitialAd == null) {
      _createInterstitialAd();
    }
  }
}
