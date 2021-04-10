import 'package:forecastum/data/model/main_model.dart';
import 'package:forecastum/data/network/api/weather_api_service.dart';

const String apiKey = 'd7f302334a1631a3b0b61e6a8f263eec';
const String units = 'metric';

class WeatherDataSource {
  WeatherApiService _weatherApiService;

  WeatherDataSource(this._weatherApiService);

  Future<MainModel> getRatesByLocalization(double lat, double lon) {
    return _weatherApiService.getForecastByLocalization(lat, lon, apiKey, units);
  }
}