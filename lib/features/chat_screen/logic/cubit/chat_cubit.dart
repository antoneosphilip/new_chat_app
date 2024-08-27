import 'dart:async';

import 'package:christy/features/chat_screen/data/model/get_messages.dart';
import 'package:christy/features/chat_screen/data/model/send_message_request_body.dart';
import 'package:christy/features/chat_screen/logic/cubit/chat_states.dart';
import 'package:christy/features/home/data/api_service/singlar_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repo/send_message_repo.dart';

class ChatCubit extends Cubit<ChatStates> {
  final ChatRepo chatRepo;

  ChatCubit(this.chatRepo) : super(ChatInitialStates());
  final ScrollController scrollController = ScrollController();

  List<GetMessageResponse>? getMessagesResponse;
  TextEditingController messageController = TextEditingController();
  StreamSubscription<Map<String, dynamic>>? _subscription;
  final StreamController<Map<String, dynamic>> _friendChatController = StreamController<Map<String, dynamic>>.broadcast();


  static ChatCubit get(context) => BlocProvider.of<ChatCubit>(context);

  bool isSent=false;
Map<int,bool> checkSendMessage={};


  void sendMessage(
      {required GetMessageResponse getMessageResponse,
      required int friendShipId}) async {
    checkSendMessage[getMessageResponse.id!]=false;

    getMessagesResponse!.add(getMessageResponse);
    emit(GetMessagesSuccessStates());

    final data = await chatRepo.sendMessage(
        sendMessageRequestBody: SendMessageRequestBody(
            friendShipId: friendShipId, message: messageController.text));
    data.when(success: (value) {
      checkSendMessage[getMessageResponse.id!]=true;
      emit(SendMessagesSuccessStates());
    }, failure: (error) {

      emit(SendMessagesErrorStates());
    });
  }

  void getMessages({required chatId,required  StreamController<Map<String, dynamic>>?  friendChatStream}) async {
      emit(GetMessagesLoadingStates());
      final data = await chatRepo.getMessage(chatId: chatId);
      data.when(success: (value) {
        listenToData(friendChatStream: friendChatStream);

        getMessagesResponse = value;
        for(var item in getMessagesResponse!)
        {
          checkSendMessage[item.id!]=true;
        }
        emit(GetMessagesSuccessStates());
      }, failure: (error) {
        emit(GetMessagesErrorStates(error: error.apiErrorModel.title ?? ''));
      });

  }

  Future<void> listenToData({required  StreamController<Map<String, dynamic>>?  friendChatStream
  }) async {
    await SignalRService.connection(
      channelName: 'RecieveMessage',
      friendChatController: _friendChatController,
    );
    _subscription= _friendChatController.stream.listen(
      (getMessageResponse) {
        final getMessage = GetMessageResponse.fromJson(getMessageResponse);
        getMessagesResponse?.add(getMessage);
        emit(GetMessagesSuccessStates());
      },
    );
  }
  bool emojiShowing=false;

  void changeEmojiState()
  {
    emojiShowing = !emojiShowing;
    emit(ChangeEmojiState());
  }


  @override
  Future<void> close() {
    _subscription?.cancel();
    messageController.dispose();
    return super.close();
  }
}
