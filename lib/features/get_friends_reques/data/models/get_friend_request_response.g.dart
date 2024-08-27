// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_friend_request_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetFriendsRequestResponse _$GetFriendsRequestResponseFromJson(
        Map<String, dynamic> json) =>
    GetFriendsRequestResponse(
      requests: (json['requests'] as List<dynamic>)
          .map((e) => Requests.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetFriendsRequestResponseToJson(
        GetFriendsRequestResponse instance) =>
    <String, dynamic>{
      'requests': instance.requests,
    };

Requests _$RequestsFromJson(Map<String, dynamic> json) => Requests(
      id: (json['id'] as num?)?.toInt(),
      userId: json['userId'] as String?,
      outGoing: json['outGoing'] as bool?,
      image: json['image'] as String?,
      email: json['email'] as String?,
      firstname: json['firstname'] as String?,
      lastname: json['lastname'] as String?,
      createdAt: json['createdAt'] as String?,
      isSent: json['isSent'] as bool?,
    );

Map<String, dynamic> _$RequestsToJson(Requests instance) => <String, dynamic>{
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
