import 'package:json_annotation/json_annotation.dart';

part 'base_model.g.dart';

@JsonSerializable(
  genericArgumentFactories: true,
  anyMap: true,
  explicitToJson: true,
)
class BaseListData<T> {
  BaseListData({this.data, this.language, this.message, this.status});

  factory BaseListData.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$BaseListDataFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) =>
      _$BaseListDataToJson(this, toJsonT);

  final List<T>? data;
  final String? language;
  final String? message;
  final dynamic status;
  bool get isSuccessful =>
      (status is int && status == 200) ||
      (status is String && status == 'OK') ||
      (status is String && status == 'SUCCESS');
}

@JsonSerializable(
  genericArgumentFactories: true,
  anyMap: true,
  explicitToJson: true,
)
class BaseData<T> {
  BaseData({this.data, this.language, this.message, this.status});

  final T? data;
  final String? language;
  final String? message;
  final dynamic status;

  factory BaseData.fromJson(
    Map<String, dynamic>? json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$BaseDataFromJson(json ?? {}, fromJsonT);

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) =>
      _$BaseDataToJson(this, toJsonT);
  bool get isSuccessful =>
      (status is int && status == 200) ||
      (status is String && status == 'OK') ||
      (status is String && status == 'SUCCESS');
}

class BaseDataDynamic {
  BaseDataDynamic({this.data, this.language, this.message, this.status});

  final dynamic data;
  final String? language;
  final String? message;
  final dynamic status;

  factory BaseDataDynamic.fromJson(Map<String, dynamic> json) =>
      BaseDataDynamic(
        data: json,
        language: json['language'] as String?,
        message: json['message'] as String?,
        status: json['status'],
      );

  bool get isSuccessful =>
      (status is int && status == 200) ||
      (status is String && status == 'OK') ||
      (status is String && status == 'SUCCESS');
}
