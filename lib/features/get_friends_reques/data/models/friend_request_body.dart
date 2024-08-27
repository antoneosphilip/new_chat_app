import 'package:json_annotation/json_annotation.dart';
part 'friend_request_body.g.dart';
@JsonSerializable()
class FriendRequestBody {
  final int requestId;

  FriendRequestBody({required this.requestId});

  Map<String, dynamic> toJson() => _$FriendRequestBodyToJson(this);

}