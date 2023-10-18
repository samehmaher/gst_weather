import 'package:get/get.dart';
import 'package:gst_wether/resources/constant_manager.dart';

import '../../service/geolocator_service.dart';
import '/model/current_weather_data.dart';
import '/model/five_days_data.dart';
import '/service/weather_service.dart';

class HomeController extends GetxController {
  String? city = "cairo";
  String? searchText;
  double? latitude;
  double? longitide;
  CurrentWeatherData currentWeatherData = CurrentWeatherData();
  List<CurrentWeatherData> dataList = [];
  List<FiveDayData> fiveDaysData = [];

  @override
  Future<void> onInit() async {
    await getCurrentWeatherDataLocation();
    await getFiveDaysData();
    await getTopFiveCities();
    super.onInit();
  }

  void updateWeather() {
    getCurrentWeatherData();
    getFiveDaysData();
    getTopFiveCities();
  }

  getCurrentWeatherDataLocation() async {
    await Location().getCurrentLocation();
    await WeatherService.getCurrentWeatherDataLocation(
        latitude: latitude!,
        longitide: longitide!,
        onSuccess: (data) {
          currentWeatherData = data;
          update();
        },
        onError: (error) => {
              AppConstant.myPrint(error),
              update(),
            });
  }

  getCurrentWeatherData() async {
    await WeatherService.getCurrentWeatherData(
        city: city!,
        onSuccess: (data) {
          currentWeatherData = data;
          update();
        },
        onError: (error) => {
              AppConstant.myPrint(error),
              update(),
            });
  }

  getTopFiveCities() async {
    List<String> cities = [
      'cairo',
      'zagazig',
      'alexandria',
      'ismailia',
      'fayoum'
    ];
    for (var c in cities) {
      await WeatherService.getCurrentWeatherData(
          city: c,
          onSuccess: (data) {
            dataList.add(data);
            update();
          },
          onError: (error) {
            AppConstant.myPrint(error);
            update();
          });
    }
  }

  getFiveDaysData() async {
    await WeatherService.getFiveDaysThreeHoursForcastData(
        city: city!,
        onSuccess: (data) {
          fiveDaysData = data;
          update();
        },
        onError: (error) {
          AppConstant.myPrint(error);
          update();
        });
  }
}
