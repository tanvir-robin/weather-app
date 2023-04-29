import 'package:flutter/material.dart';
import 'package:weatherapp_starter_project/models/daily_weather_data.dart';
import '../util/custom_colors.dart';
import 'package:intl/intl.dart';

class DailyForecast extends StatelessWidget {
  final WeatherDataDaily weatherDataDaily;
  const DailyForecast({required this.weatherDataDaily});

  String getDay(int dt) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(dt * 1000);
    String x = DateFormat('EEE').format(date);
    return x;
  }

  Widget dailyList() {
    return SizedBox(
      // height: 300,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: weatherDataDaily.daily.length > 7
            ? 7
            : weatherDataDaily.daily.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                height: 50,
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(getDay(weatherDataDaily.daily[index].dt!)),
                    SizedBox(
                      height: 30,
                      width: 30,
                      child: Image.asset(
                          'assets/weather/${weatherDataDaily.daily[index].weather![0].icon}.png'),
                    ),
                    Text(
                        '${weatherDataDaily.daily[index].temp!.min}°/${weatherDataDaily.daily[index].temp!.max}°'),
                  ],
                ),
              ),
              Container(height: 1, color: CustomColors.dividerLine)
            ],
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 400,
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: CustomColors.dividerLine.withAlpha(150),
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            child: const Text(
              '7 Days Forecast',
              style: TextStyle(fontSize: 17),
            ),
          ),
          dailyList(),
        ],
      ),
    );
  }
}
