import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:flutter/cupertino.dart';

const apiKey = 'd7f302334a1631a3b0b61e6a8f263eec';
const _authority = "api.openweathermap.org";
final _path = "/data/2.5/weather";

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {

    NetworkHelper networkHelper = NetworkHelper(
        getUriWithCity(cityName: cityName));

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(getUriWithLocation(lat: location.latitude, lon: location.longitude));

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Uri getUriWithCity({@required String cityName}) {
    final params = {
      'q': cityName,
      'appid': apiKey,
      'units': 'metric'
    };

    return Uri.https(_authority, _path, params);
  }

  Uri getUriWithLocation({@required double lat, @required double lon}) {
    final params = {
      'lat': lat.toString(),
      'lon': lon.toString(),
      'appid': apiKey,
      'units': 'metric'
    };
    return Uri.https(_authority, _path, params);
  }

    String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
