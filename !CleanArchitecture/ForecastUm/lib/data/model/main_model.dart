
import 'package:forecastum/data/model/temp_model.dart';
import 'package:forecastum/data/model/weather_model.dart';
import 'package:json_annotation/json_annotation.dart';

/*
{
  "coord": {
    "lon": 27,
    "lat": 53
  },
  "weather": [
    {
      "id": 804,
      "main": "Clouds",
      "description": "overcast clouds",
      "icon": "04d"
    }
  ],
  "base": "stations",
  "main": {
    "temp": 1.41,
    "feels_like": -4.02,
    "temp_min": 1.41,
    "temp_max": 1.41,
    "pressure": 1014,
    "humidity": 75,
    "sea_level": 1014,
    "grnd_level": 994
  },
  "visibility": 10000,
  "wind": {
    "speed": 4.43,
    "deg": 349,
    "gust": 5.61
  },
  "clouds": {
    "all": 100
  },
  "dt": 1616060013,
  "sys": {
    "country": "BY",
    "sunrise": 1616041159,
    "sunset": 1616084449
  },
  "timezone": 10800,
  "id": 620869,
  "name": "Timkovichi",
  "cod": 200
}
 */
part 'main_model.g.dart';

@JsonSerializable()
class MainModel{
  TempModel main;
  String name;
  List<WeatherModel> weather;

  MainModel({this.main, this.name, this.weather});

  factory MainModel.fromJson(Map<String, dynamic> json) => _$MainModelFromJson(json);
  Map<String, dynamic> toJson() => _$MainModelToJson(this);
}


