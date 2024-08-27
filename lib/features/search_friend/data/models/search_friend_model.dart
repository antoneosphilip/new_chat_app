import 'package:json_annotation/json_annotation.dart';

part 'search_friend_model.g.dart';

@JsonSerializable()
class SearchFriendModel {
   String id;
   String firstname;
   String lastname;
   String email;
   String? image;
   String? isOnline;
   String? friendShipId;
   String? requestId;
   String? createdAt;
   bool isSent;

  factory SearchFriendModel.fromJson(Map<String, dynamic> json) =>
      _$SearchFriendModelFromJson(json);

  SearchFriendModel(
      this.id,
      this.firstname,
      this.lastname,
      this.email,
      this.image,
      this.isOnline,
      this.friendShipId,
      this.requestId,
      this.createdAt,
      this.isSent);
}
