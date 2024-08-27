import 'package:json_annotation/json_annotation.dart';
part 'add_friend_response_model.g.dart';
@JsonSerializable()
class AddFriendResponseModel {
  final int id;
  final String userId;
  final bool outGoing;
  final String? image;
  final String email;
  final String firstname;
  final String lastname;
  final String createdAt;
  final bool isSent;

  AddFriendResponseModel(this.id, this.userId, this.outGoing, this.image, this.email, this.firstname, this.lastname, this.createdAt, this.isSent);

  factory AddFriendResponseModel.fromJson(Map<String,dynamic> json)=>_$AddFriendResponseModelFromJson(json);
}
