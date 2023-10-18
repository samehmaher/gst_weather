import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gst_wether/resources/assets_manager.dart';
import 'package:gst_wether/resources/color_manager.dart';
import 'package:gst_wether/resources/constant_manager.dart';
import 'package:gst_wether/resources/styles_manager.dart';
import 'package:lottie/lottie.dart';

import '../../../domins/controller/home_controller.dart';
import '../../../model/current_weather_data.dart';

class MyList extends GetView<HomeController> {
  const MyList({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return SizedBox(
        height: 150,
        child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          separatorBuilder: (context, index) => const VerticalDivider(
            color: Colors.transparent,
            width: 5,
          ),
          itemCount: controller.dataList.length,
          itemBuilder: (context, index) {
            CurrentWeatherData? data;
            (controller.dataList.isNotEmpty)
                ? data = controller.dataList[index]
                : data = null;
            return SizedBox(
              width: 140,
              height: 150,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      (data != null) ? '${data.name}' : '',
                      style: AppTextStyle.nunitoBlack.copyWith(
                          fontSize: 18, color: ColorManager.blackTextColor),
                    ),
                    Text(
                      (data != null)
                          ? '${(data.main!.temp! - 273.15).round().toString()}\u2103'
                          : '',
                      style: AppTextStyle.nunitoBlack.copyWith(
                          fontSize: 24, color: ColorManager.blackTextColor),
                    ),
                    SizedBox(
                      width: 50,
                      height: 50,
                      child: LottieBuilder.asset(
                          AppConstant.animsPath + AnimAssets.cloudy),
                    ),
                    Text(
                      (data != null) ? '${data.weather![0].description}' : '',
                      style: AppTextStyle.nunitoRegular.copyWith(
                          fontSize: 14, color: ColorManager.blackTextColor),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      );
    });
  }
}
