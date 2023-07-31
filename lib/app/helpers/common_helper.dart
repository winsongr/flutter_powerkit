import 'package:flutter_powerkit/flutter_powerkit.dart';

class CommonHelper {
  static Future<void> launchPlaystore() async {
    String appStoreLink = UtilityHelper.instance.playstoreURL;
    try {
      await openUrl(appStoreLink);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  static Future<void> openUrl(String url) async {
    try {
      if (await canLaunchUrl(Uri.parse(url))) {
        await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
