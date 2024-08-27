// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accept_friend_requests_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AcceptFriendRequests _$AcceptFriendRequestsFromJson(
        Map<String, dynamic> json) =>
    AcceptFriendRequests(
      id: json['id'] as String?,
      firstname: json['firstname'] as String?,
      lastname: json['lastname'] as String?,
      email: json['email'] as String?,
      image: json['image'] as String?,
      isOnline: json['isOnline'] as bool?,
      friendShipId: json['friendShipId'] as String?,
      requestId: json['requestId'] as String?,
      createdAt: json['createdAt'] as String?,
      isSent: json['isSent'] as bool?,
    );

Map<String, dynamic> _$AcceptFriendRequestsToJson(
        AcceptFriendRequests instance) =>
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
