// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_message_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SendMessageResponse _$SendMessageResponseFromJson(Map<String, dynamic> json) =>
    SendMessageResponse(
      msg: json['msg'] as String?,
      id: json['id'] as String?,
      createdAt: json['createdAt'] as String?,
      statusCode: (json['statusCode'] as num?)?.toInt(),
    );

Map<String, dynamic> _$SendMessageResponseToJson(
        SendMessageResponse instance) =>
    <String, dynamic>{
      'msg': instance.msg,
      'id': instance.id,
      'createdAt': instance.createdAt,
      'statusCode': instance.statusCode,
    };
