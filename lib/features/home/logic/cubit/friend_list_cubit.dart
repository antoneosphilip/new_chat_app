import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/api_service/singlar_service.dart';
import '../../data/model/friend_chat_model.dart';
import '../../data/repo/all_friends_repo.dart';
import 'friend_list_states.dart';

class FriendListCubit extends Cubit<FriendListState> {
  final FriendListRepo _friendListRepo;

  final StreamController<Map<String, dynamic>> friendChatController =
  StreamController<Map<String, dynamic>>.broadcast();
  final StreamController<String> _onlineChatController =
  StreamController<String>.broadcast();
  final StreamController<String> _offlineChatController =
  StreamController<String>.broadcast();

  StreamSubscription<Map<String, dynamic>>? _friendChatSubscription;
  StreamSubscription<String>? _onlineChatSubscription;
  StreamSubscription<String>? _offlineChatSubscription;

  FriendChatModel? friendChatModel;

  FriendListCubit(this._friendListRepo) : super(Initial()) {
    fetchInitialData();
  }

  static FriendListCubit get(context) => BlocProvider.of<FriendListCubit>(context);

  void fetchInitialData() async {
    emit(Loading());

    final data = await _friendListRepo.getFriendsChatList();
    data.when(
      success: (data) async {
        friendChatModel = data;
        await _listenToData();
        await _listenToOnline();
        await _listenToOffline();
        emit(Success());
      },
      failure: (error) => emit(Error(error.apiErrorModel.title ?? '')),
    );
  }

  Future<void> _listenToData() async {
    await SignalRService.connection(
      channelName: 'RecieveMessage',
      friendChatController: friendChatController,
    );
    _friendChatSubscription = friendChatController.stream.listen(_onNewMessageReceived);
  }

  Future<void> _listenToOnline() async {
    await SignalRService.connection(
      channelName: 'hoppedOnline',
      friendChatController: _onlineChatController,
    );
    _onlineChatSubscription = _onlineChatController.stream.listen(_onUserOnline);
  }

  Future<void> _listenToOffline() async {
    await SignalRService.connection(
      channelName: 'wentOffline',
      friendChatController: _offlineChatController,
    );
    _offlineChatSubscription = _offlineChatController.stream.listen(_onUserOffline);
  }

  void _onNewMessageReceived(Map<String, dynamic> data) {
    final latestMessage = LatestMessage.fromJson(data);
    final friend = friendChatModel?.friends?.firstWhere((e) => e.userId == latestMessage.senderId);
    if (friend != null) {
      friend.latestMessage = latestMessage;
      emit(Success());
    }
  }

  void _onUserOnline(String userId) => _updateUserOnlineStatus(userId, true);

  void _onUserOffline(String userId) => _updateUserOnlineStatus(userId, false);

  void _updateUserOnlineStatus(String userId, bool isOnline) {
    friendChatModel?.friends?.forEach((friend) {
      if (friend.userId == userId) {
        friend.isOnline = isOnline;
        emit(Success());
      }
    });
  }

  void updateLastMessage(String text, Friends friend,  id) {
    friend.latestMessage ??= LatestMessage(
      senderId: id,
      createdAt: DateTime.now().toString(),
      id: 1,
    );
    friend.latestMessage!.text = text;
    print("Updated Message: ${friend.latestMessage!.text}");
    emit(Success());
  }

  @override
  Future<void> close() {
    _friendChatSubscription?.cancel();
    _onlineChatSubscription?.cancel();
    _offlineChatSubscription?.cancel();
    friendChatController.close();
    _onlineChatController.close();
    _offlineChatController.close();
    return super.close();
  }
}
