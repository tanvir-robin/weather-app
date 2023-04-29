import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';

import '../api/fetch_data.dart';
import '../models/weather_data.dart';
import '../models/current_weather_data.dart';

class GlobalController extends GetxController {
  final RxBool _isLoading = true.obs;
  final RxDouble _lat = 0.0.obs;
  final RxDouble _lng = 0.0.obs;
  final RxInt cardIndex = 0.obs;
  final weatherData = WeatherData().obs;

  RxBool checkStatus() => _isLoading;
  RxDouble getlat() => _lat;
  RxDouble getlng() => _lng;
  WeatherData getWeatherData() => weatherData.value;

  @override
  void onInit() {
    if (_isLoading.isTrue) {
      getLocation();
    } else {
      getIndex();
    }
    super.onInit();
  }

  RxInt getIndex() => cardIndex;
  getLocation() async {
    bool isEnabled = await Geolocator.isLocationServiceEnabled();
    if (!isEnabled) return Future.error('Service is not enabled');

    LocationPermission locationP = await Geolocator.checkPermission();
    if (locationP == LocationPermission.deniedForever) {
      Future.error('Service denied forever');
    } else if (locationP == LocationPermission.denied) {
      locationP = await Geolocator.requestPermission();
      if (locationP == LocationPermission.denied) {
        Future.error('Service denied');
      }
    }

    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low)
        .then((value) {
      _lat.value = value.latitude;
      _lng.value = value.longitude;

      return fetchData().getData(_lat.value, _lng.value).then((value) {
        weatherData.value = value;
        _isLoading.value = false;
      });
    });
  }
}
