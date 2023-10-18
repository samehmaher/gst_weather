import 'package:flutter/foundation.dart';

class AppConstant {
  static const String imagesPath = 'assets/images/';
  static const String animsPath = 'assets/anims/';
  static myPrint(Object? debug) {
    if (kDebugMode) {
      print(debug);
    }
  }
}
