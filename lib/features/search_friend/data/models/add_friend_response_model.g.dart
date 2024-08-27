// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_friend_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddFriendResponseModel _$AddFriendResponseModelFromJson(
        Map<String, dynamic> json) =>
    AddFriendResponseModel(
      (json['id'] as num).toInt(),
      json['userId'] as String,
      json['outGoing'] as bool,
      json['image'] as String?,
      json['email'] as String,
      json['firstname'] as String,
      json['lastname'] as String,
      json['createdAt'] as String,
      json['isSent'] as bool,
    );

Map<String, dynamic> _$AddFriendResponseModelToJson(
        AddFriendResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'outGoing': instance.outGoing,
      'image': instance.image,
      'email': instance.email,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'createdAt': instance.createdAt,
      'isSent': instance.isSent,
    };
