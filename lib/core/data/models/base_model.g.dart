// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseModel<T> _$BaseModelFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    BaseModel<T>(
      result: _$nullableGenericFromJson(json['result'], fromJsonT),
      totalCount: (json['totalCount'] as num?)?.toInt(),
      targetUrl: json['targetUrl'] as String?,
      message: json['message'] as String?,
      unAuthorizedRequest: json['unAuthorizedRequest'] as bool?,
      success: json['success'] as bool?,
      error: json['error'] == null
          ? null
          : ErrorModel.fromJson(json['error'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BaseModelToJson<T>(
  BaseModel<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'result': _$nullableGenericToJson(instance.result, toJsonT),
      'message': instance.message,
      'totalCount': instance.totalCount,
      'error': instance.error?.toJson(),
      'targetUrl': instance.targetUrl,
      'success': instance.success,
      'unAuthorizedRequest': instance.unAuthorizedRequest,
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
