import 'package:json_annotation/json_annotation.dart';

part 'get_friend_request_response.g.dart';

@JsonSerializable()
class GetFriendsRequestResponse {
  final List<Requests> requests;

  GetFriendsRequestResponse({required this.requests});

  factory GetFriendsRequestResponse.fromJson(Map<String, dynamic> json) => _$GetFriendsRequestResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetFriendsRequestResponseToJson(this);
}

@JsonSerializable()
class Requests {
  final int? id;
  final String? userId;
  final bool? outGoing;
  final String? image;
  final String? email;
  final String? firstname;
  final String? lastname;
  final String? createdAt;
  final bool? isSent;

  Requests({
    this.id,
    this.userId,
    this.outGoing,
    this.image,
    this.email,
    this.firstname,
    this.lastname,
    this.createdAt,
    this.isSent,
  });

  factory Requests.fromJson(Map<String, dynamic> json) => _$RequestsFromJson(json);

  Map<String, dynamic> toJson() => _$RequestsToJson(this);
}
