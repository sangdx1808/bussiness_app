// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseListData<T> _$BaseListDataFromJson<T>(
  Map json,
  T Function(Object? json) fromJsonT,
) =>
    BaseListData<T>(
      data: (json['data'] as List<dynamic>?)?.map(fromJsonT).toList(),
      language: json['language'] as String?,
      message: json['message'] as String?,
      status: json['status'],
    );

Map<String, dynamic> _$BaseListDataToJson<T>(
  BaseListData<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'data': instance.data?.map(toJsonT).toList(),
      'language': instance.language,
      'message': instance.message,
      'status': instance.status,
    };

BaseData<T> _$BaseDataFromJson<T>(
  Map json,
  T Function(Object? json) fromJsonT,
) =>
    BaseData<T>(
      data: _$nullableGenericFromJson(json['data'], fromJsonT),
      language: json['language'] as String?,
      message: json['message'] as String?,
      status: json['status'],
    );

Map<String, dynamic> _$BaseDataToJson<T>(
  BaseData<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'data': _$nullableGenericToJson(instance.data, toJsonT),
      'language': instance.language,
      'message': instance.message,
      'status': instance.status,
    };

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) =>
    input == null ? null : toJson(input);
