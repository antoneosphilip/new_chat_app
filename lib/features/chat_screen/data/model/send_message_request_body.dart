import 'package:json_annotation/json_annotation.dart';
part 'send_message_request_body.g.dart';
@JsonSerializable()
class SendMessageRequestBody {
 final int friendShipId;
 final String message;

  SendMessageRequestBody({required this.friendShipId, required this.message});

 Map<String, dynamic> toJson() => _$SendMessageRequestBodyToJson(this);
}