class WeatherDataCurrent {
  final Current current;
  WeatherDataCurrent({required this.current});

  factory WeatherDataCurrent.fromJson(Map<String, dynamic> json) =>
      WeatherDataCurrent(current: Current.fromJson(json['current']));
}

class Current {
  int? temp; //
  double? feels_like;
  double? uvi;
  int? humidity; //
  int? sunrise;
  int? sunset;
  int? clouds; //

  double? windSpeed; //
  List<Weather>? weather; //

  Current(
      {this.temp,
      this.humidity,
      this.clouds,
      this.windSpeed,
      this.weather,
      this.feels_like,
      this.sunrise,
      this.sunset,
      this.uvi});

  factory Current.fromJson(Map<String, dynamic> json) => Current(
        temp: (json['temp'] as num?)?.round(),
        humidity: json['humidity'] as int?,
        clouds: json['clouds'] as int?,
        sunrise: json['sunrise'] as int?,
        sunset: json['sunset'] as int?,
        uvi: (json['uvi'] as num?)?.toDouble(),
        feels_like: (json['feels_like'] as num?)?.toDouble(),
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
        'uvi': uvi,
        'feels_like': feels_like,
        'sunrise': sunrise,
        'sunset': sunset
      };
}

class Weather {
  int? id;
  String? main;
  String? description;
  String? icon;

  Weather({this.id, this.main, this.description, this.icon});

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        id: (json['id'] as int?),
        main: (json['main'] as String?),
        description: (json['description'] as String?),
        icon: (json['icon'] as String?),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'main': main,
        'description': description,
        'icon': icon,
      };
}
