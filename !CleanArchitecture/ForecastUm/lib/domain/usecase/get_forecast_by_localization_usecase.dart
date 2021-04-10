

import 'package:forecastum/domain/model/localization.dart';
import 'package:forecastum/domain/model/weather_bean.dart';
import 'package:forecastum/domain/repository/weather_repository.dart';

import 'base/future_usecase.dart';

class GetForecastByLocalizationUseCase extends FutureUseCase<Localization, WeatherBean> {
  WeatherRepository _weatherRepository;

  GetForecastByLocalizationUseCase(this._weatherRepository);

  @override
  Future<WeatherBean> execute(Localization localization) {
    return _weatherRepository.getWeatherByLocalization(localization.lat, localization.lon);
  }

}