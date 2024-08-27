import 'package:json_annotation/json_annotation.dart';

part 'get_messages.g.dart';

@JsonSerializable()
class GetMessageResponse {
  dynamic id;
  String? text;
  String? senderId;
  bool? isSent;
  String? createdAt;

  GetMessageResponse(
      {this.id, this.text, this.senderId, this.isSent, this.createdAt});

  factory GetMessageResponse.fromJson(Map<String, dynamic> json) =>
      _$GetMessageResponseFromJson(json);
}
