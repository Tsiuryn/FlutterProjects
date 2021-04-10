import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forecastum/data/model/main_model.dart';
import 'package:forecastum/data/network/api/weather_api_service.dart';
import 'package:forecastum/domain/model/weather_bean.dart';
import 'package:forecastum/domain/usecase/get_forecast_by_localization_usecase.dart';
import 'package:forecastum/presentation/forecast/forecast_bloc.dart';
// import 'package:get_it/get_it.dart';

import 'forecast_bloc.dart';

class ForecastPage extends StatelessWidget {
  String getCityName(String name) {
    if (name != null) {
      return name;
    } else
      return 'Hello';
  }

  //todo if don't come response
  void getName() async{
  MainModel mainModel =   await WeatherApiService(Dio(), baseUrl: 'https://api.openweathermap.org/data/2.5')
        .getForecastByLocalization(53.8, 27.4, 'd7f302334a1631a3b0b61e6a8f263eec', 'metric');
  print(mainModel.weather[0].id.toString() + '  3333333ljljlk');

  }

  @override
  Widget build(BuildContext context) {
    getName();
    // ignore: close_sinks
    ForecastBloc _bloc = BlocProvider.of<ForecastBloc>(context);
    // _bloc.add(Event.init);
    return Scaffold(
        appBar: AppBar(
          title: Text('Forecast'),
        ),
        body: BlocBuilder<ForecastBloc, WeatherBean>(builder: (_, weatherBean) {
          if (weatherBean != null && weatherBean.iconId != null) {
            return Center(child: Text(weatherBean.iconId.toString()));
          } else {
            // Timer.periodic(Duration(seconds: 5), (timer){
            //   _bloc.add(Event.nothing);
            // });
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        }));
  }
}
