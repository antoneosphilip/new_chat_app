// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_friend_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchFriendModel _$SearchFriendModelFromJson(Map<String, dynamic> json) =>
    SearchFriendModel(
      json['id'] as String,
      json['firstname'] as String,
      json['lastname'] as String,
      json['email'] as String,
      json['image'] as String?,
      json['isOnline'] as String?,
      json['friendShipId'] as String?,
      json['requestId'] as String?,
      json['createdAt'] as String?,
      json['isSent'] as bool,
    );

Map<String, dynamic> _$SearchFriendModelToJson(SearchFriendModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'email': instance.email,
      'image': instance.image,
      'isOnline': instance.isOnline,
      'friendShipId': instance.friendShipId,
      'requestId': instance.requestId,
      'createdAt': instance.createdAt,
      'isSent': instance.isSent,
    };
