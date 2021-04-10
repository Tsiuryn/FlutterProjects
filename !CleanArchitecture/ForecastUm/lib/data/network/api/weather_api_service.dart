import 'package:dio/dio.dart';
import 'package:forecastum/data/model/main_model.dart';
import 'package:retrofit/http.dart';

part 'weather_api_service.g.dart';

// full url: http://api.openweathermap.org/data/2.5/weather?lat=53&lon=27&appid=d7f302334a1631a3b0b61e6a8f263eec&units=metric
const String baseUrl = 'https://api.openweathermap.org/data/2.5';


@RestApi(baseUrl : "https://api.openweathermap.org/data/2.5")
abstract class WeatherApiService {
  factory WeatherApiService(Dio dio, {String baseUrl}) = _WeatherApiService;

  @GET("/weather")
  Future<MainModel> getForecastByLocalization(
      @Query("lat") double lat,
      @Query("lon") double lon,
      @Query("appid") String idKey,
      @Query("units") String units,
      );
}