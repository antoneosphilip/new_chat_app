import 'package:json_annotation/json_annotation.dart';

part 'accept_friend_requests_response.g.dart';

@JsonSerializable()
class AcceptFriendRequests {
  String? id;
  String? firstname;
  String? lastname;
  String? email;
  String? image;
  bool? isOnline;
  String? friendShipId;
  String? requestId;
  String? createdAt;
  bool? isSent;

  AcceptFriendRequests(
      {this.id,
      this.firstname,
      this.lastname,
      this.email,
      this.image,
      this.isOnline,
      this.friendShipId,
      this.requestId,
      this.createdAt,
      this.isSent});

  factory AcceptFriendRequests.fromJson(Map<String, dynamic> json) =>
      _$AcceptFriendRequestsFromJson(json);

}
