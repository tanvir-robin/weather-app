import 'package:flutter/material.dart';
import 'package:weatherapp_starter_project/util/custom_colors.dart';
import '../models/current_weather_data.dart';
import 'package:intl/intl.dart';

class SunInfo extends StatelessWidget {
  final WeatherDataCurrent weatherDataCurrent;
  const SunInfo({required this.weatherDataCurrent});

  String getTime(int x) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(x * 1000);
    String f = DateFormat('jm').format(date);
    return f;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Image.asset(
          'assets/icons/sunrise.png',
          height: 80,
          //width: 20,
        ),
        Container(
          alignment: Alignment.center,
          height: 80,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Sun Rise',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                getTime(weatherDataCurrent.current.sunrise!),
                style: const TextStyle(fontSize: 13),
              ),
            ],
          ),
        ),
        Container(
          alignment: Alignment.center,
          width: 30,
          // child: VerticalDivider(),
        ),
        Image.asset(
          'assets/icons/sunset.png',
          height: 120,
          //width: 20,
        ),
        Container(
          alignment: Alignment.center,
          height: 120,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Sun Set',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(getTime(weatherDataCurrent.current.sunset!),
                  style: const TextStyle(fontSize: 13)),
            ],
          ),
        )
      ],
    );
  }
}
