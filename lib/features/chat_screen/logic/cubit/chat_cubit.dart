import 'dart:async';
import 'package:christy/features/chat_screen/data/model/get_messages.dart';
import 'package:christy/features/chat_screen/data/model/send_message_request_body.dart';
import 'package:christy/features/chat_screen/logic/cubit/chat_states.dart';
import 'package:christy/features/home/data/api_service/singlar_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repo/send_message_repo.dart';

class ChatCubit extends Cubit<ChatStates> {
  final ChatRepo chatRepo;
  final ScrollController scrollController = ScrollController();
  final TextEditingController messageController = TextEditingController();
  final StreamController<Map<String, dynamic>> _friendChatController = StreamController<Map<String, dynamic>>.broadcast();

  List<GetMessageResponse>? getMessagesResponse;
  StreamSubscription<Map<String, dynamic>>? _subscription;
  Map<int, bool> checkSendMessage = {};
  bool isSent = false;
  bool emojiShowing = false;

  ChatCubit(this.chatRepo) : super(ChatInitialStates());

  static ChatCubit get(BuildContext context) => BlocProvider.of<ChatCubit>(context);

  Future<void> sendMessage({
    required GetMessageResponse getMessageResponse,
    required int friendShipId,
  }) async {
    checkSendMessage[getMessageResponse.id!] = false;
    getMessagesResponse?.add(getMessageResponse);
    emit(GetMessagesSuccessStates());

    final data = await chatRepo.sendMessage(
      sendMessageRequestBody: SendMessageRequestBody(
        friendShipId: friendShipId,
        message: messageController.text,
      ),
    );

    data.when(
      success: (value) {
        checkSendMessage[getMessageResponse.id!] = true;
        emit(SendMessagesSuccessStates());
      },
      failure: (error) => emit(SendMessagesErrorStates()),
    );
  }

  Future<void> getMessages({required  chatId}) async {
    emit(GetMessagesLoadingStates());
    final data = await chatRepo.getMessage(chatId: chatId);
    data.when(
      success: (value) async {
        await _listenToData();
        getMessagesResponse = value;
        for (var item in getMessagesResponse!) {
          checkSendMessage[item.id!] = true;
        }
        emit(GetMessagesSuccessStates());
      },
      failure: (error) => emit(GetMessagesErrorStates(error: error.apiErrorModel.title ?? '')),
    );
  }

  Future<void> _listenToData() async {
    await SignalRService.connection(
      channelName: 'RecieveMessage',
      friendChatController: _friendChatController,
    );
    _subscription = _friendChatController.stream.listen((getMessageResponse) {
      final getMessage = GetMessageResponse.fromJson(getMessageResponse);
      getMessagesResponse?.add(getMessage);
      emit(GetMessagesSuccessStates());
    });
  }

  void changeEmojiState() {
    emojiShowing = !emojiShowing;
    emit(ChangeEmojiState());
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    _friendChatController.close();
    messageController.dispose();
    scrollController.dispose();
    return super.close();
  }
}
