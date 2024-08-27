import 'dart:async';

import 'package:christy/features/get_friends_reques/data/models/friend_request_body.dart';
import 'package:christy/features/get_friends_reques/data/models/get_friend_request_response.dart';
import 'package:christy/features/get_friends_reques/data/repo/get_friends_request_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../home/data/api_service/singlar_service.dart';
import 'get_friends_request_states.dart';

class GetFriendsRequestCubit extends Cubit<GetFriendsRequestStates> {
  final GetFriendsRequestRepo _getFriendsRequestRepo;

  GetFriendsRequestCubit(this._getFriendsRequestRepo)
      : super(GetFriendsRequestInitialStates());
  TextEditingController searchController = TextEditingController();
  GetFriendsRequestResponse? getFriendsRequestResponse;
  StreamSubscription<Map<String, dynamic>>? _subscription;

  // Stream<Map<String, dynamic>>? get friendChatStream =>
  //     SignalRService.friendChatStream;
  final StreamController<Map<String, dynamic>> _friendRequestController =
      StreamController<Map<String, dynamic>>.broadcast();

  static GetFriendsRequestCubit get(context) =>
      BlocProvider.of<GetFriendsRequestCubit>(context);

  void getFriendsRequest() async {
    emit(GetFriendsRequestLoadingStates());
    final data = await _getFriendsRequestRepo.getFriendsRequest();
    data.when(success: ((value) {
      getFriendsRequestResponse = value;
      listenToData();
      emit(GetFriendsRequestSuccessStates());
    }), failure: (error) {
      emit(GetFriendsRequestErrorStates(error: error.apiErrorModel.title!));
    });
  }

  void acceptFriendsRequest(
      {required FriendRequestBody acceptFriendRequestsBody}) async {
    emit(AcceptFriendsRequestLoadingStates());
    final data = await _getFriendsRequestRepo.acceptFriendsRequest(
        acceptFriendRequestsBody: acceptFriendRequestsBody);
    data.when(success: ((value) {
      getFriendsRequestResponse?.requests
          .removeWhere((element) => element.id == int.parse(value.requestId!));
      emit(AcceptFriendsRequestSuccessStates());
    }), failure: (error) {
      emit(AcceptFriendsRequestErrorStates(error: error.apiErrorModel.title!));
    });
  }

  void rejectFriendsRequest(
      {required FriendRequestBody rejectFriendRequestsBody}) async {
    emit(RejectFriendsRequestLoadingStates());
    try {
      final data = await _getFriendsRequestRepo.rejectFriendsRequest(
          rejectFriendRequestsBody: rejectFriendRequestsBody);
      getFriendsRequestResponse?.requests.removeWhere(
          (element) => element.id == rejectFriendRequestsBody.requestId);
      emit(RejectFriendsRequestSuccessStates());
    } catch (error) {
      emit(RejectFriendsRequestErrorStates(error: error.toString()));
    }
  }

  Future<void> listenToData() async {
    await SignalRService.connection(
        channelName: 'SentRequest',
        friendChatController: _friendRequestController);
    _subscription = _friendRequestController.stream.listen(
      (getRequestResponse) {
        final getMessage = Requests.fromJson(getRequestResponse);
        getFriendsRequestResponse?.requests.add(getMessage);
        emit(GetFriendsRequestSuccessStates());
      },
    );
  }
}
