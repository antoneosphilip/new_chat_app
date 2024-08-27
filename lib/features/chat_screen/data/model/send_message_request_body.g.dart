// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_message_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SendMessageRequestBody _$SendMessageRequestBodyFromJson(
        Map<String, dynamic> json) =>
    SendMessageRequestBody(
      friendShipId: (json['friendShipId'] as num).toInt(),
      message: json['message'] as String,
    );

Map<String, dynamic> _$SendMessageRequestBodyToJson(
        SendMessageRequestBody instance) =>
    <String, dynamic>{
      'friendShipId': instance.friendShipId,
      'message': instance.message,
    };
