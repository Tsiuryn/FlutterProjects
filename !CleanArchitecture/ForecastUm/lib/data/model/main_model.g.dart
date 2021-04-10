// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MainModel _$MainModelFromJson(Map<String, dynamic> json) {
  return MainModel(
    main: json['main'] == null
        ? null
        : TempModel.fromJson(json['main'] as Map<String, dynamic>),
    name: json['name'] as String,
    weather: (json['weather'] as List)
        ?.map((e) =>
            e == null ? null : WeatherModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$MainModelToJson(MainModel instance) => <String, dynamic>{
      'main': instance.main,
      'name': instance.name,
      'weather': instance.weather,
    };
