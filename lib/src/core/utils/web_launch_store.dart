import 'package:url_launcher/url_launcher.dart';

void webLaunchStore({required String platform}) async {
  String androidPackageName = '';
  String huaweiAppId = '';
  String iOSAppId = '';

    androidPackageName = "com.sprinteye.cityeye.app";
    iOSAppId = "6474612743";
    huaweiAppId = "C110578913";


  String url = '';
  if (platform == 'android') {
    url = 'https://play.google.com/store/apps/details?id=$androidPackageName';
  } else if (platform == 'ios') {
    url = 'https://apps.apple.com/app/id$iOSAppId';
  } else if (platform == 'huawei') {
    url = "https://appgallery.huawei.com/app/$huaweiAppId";
  }

  try {
    await launch(url);
  } catch (e) {
    print(e);
  }
}
