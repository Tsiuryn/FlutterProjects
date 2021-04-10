import 'package:forecastum/domain/model/weather_bean.dart';

abstract class WeatherRepository{
  Future<WeatherBean> getWeatherByLocalization(double lat, double lon);
}