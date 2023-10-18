import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gst_wether/resources/assets_manager.dart';
import 'package:gst_wether/resources/color_manager.dart';
import 'package:gst_wether/resources/constant_manager.dart';
import 'package:gst_wether/resources/styles_manager.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

import '../domins/controller/home_controller.dart';
import 'home/widget/my_chart.dart';
import 'home/widget/my_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GetBuilder<HomeController>(builder: (controller) {
        return controller.currentWeatherData.name == null
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          colorFilter: ColorFilter.mode(
                              Colors.black38, BlendMode.darken),
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
                      child: SafeArea(
                        child: Stack(
                          children: <Widget>[
                            Container(
                              padding: const EdgeInsets.only(
                                  top: 20, left: 20, right: 20),
                              child: TextField(
                                onChanged: (value) => controller.city = value,
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                                textInputAction: TextInputAction.search,
                                onSubmitted: (value) =>
                                    controller.updateWeather(),
                                decoration: InputDecoration(
                                  suffix: Icon(Icons.search,
                                      color: ColorManager.whiteColor),
                                  hintStyle:
                                      TextStyle(color: ColorManager.whiteColor),
                                  hintText: 'Search'.toUpperCase(),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                        color: ColorManager.whiteColor),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                        color: ColorManager.whiteColor),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                        color: ColorManager.whiteColor),
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: const Alignment(0.0, 0.8),
                              child: SizedBox(
                                height: 10,
                                width: 10,
                                child: OverflowBox(
                                  minWidth: 0.0,
                                  maxWidth: MediaQuery.of(context).size.width,
                                  minHeight: 0.0,
                                  maxHeight:
                                      (MediaQuery.of(context).size.height /
                                          3.5),
                                  child: Stack(
                                    children: <Widget>[
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15),
                                        width: double.infinity,
                                        height: double.infinity,
                                        child: Card(
                                          color: ColorManager.whiteColor,
                                          elevation: 5,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(25),
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                padding: const EdgeInsets.only(
                                                    top: 10,
                                                    left: 20,
                                                    right: 20),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Center(
                                                      child: Text(
                                                          '${controller.currentWeatherData.name}'
                                                              .toUpperCase(),
                                                          style: AppTextStyle
                                                              .nunitoBlack
                                                              .copyWith(
                                                            fontSize: 24,
                                                            color: ColorManager
                                                                .blackTextColor,
                                                          )),
                                                    ),
                                                    Center(
                                                      child: Text(
                                                        DateFormat()
                                                            .add_MMMMEEEEd()
                                                            .format(
                                                                DateTime.now()),
                                                        style: AppTextStyle
                                                            .nunitoRegular
                                                            .copyWith(
                                                          fontSize: 16,
                                                          color: ColorManager
                                                              .blackTextColor,
                                                        ),
                                                      ),
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        if (kDebugMode) {
                                                          print("HI");
                                                        }
                                                        controller
                                                            .getCurrentWeatherDataLocation();
                                                      },
                                                      child: Center(
                                                        child: Container(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(2),
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            color: ColorManager
                                                                .blackTextColor,
                                                          ),
                                                          width: 120,
                                                          child: Center(
                                                            child: Text(
                                                                "Get current location",
                                                                style: AppTextStyle
                                                                    .nunitoBlack
                                                                    .copyWith(
                                                                  fontSize: 10,
                                                                  color: ColorManager
                                                                      .whiteColor,
                                                                )),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const Divider(),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: <Widget>[
                                                  Container(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 40),
                                                    child: Column(
                                                      children: <Widget>[
                                                        Text(
                                                          '${controller.currentWeatherData.weather![0].description}',
                                                          style: AppTextStyle
                                                              .nunitoRegular
                                                              .copyWith(
                                                            fontSize: 20,
                                                            color: ColorManager
                                                                .blackTextColor,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                            height: 5),
                                                        Text(
                                                          '${(controller.currentWeatherData.main!.temp! - 273.15).round().toString()}\u2103',
                                                          style: AppTextStyle
                                                              .nunitoRegular
                                                              .copyWith(
                                                            fontSize: 16,
                                                            color: ColorManager
                                                                .blackTextColor,
                                                          ),
                                                        ),
                                                        Text(
                                                          'min: ${(controller.currentWeatherData.main!.tempMin! - 273.15).round().toString()}\u2103 / max: ${(controller.currentWeatherData.main!.tempMax! - 273.15).round().toString()}\u2103',
                                                          style: AppTextStyle
                                                              .nunitoRegular
                                                              .copyWith(
                                                            fontSize: 14,
                                                            color: ColorManager
                                                                .blackTextColor,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 20),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: <Widget>[
                                                        SizedBox(
                                                          width: 120,
                                                          height: 100,
                                                          child: LottieBuilder
                                                              .asset(AppConstant
                                                                      .animsPath +
                                                                  AnimAssets
                                                                      .cloudy),
                                                        ),
                                                        Text(
                                                          'wind ${controller.currentWeatherData.wind!.speed} m/s',
                                                          style: AppTextStyle
                                                              .nunitoRegular
                                                              .copyWith(
                                                            fontSize: 14,
                                                            color: ColorManager
                                                                .blackTextColor,
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
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Stack(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Container(
                            padding: const EdgeInsets.only(top: 120),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'other city'.toUpperCase(),
                                    style: AppTextStyle.nunitoBold.copyWith(
                                        fontSize: 18,
                                        color: ColorManager.blackTextColor),
                                  ),
                                  const MyList(),
                                  Container(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text(
                                          'forcast next 5 days'.toUpperCase(),
                                          style:
                                              AppTextStyle.nunitoBold.copyWith(
                                            fontSize: 18,
                                            color: ColorManager.blackTextColor,
                                          ),
                                        ),
                                        Icon(
                                          Icons.next_plan_outlined,
                                          color: ColorManager.blackColor,
                                        ),
                                      ],
                                    ),
                                  ),
                                  const MyChart(),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
      }),
    );
  }
}
