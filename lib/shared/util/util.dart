import 'dart:convert';
import 'dart:io';
import 'package:archive/archive.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:get/get.dart';

// import 'package:shoes_shop/shared/util/const.dart';
import 'package:package_info/package_info.dart';
import 'package:shoes_shop/_shoes_shop/domain/models/login.dart';
import 'package:shoes_shop/shared/util/preferences.dart';
import 'package:sqflite/sqflite.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:url_launcher/url_launcher_string.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';

final prefs = Preferences();

class Util {
  static final device = _Device._();
  static final data = _Data._();
}

class _Data {
  _Data._();

  Login getUser() {
    Login empleado = Login.fromJson(jsonDecode(prefs.user));

    return empleado;
  }
}

class _Device {
  _Device._();

  Future<String> getAppVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String version = packageInfo.version;
    return version;
  }

  Future<String> getDeviceId() async {
    var deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) {
      var iosDeviceInfo = await deviceInfo.iosInfo;
      return iosDeviceInfo.identifierForVendor.toString();
    } else {
      var androidDeviceInfo = await deviceInfo.androidInfo;
      String unknow = "unknown";
      String compilationNumber = androidDeviceInfo.id;
      String model = androidDeviceInfo.model;
      String board = androidDeviceInfo.board;

      String id = '';
      if (!compilationNumber.contains(unknow)) {
        id = compilationNumber;
      }
      if (!model.contains(unknow)) {
        id += model;
      }

      if (!board.contains(unknow)) {
        id += board;
      }
      return id.toUpperCase();
    }
  }

  Future<bool> getInternet() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
    } on SocketException catch (_) {
      return false;
    }
    return false;
  }

  String getCurrentDateWhitFormat(String format) {
    var now = DateTime.now();
    String formatter = DateFormat(format).format(now);
    return formatter;
  }

  Future<String> getAppDirectory() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String dirStringPath = dir.path;
    return dirStringPath;
  }

  Future<void> validateFiles(var zipFileBytes, var dirPath) async {
    var archive = ZipDecoder().decodeBytes(zipFileBytes);

    for (var file in archive) {
      String filePathEntry = '$dirPath/${file.name}';

      final File fileEntry = File(filePathEntry);

      await deleteDatabase(fileEntry.path);

      if (await fileEntry.exists()) {
        await fileEntry.delete();
      }
    }
  }

  Future<bool> isConectedInternet() async {
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
      return false;
    } on SocketException catch (e) {
      Get.printError(info: "isConectedInternet -> $e");
      return false;
    }
  }
}
