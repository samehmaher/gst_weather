import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gst_wether/resources/assets_manager.dart';
import 'package:gst_wether/resources/color_manager.dart';
import 'package:gst_wether/resources/constant_manager.dart';
import 'package:gst_wether/resources/styles_manager.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

import '../../../domins/controller/home_controller.dart';

class MyCard extends GetView<HomeController> {
  const MyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          colorFilter: ColorFilter.mode(Colors.black38, BlendMode.darken),
          image: AssetImage(
            AppConstant.imagesPath + ImageAssets.cloudInBlueSky,
          ),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
      ),
      child: Stack(
        children: [
          AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              icon: Icon(Icons.menu, color: ColorManager.whiteColor),
              onPressed: () {},
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 100, left: 20, right: 20),
            child: TextField(
              onChanged: (value) => controller.city = value,
              style: TextStyle(color: ColorManager.whiteColor),
              textInputAction: TextInputAction.search,
              onSubmitted: (value) => controller.updateWeather(),
              decoration: InputDecoration(
                suffix: Icon(Icons.search, color: ColorManager.whiteColor),
                hintStyle: TextStyle(color: ColorManager.whiteColor),
                hintText: 'Search'.toUpperCase(),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: ColorManager.whiteColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: ColorManager.whiteColor),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: ColorManager.whiteColor),
                ),
              ),
            ),
          ),
          Align(
            alignment: const Alignment(0.0, 1.0),
            child: SizedBox(
              height: 10,
              width: 10,
              child: OverflowBox(
                minWidth: 0.0,
                maxWidth: MediaQuery.of(context).size.width,
                minHeight: 0.0,
                maxHeight: (MediaQuery.of(context).size.height / 4),
                child: Stack(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      width: double.infinity,
                      height: double.infinity,
                      child: Card(
                        color: ColorManager.whiteColor,
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              padding: const EdgeInsets.only(
                                  top: 15, left: 20, right: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Center(
                                    child: Text(
                                      '${controller.currentWeatherData.name}',
                                      style: AppTextStyle.nunitoBlack.copyWith(
                                        fontSize: 24,
                                        color: ColorManager.blackTextColor,
                                      ),
                                    ),
                                  ),
                                  Center(
                                    child: Text(
                                      DateFormat()
                                          .add_MMMMEEEEd()
                                          .format(DateTime.now()),
                                      style:
                                          AppTextStyle.nunitoRegular.copyWith(
                                        fontSize: 16,
                                        color: ColorManager.blackTextColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  padding: const EdgeInsets.only(left: 50),
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                        '${controller.currentWeatherData.weather![0].description}',
                                        style:
                                            AppTextStyle.nunitoRegular.copyWith(
                                          fontSize: 22,
                                          color: ColorManager.blackTextColor,
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                        '${(controller.currentWeatherData.main!.temp! - 273.15).round().toString()}\u2103',
                                        style:
                                            AppTextStyle.nunitoRegular.copyWith(
                                          fontSize: 16,
                                          color: ColorManager.blackTextColor,
                                        ),
                                      ),
                                      Text(
                                        'min: ${(controller.currentWeatherData.main!.tempMin! - 273.15).round().toString()}\u2103 / max: ${(controller.currentWeatherData.main!.tempMax! - 273.15).round().toString()}\u2103',
                                        style:
                                            AppTextStyle.nunitoRegular.copyWith(
                                          fontSize: 14,
                                          color: ColorManager.blackTextColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.only(right: 20),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      SizedBox(
                                        width: 120,
                                        height: 120,
                                        child: LottieBuilder.asset(
                                            AppConstant.animsPath +
                                                AnimAssets.cloudy),
                                      ),
                                      Text(
                                        'wind ${controller.currentWeatherData.wind!.speed} m/s',
                                        style: AppTextStyle.nunitoBold.copyWith(
                                          fontSize: 16,
                                          color: ColorManager.blackTextColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
