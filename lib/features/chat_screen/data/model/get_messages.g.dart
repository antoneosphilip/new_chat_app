// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_messages.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetMessageResponse _$GetMessageResponseFromJson(Map<String, dynamic> json) =>
    GetMessageResponse(
      id: json['id'],
      text: json['text'] as String?,
      senderId: json['senderId'] as String?,
      isSent: json['isSent'] as bool?,
      createdAt: json['createdAt'] as String?,
    );

Map<String, dynamic> _$GetMessageResponseToJson(GetMessageResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'senderId': instance.senderId,
      'isSent': instance.isSent,
      'createdAt': instance.createdAt,
    };
