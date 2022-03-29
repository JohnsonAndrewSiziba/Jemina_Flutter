import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';

class DeviceName{
  final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

  Future<String?> getModel() async {
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      // print(androidInfo.model);
      return androidInfo.model;
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      // print(iosInfo.utsname.machine);
      return iosInfo.utsname.machine;
    }
  }
}