

import 'package:forecastum/data/network/weather_data_source.dart';
import 'package:forecastum/domain/model/weather_bean.dart';
import 'package:forecastum/domain/repository/weather_repository.dart';

class WeatherRepositoryImpl extends WeatherRepository {
  WeatherDataSource _dataSource;

  WeatherRepositoryImpl(this._dataSource);

  @override
  Future<WeatherBean> getWeatherByLocalization(double lat, double lon) {
    _dataSource.getRatesByLocalization(lat, lon).asStream().map((src){
      print (src.weather[0].id.toString() + 'LJLJLJLKLJLK');
      return WeatherBean(
          temperature: src.main.temp,
          iconId: src.weather[0].id,
          cityName: src.name
      );
    });

  }
}