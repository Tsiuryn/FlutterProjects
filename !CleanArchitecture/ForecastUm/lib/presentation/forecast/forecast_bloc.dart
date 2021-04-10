


import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:forecastum/data/network/api/weather_api_service.dart';
import 'package:forecastum/data/network/weather_data_source.dart';
import 'package:forecastum/data/repository/weather_repository_impl.dart';
import 'package:forecastum/domain/model/localization.dart';
import 'package:forecastum/domain/model/weather_bean.dart';
import 'package:forecastum/domain/usecase/get_forecast_by_localization_usecase.dart';

class ForecastBloc extends Bloc<Event, WeatherBean> {
  GetForecastByLocalizationUseCase _getForecast;

  ForecastBloc(this._getForecast) : super(WeatherBean()){
    add(Event.init);
  }



  @override
  Stream<WeatherBean> mapEventToState(Event event) async* {

    switch (event) {
      case Event.init:
        var weather = await _getForecast.execute(Localization(53.8, 27.4));
          yield weather;
        break;

      default:
        addError(Exception('unsupported event'));
    }
  }
}

/// Event being processed by [CounterBloc].
enum Event {
  init
}