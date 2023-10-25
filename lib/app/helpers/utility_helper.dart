import 'dart:math' as math;
export 'dart:developer' hide Flow;
import 'package:flutter_powerkit/flutter_powerkit.dart';
import 'package:http/http.dart' as http;

class UtilityHelper {
  UtilityHelper._();

  static PackageInfo? packageInfo;

  static UtilityHelper? _instance;

  static UtilityHelper get instance {
    _instance ??= UtilityHelper._();

    return _instance!;
  }

  Future<void> initiate() async {
    WidgetsFlutterBinding.ensureInitialized();
    packageInfo = await PackageInfo.fromPlatform();
    log("App Version: ${packageInfo?.version}");
  }

  String get appVersion => packageInfo?.version ?? "";

  String get playstoreURL =>
      'https://play.google.com/store/apps/details?id=${packageInfo?.packageName}';

  Future<AppCheckerResult> checkUpdate() async {
    final packageInfo = await PackageInfo.fromPlatform();
    final currentVersion = packageInfo.version;
    final packageName = packageInfo.packageName;
    if (Platform.isAndroid) {
      return _checkPlayStore(currentVersion, packageName);
    } else {
      return AppCheckerResult(
        currentVersion,
        null,
        "",
        'The target platform "${Platform.operatingSystem}" is not yet supported by this package.',
      );
    }
  }

  Future<AppCheckerResult> _checkPlayStore(
    String currentVersion,
    String packageName,
  ) async {
    String? errorMsg;
    String? newVersion;
    String? url;
    final uri = Uri.https(
        "play.google.com", "/store/apps/details", {"id": packageName});
    try {
      final response = await http.get(uri);
      if (response.statusCode != 200) {
        errorMsg =
            "Can't find an app in the Google Play Store with the id: $packageName";
      } else {
        newVersion = RegExp(r',\[\[\["([0-9,\.]*)"]],')
            .firstMatch(response.body)!
            .group(1);
        url = uri.toString();
      }
    } catch (e) {
      errorMsg = "$e";
    }
    return AppCheckerResult(
      currentVersion,
      newVersion,
      url,
      errorMsg,
    );
  }
}

class AppCheckerResult {
  AppCheckerResult(
    this.currentVersion,
    this.newVersion,
    this.appURL,
    this.errorMessage,
  );

  final String? appURL;
  final String currentVersion;
  final String? errorMessage;
  final String? newVersion;

  @override
  String toString() {
    return "Current Version: $currentVersion\nNew Version: $newVersion\nApp URL: $appURL\ncan update: $canUpdate\nerror: $errorMessage";
  }

  bool get canUpdate =>
      _shouldUpdate(currentVersion, (newVersion ?? currentVersion));

  bool _shouldUpdate(String versionA, String versionB) {
    final versionNumbersA =
        versionA.split(".").map((e) => int.tryParse(e) ?? 0).toList();
    final versionNumbersB =
        versionB.split(".").map((e) => int.tryParse(e) ?? 0).toList();

    final int versionASize = versionNumbersA.length;
    final int versionBSize = versionNumbersB.length;
    int maxSize = math.max(versionASize, versionBSize);

    for (int i = 0; i < maxSize; i++) {
      if ((i < versionASize ? versionNumbersA[i] : 0) >
          (i < versionBSize ? versionNumbersB[i] : 0)) {
        return false;
      } else if ((i < versionASize ? versionNumbersA[i] : 0) <
          (i < versionBSize ? versionNumbersB[i] : 0)) {
        return true;
      }
    }
    return false;
  }
}
