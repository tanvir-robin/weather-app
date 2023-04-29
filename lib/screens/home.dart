import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/global_controller.dart';
import '../widget/Sun_Info.dart';
import '../widget/daily_forecast.dart';
import '../widget/heder.dart';
import '../widget/current_weather.dart';
import '../widget/Hourly_data_widger.dart';
import '../widget/ComfortLevel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final globalcontroller = Get.put(GlobalController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //appBar: AppBar(title: const Text('My Weather')),
        body: Obx(() => globalcontroller.checkStatus().isTrue
            ? Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/icons/clouds.png'),
                      SizedBox(
                        height: 10,
                      ),
                      const CircularProgressIndicator(),
                    ]),
              )
            : ListView(
                scrollDirection: Axis.vertical,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  HeaderSc(),
                  CurrentWeatherWidget(
                      globalcontroller.getWeatherData().weatherDataCurrent()),
                  const SizedBox(
                    height: 20,
                  ),
                  HourlyDataWidget(
                    weatherDataHourly:
                        globalcontroller.getWeatherData().weatherDataHourly(),
                  ),
                  SunInfo(
                      weatherDataCurrent: globalcontroller
                          .getWeatherData()
                          .weatherDataCurrent()),
                  DailyForecast(
                    weatherDataDaily:
                        globalcontroller.getWeatherData().weatherDataDaily(),
                  ),
                  const Divider(),
                  ComfortLevel(
                    weatherDataCurrent:
                        globalcontroller.getWeatherData().weatherDataCurrent(),
                  )
                ],
              )));
  }
}
