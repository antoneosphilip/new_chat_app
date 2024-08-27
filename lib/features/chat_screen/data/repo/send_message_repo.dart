import 'package:christy/core/networking/api_error_handler.dart';
import 'package:christy/features/chat_screen/data/model/get_messages.dart';
import 'package:christy/features/chat_screen/data/model/send_message_request_body.dart';
import 'package:christy/features/chat_screen/data/model/send_message_response.dart';

import '../../../../core/networking/api_result.dart';
import '../../../home/data/api_service/singlar_service.dart';
import '../api_service/chat_api_service.dart';

class ChatRepo {
  ChatApiService chatApiService;

  ChatRepo(this.chatApiService);

  Future<ApiResult<SendMessageResponse>> sendMessage(
      {required SendMessageRequestBody sendMessageRequestBody}) async {
    try {
      final data = await chatApiService.sendMessage(sendMessageRequestBody);
      return ApiResult.success(data);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<List<GetMessageResponse>>> getMessage(
      {required String chatId}) async {
    try {
      final data = await chatApiService.getMessage(chatId, 15, 0);
      return ApiResult.success(data);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }



}
