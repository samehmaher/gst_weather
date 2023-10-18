import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:gst_wether/resources/constant_manager.dart';

import '../domins/controller/home_controller.dart';

class Location {
  Future<void> getCurrentLocation() async {
    try {
      await Geolocator.requestPermission();
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      HomeController homeController = Get.find();
      homeController.latitude = position.latitude;
      homeController.longitide = position.longitude;
    } catch (e) {
      AppConstant.myPrint(e);
    }
  }
}
