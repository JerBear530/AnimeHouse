import 'package:json_annotation/json_annotation.dart';
import 'Streaming.dart';
part 'dataStreaming.g.dart';

@JsonSerializable(nullable: true)
class StreamingData {
  final List<Streaming> data;

  StreamingData({this.data});

  factory StreamingData.fromJson(Map<String, dynamic> json)=> _$StreamingDataFromJson(json);
  Map<String, dynamic> toJson() => _$StreamingDataToJson(this);
}