import 'package:json_annotation/json_annotation.dart';
part 'send_message_response.g.dart';
@JsonSerializable()
class SendMessageResponse {
 final String? msg;
 final String? id;
 final String? createdAt;
 final int? statusCode;

  SendMessageResponse({this.msg, this.id, this.createdAt, this.statusCode});

  factory SendMessageResponse.fromJson(Map<String,dynamic> json)=>_$SendMessageResponseFromJson(json);
}