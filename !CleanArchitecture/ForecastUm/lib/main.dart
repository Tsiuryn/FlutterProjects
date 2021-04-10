import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forecastum/data/network/api/weather_api_service.dart';
import 'package:forecastum/data/network/weather_data_source.dart';
import 'package:forecastum/data/repository/weather_repository_impl.dart';
import 'package:forecastum/domain/repository/weather_repository.dart';
import 'package:forecastum/domain/usecase/get_forecast_by_localization_usecase.dart';
import 'package:forecastum/presentation/forecast/forecast_bloc.dart';
import 'package:forecastum/presentation/forecast/forecast_page.dart';
import 'package:forecastum/theme.dart';

// import 'package:get_it/get_it.dart';
import 'package:page_router/page_router.dart';

// GetIt getIt = GetIt.instance;

/// Custom [BlocObserver] which observes all bloc and cubit instances.
class SimpleBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object event) {
    print(event);
    super.onEvent(bloc, event);
  }

  @override
  void onChange(Cubit cubit, Change change) {
    print(change);
    super.onChange(cubit, change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    print(transition);
    super.onTransition(bloc, transition);
  }

  @override
  void onError(Cubit cubit, Object error, StackTrace stackTrace) {
    print(error);
    super.onError(cubit, error, stackTrace);
  }
}

void main() {
  // HttpOverrides.global = new MyHttpOverrides(); // trust all certificate
  Bloc.observer = SimpleBlocObserver();
  runApp(App());

  // getIt.registerSingleton<WeatherDataSource>(WeatherDataSource(WeatherApiService(Dio())),
  //     signalsReady: true);
  //
  // getIt.registerSingleton<WeatherRepository>(WeatherRepositoryImpl(getIt<WeatherDataSource>()),
  //     signalsReady: true);
  //
  // getIt.registerFactory<GetForecastByLocalizationUseCase>(() {
  //   return GetForecastByLocalizationUseCase(getIt<WeatherRepository>());
  // });
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final routeData = PageRouterData({
    '/': RoutePath(
        builder: (context, params) => MaterialPage(
              key: ValueKey('/'),
              child: BlocProvider(
                  create: (context) => ForecastBloc(
                      GetForecastByLocalizationUseCase(WeatherRepositoryImpl(
                          WeatherDataSource(WeatherApiService(Dio(), baseUrl: 'https://api.openweathermap.org/data/2.5'))))),
                  child: ForecastPage()),
            ))
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeData>(
        builder: (_, theme) {
          return PageRouter(
            data: routeData,
            child: MaterialApp.router(
              title: 'Forecast',
              theme: theme,
              routerDelegate: routeData.routerDelegate,
              routeInformationParser: routeData.informationParser,
            ),
          );
        },
      ),
    );
  }
}
