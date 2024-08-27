import 'package:json_annotation/json_annotation.dart';
part 'add_friend_body_model.g.dart';
@JsonSerializable()
class AddFriendBodyModel
{
  final String recieverEmail;

  AddFriendBodyModel({required this.recieverEmail});

  Map<String,dynamic> toJson() =>_$AddFriendBodyModelToJson(this);
}