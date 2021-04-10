// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_api_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _WeatherApiService implements WeatherApiService {
  _WeatherApiService(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<MainModel> getForecastByLocalization(lat, lon, idKey, units) async {
    ArgumentError.checkNotNull(lat, 'lat');
    ArgumentError.checkNotNull(lon, 'lon');
    ArgumentError.checkNotNull(idKey, 'idKey');
    ArgumentError.checkNotNull(units, 'units');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'lat': lat,
      r'lon': lon,
      r'appid': idKey,
      r'units': units
    };
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('/weather',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = MainModel.fromJson(_result.data);
    return value;
  }
}
