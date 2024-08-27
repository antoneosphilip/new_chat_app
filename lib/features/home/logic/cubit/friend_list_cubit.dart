import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/api_service/singlar_service.dart';
import '../../data/model/friend_chat_model.dart';
import '../../data/repo/all_friends_repo.dart';
import 'friend_list_states.dart';

class FriendListCubit extends Cubit<FriendListState> {
  final FriendListRepo _friendListRepo;
  final StreamController<Map<String, dynamic>> friendChatController = StreamController<Map<String, dynamic>>.broadcast();
  StreamSubscription<Map<String, dynamic>>? _subscription;
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
        await listenToData();
        emit(Success());
      },
      failure: (error) {
        emit(Error(error.apiErrorModel.title ?? ''));
      },
    );
  }

  Future<void> listenToData() async {
    // Pass the StreamController to the SignalRService
    await SignalRService.connection(
      channelName: 'RecieveMessage',
      friendChatController: friendChatController,
    );

    _subscription = friendChatController.stream.listen(
          (friendChat) {
        final latestMessage = LatestMessage.fromJson(friendChat);
        final friends = friendChatModel?.friends ?? [];

        // Find the friend and update their latest message
        final friend = friends.firstWhere(
              (e) => e.userId == latestMessage.senderId,
        );
        friend.latestMessage = latestMessage; // Update or add the latest message

        emit(Success());
      },
    );
  }

  void updateLastMessage(String text, Friends friends,  id) {
    if (friends.latestMessage != null) {
      friends.latestMessage?.text = text;
    } else {
      LatestMessage newLatestMessage = LatestMessage(
        isSent: null,
        senderId: id,
        createdAt: DateTime.now().toString(),
        id: 1,
        text: text,
      );
      friends.latestMessage = newLatestMessage;
    }
    print("Updated Message: ${friends.latestMessage!.text}");
    emit(Success());
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    friendChatController.close();
    return super.close();
  }
}
