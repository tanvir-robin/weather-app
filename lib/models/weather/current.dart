import 'weather.dart';

class Current {
  double? temp; //

  int? humidity; //

  int? clouds; //

  double? windSpeed; //
  List<Weather>? weather; //

  Current({
    this.temp,
    this.humidity,
    this.clouds,
    this.windSpeed,
    this.weather,
  });

  factory Current.fromJson(Map<String, dynamic> json) => Current(
        temp: (json['temp'] as num?)?.toDouble(),
        humidity: json['humidity'] as int?,
        clouds: json['clouds'] as int?,
        windSpeed: (json['wind_speed'] as num?)?.toDouble(),
        weather: (json['weather'] as List<dynamic>?)
            ?.map((e) => Weather.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'temp': temp,
        'humidity': humidity,
        'clouds': clouds,
        'wind_speed': windSpeed,
        'weather': weather?.map((e) => e.toJson()).toList(),
      };
}
