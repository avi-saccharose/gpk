import 'package:package_info_plus/package_info_plus.dart';

class AppConfig {
  AppConfig._();

  static late PackageInfo _packageInfo;
  static const String repoUrl = "https://github.com/avi-saccharose/gpk";

  static Future<void> init() async {
    _packageInfo = await PackageInfo.fromPlatform();
  }

  static String get appName => _packageInfo.appName;
  static String get version => _packageInfo.version;
  static String get packageName => _packageInfo.packageName;
  static String get buildNumber => _packageInfo.buildNumber;

  static String get displayVersion => 'v$version ($buildNumber)';
}
