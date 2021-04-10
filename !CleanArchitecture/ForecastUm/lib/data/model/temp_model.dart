import 'package:json_annotation/json_annotation.dart';

part 'temp_model.g.dart';

@JsonSerializable()
class TempModel{
  double temp;
  TempModel({this.temp});

  factory TempModel.fromJson(Map<String, dynamic> json) => _$TempModelFromJson(json);
  Map<String, dynamic> toJson() => _$TempModelToJson(this);
}