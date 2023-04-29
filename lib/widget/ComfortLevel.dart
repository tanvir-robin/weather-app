import 'package:flutter/material.dart';
import 'package:weatherapp_starter_project/models/current_weather_data.dart';
import 'package:weatherapp_starter_project/models/weather_data.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class ComfortLevel extends StatelessWidget {
  final WeatherDataCurrent weatherDataCurrent;
  const ComfortLevel({super.key, required this.weatherDataCurrent});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Comfort Level',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 20,
        ),
        SleekCircularSlider(
          min: 0,
          max: 100,
          initialValue: weatherDataCurrent.current.humidity!.toDouble(),
          appearance: CircularSliderAppearance(
            customWidths:
                CustomSliderWidths(trackWidth: 12, progressBarWidth: 12),
            infoProperties: InfoProperties(
                bottomLabelText: "Hummidity",
                bottomLabelStyle: const TextStyle(
                  fontSize: 14,
                )),
            animationEnabled: true,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Feels Like ${weatherDataCurrent.current.feels_like}',
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              Text(
                'UV Index ${weatherDataCurrent.current.uvi}',
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              )
            ],
          ),
        )
      ],
    );
  }
}
