import 'package:weatherapp_starter_project/models/current_weather_data.dart';
import 'package:weatherapp_starter_project/models/daily_weather_data.dart';
import 'package:weatherapp_starter_project/models/hourly_weather_data.dart';

class WeatherData {
  WeatherDataCurrent? current;
  WeatherDataHourly? hourly;
  WeatherDataDaily? daily;
  WeatherData([this.current, this.hourly, this.daily]);

  WeatherDataCurrent weatherDataCurrent() => current!;
  WeatherDataHourly weatherDataHourly() => hourly!;
  WeatherDataDaily weatherDataDaily() => daily!;
}
