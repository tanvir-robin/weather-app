import 'package:flutter/material.dart';
import 'package:weatherapp_starter_project/models/current_weather_data.dart';
import '../util/custom_colors.dart';

class CurrentWeatherWidget extends StatelessWidget {
  final WeatherDataCurrent weatherDataCurrent;
  CurrentWeatherWidget(this.weatherDataCurrent);

  Widget CurrentWeatherDataWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Image.asset(
          "assets/weather/${weatherDataCurrent.current.weather![0].icon}.png",
          height: 80,
          width: 80,
        ),
        Container(
          width: 1,
          height: 50,
          color: CustomColors.dividerLine,
        ),
        RichText(
          text: TextSpan(children: [
            TextSpan(
                text: "${weatherDataCurrent.current.temp}°",
                style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 68,
                    color: CustomColors.textColorBlack)),
            TextSpan(
                text: "${weatherDataCurrent.current.weather![0].description}",
                style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Colors.grey)),
          ]),
        )
      ],
    );
  }

  Widget MoreDetailsOnCurrentWeatherData() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                  color: CustomColors.cardColor,
                  borderRadius: BorderRadius.circular(15)),
              child: Image.asset("assets/icons/windspeed.png",
                  fit: BoxFit.contain),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                  color: CustomColors.cardColor,
                  borderRadius: BorderRadius.circular(15)),
              child:
                  Image.asset("assets/icons/clouds.png", fit: BoxFit.contain),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                  color: CustomColors.cardColor,
                  borderRadius: BorderRadius.circular(15)),
              child:
                  Image.asset("assets/icons/humidity.png", fit: BoxFit.contain),
            ),
          ],
        ),
        const SizedBox(
          height: 7,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: 20,
              width: 60,
              child: Text(
                "${weatherDataCurrent.current.windSpeed} km/h",
                style:
                    const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 20,
              width: 60,
              child: Text(
                "${weatherDataCurrent.current.clouds}%",
                style:
                    const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 20,
              width: 60,
              child: Text(
                "${weatherDataCurrent.current.humidity}%",
                style:
                    const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //current weather
        CurrentWeatherDataWidget(),
        const SizedBox(
          height: 20,
        ),
        //More details
        MoreDetailsOnCurrentWeatherData(),
      ],
    );
  }
}
