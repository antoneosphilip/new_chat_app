import 'package:json_annotation/json_annotation.dart';

part 'friend_chat_model.g.dart'; // Ensure this matches your actual file name

// Annotation to generate serialization code
@JsonSerializable()
class FriendChatModel {
  final String? id;
  final String? email;
  final String? firstname;
  final String? lastname;
  final String? createdAt;
  final dynamic image;
  final List<Requests> requests;
  final List<Friends>? friends;

  FriendChatModel({
    this.id,
    this.email,
    this.firstname,
    this.lastname,
    this.createdAt,
    this.image,
    required this.requests, // Ensure requests is non-nullable
    this.friends,
  });

  factory FriendChatModel.fromJson(Map<String, dynamic> json) => _$FriendChatModelFromJson(json);
  Map<String, dynamic> toJson() => _$FriendChatModelToJson(this); // Convert to JSON
}

// Annotation to generate serialization code
@JsonSerializable()
class Requests {
  int? id;
  String? userId;
  bool? outGoing;
  dynamic image;
  String? email;
  String? firstname;
  String? lastname;
  String? createdAt;

  Requests({
    this.id,
    this.userId,
    this.outGoing,
    this.image,
    this.email,
    this.firstname,
    this.lastname,
    this.createdAt,
  });

  factory Requests.fromJson(Map<String, dynamic> json) => _$RequestsFromJson(json);
  Map<String, dynamic> toJson() => _$RequestsToJson(this); // Convert to JSON
}

// Annotation to generate serialization code
@JsonSerializable()
class Friends {
  String? friendShipId;
  String? userId;
  String? email;
  String? firstname;
  String? lastname;
  String? image;
  bool? isOnline;
  String? createdAt;
  LatestMessage? latestMessage;

  Friends({
    this.friendShipId,
    this.userId,
    this.email,
    this.firstname,
    this.lastname,
    this.image,
    this.isOnline,
    this.createdAt,
    this.latestMessage,
  });

  factory Friends.fromJson(Map<String, dynamic> json) => _$FriendsFromJson(json);
  Map<String, dynamic> toJson() => _$FriendsToJson(this); // Convert to JSON
}

// Annotation to generate serialization code
@JsonSerializable()
class LatestMessage {
  dynamic id;
  String? text;
  dynamic senderId;
  dynamic isSent;
  dynamic createdAt;

  LatestMessage({
    this.id,
    this.text,
    this.senderId,
    this.isSent,
    this.createdAt,
  });

  factory LatestMessage.fromJson(Map<String, dynamic> json) => _$LatestMessageFromJson(json);
  Map<String, dynamic> toJson() => _$LatestMessageToJson(this); // Convert to JSON
}
