// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'friend_chat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FriendChatModel _$FriendChatModelFromJson(Map<String, dynamic> json) =>
    FriendChatModel(
      id: json['id'] as String?,
      email: json['email'] as String?,
      firstname: json['firstname'] as String?,
      lastname: json['lastname'] as String?,
      createdAt: json['createdAt'] as String?,
      image: json['image'],
      requests: (json['requests'] as List<dynamic>)
          .map((e) => Requests.fromJson(e as Map<String, dynamic>))
          .toList(),
      friends: (json['friends'] as List<dynamic>?)
          ?.map((e) => Friends.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FriendChatModelToJson(FriendChatModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'createdAt': instance.createdAt,
      'image': instance.image,
      'requests': instance.requests,
      'friends': instance.friends,
    };

Requests _$RequestsFromJson(Map<String, dynamic> json) => Requests(
      id: (json['id'] as num?)?.toInt(),
      userId: json['userId'] as String?,
      outGoing: json['outGoing'] as bool?,
      image: json['image'],
      email: json['email'] as String?,
      firstname: json['firstname'] as String?,
      lastname: json['lastname'] as String?,
      createdAt: json['createdAt'] as String?,
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
    };

Friends _$FriendsFromJson(Map<String, dynamic> json) => Friends(
      friendShipId: json['friendShipId'] as String?,
      userId: json['userId'] as String?,
      email: json['email'] as String?,
      firstname: json['firstname'] as String?,
      lastname: json['lastname'] as String?,
      image: json['image'] as String?,
      isOnline: json['isOnline'] as bool?,
      createdAt: json['createdAt'] as String?,
      latestMessage: json['latestMessage'] == null
          ? null
          : LatestMessage.fromJson(
              json['latestMessage'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FriendsToJson(Friends instance) => <String, dynamic>{
      'friendShipId': instance.friendShipId,
      'userId': instance.userId,
      'email': instance.email,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'image': instance.image,
      'isOnline': instance.isOnline,
      'createdAt': instance.createdAt,
      'latestMessage': instance.latestMessage,
    };

LatestMessage _$LatestMessageFromJson(Map<String, dynamic> json) =>
    LatestMessage(
      id: json['id'],
      text: json['text'] as String?,
      senderId: json['senderId'],
      isSent: json['isSent'],
      createdAt: json['createdAt'],
    );

Map<String, dynamic> _$LatestMessageToJson(LatestMessage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'senderId': instance.senderId,
      'isSent': instance.isSent,
      'createdAt': instance.createdAt,
    };
