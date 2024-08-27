import 'package:christy/features/chat_screen/data/model/get_messages.dart';
import 'package:christy/features/chat_screen/data/model/send_message_request_body.dart';
import 'package:christy/features/chat_screen/data/model/send_message_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../../../../core/networking/api_networking.dart';

part 'chat_api_service.g.dart'; // This should match your actual file name

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ChatApiService {
  factory ChatApiService(Dio dio, {String? baseUrl}) = _ChatApiService;

//// send message
  @POST(ApiConstants.sendMessage)
  Future<SendMessageResponse> sendMessage(
      @Body() SendMessageRequestBody sendMessageRequestBody);

  //// get message
  @GET(ApiConstants.getMessagePath)
  Future<List<GetMessageResponse>> getMessage(@Path('number') String number,
      @Query('take') int takeNumber, @Query('skip') int skipNumber);
}
