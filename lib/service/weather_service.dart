import 'package:gst_wether/resources/constant_manager.dart';

import '/api/api_repository.dart';
import '/model/current_weather_data.dart';
import '/model/five_days_data.dart';

class WeatherService {
  static String baseUrl = 'https://api.openweathermap.org/data/2.5';
  static String apiKey = 'appid=b02af426a3fad0d92d3e0b32f9324cf0';

  static getCurrentWeatherData({
    Function()? beforSend,
    Function(CurrentWeatherData currentWeatherData)? onSuccess,
    Function(dynamic error)? onError,
    required String city,
  }) {
    final url = '$baseUrl/weather?q=$city&lang=en&$apiKey';
    ApiRepository(
      url: url,
    ).get(
        beforeSend: () => {
              if (beforSend != null)
                {
                  beforSend(),
                },
            },
        onSuccess: (data) => {
              onSuccess!(CurrentWeatherData.fromJson(data)),
            },
        onError: (error) => {
              if (onError != null)
                {
                  AppConstant.myPrint(error),
                  onError(error),
                }
            });
  }

  static getCurrentWeatherDataLocation({
    Function()? beforSend,
    Function(CurrentWeatherData currentWeatherData)? onSuccess,
    Function(dynamic error)? onError,
    required double latitude,
    required double longitide,
  }) {
    final url = '$baseUrl/weather?lat=$latitude&lon=$longitide&lang=en&$apiKey';
    ApiRepository(
      url: url,
    ).get(
        beforeSend: () => {
              if (beforSend != null)
                {
                  beforSend(),
                },
            },
        onSuccess: (data) => {
              onSuccess!(CurrentWeatherData.fromJson(data)),
            },
        onError: (error) => {
              if (onError != null)
                {
                  AppConstant.myPrint(error),
                  onError(error),
                }
            });
  }

  static getFiveDaysThreeHoursForcastData({
    Function()? beforSend,
    Function(List<FiveDayData> fiveDayData)? onSuccess,
    Function(dynamic error)? onError,
    required String city,
  }) {
    final url = '$baseUrl/forecast?q=$city&lang=en&$apiKey';
    AppConstant.myPrint(url);
    ApiRepository(
      url: url,
    ).get(
        beforeSend: () => {},
        onSuccess: (data) => {
              onSuccess!((data['list'] as List)
                  .map((t) => FiveDayData.fromJson(t))
                  .toList())
            },
        onError: (error) => {
              AppConstant.myPrint(error),
              onError!(error),
            });
  }
}
