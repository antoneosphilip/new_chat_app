import 'dart:async';

import 'package:christy/features/search_friend/data/models/add_friend_body_model.dart';
import 'package:christy/features/search_friend/data/models/add_friend_response_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/search_friend_model.dart';
import '../../data/repo/search_friend_repo.dart';
import 'search_friend_states.dart';

class SearchFriendCubit extends Cubit<SearchFriendStates> {
  final SearchFriendRepo _searchFriendRepo;

  SearchFriendCubit(this._searchFriendRepo)
      : super(SearchFriendInitialStates());
  TextEditingController searchController = TextEditingController();
  List<SearchFriendModel>? searchFriendModel;
  Timer? _timer;
  AddFriendResponseModel? addFriendResponseModel;

  static SearchFriendCubit get(context) =>
      BlocProvider.of<SearchFriendCubit>(context);
  Map<String, bool> changeAddIcon = {};

//////////// Search For Friend
  Future<void> getFriendSearchList() async {
    emit(SearchFriendLoadingStates());
    final data =
        await _searchFriendRepo.searchFriend(searchKey: searchController.text);
    data.when(success: ((success) {
      searchFriendModel = success;
      for (var element in searchFriendModel!) {
          changeAddIcon[element.email] = element.isSent;
        }

      emit(SearchFriendSuccessStates(data: data));
    }), failure: ((error) {
      emit(SearchFriendErrorStates(error: error.apiErrorModel.title ?? ''));
    }));
  }

//////////// Listen TextEditing Controller
  void listenTextEditingController() {
    searchController.addListener(
      () {
        if (_timer?.isActive ?? false) {
          _timer?.cancel();
        }
        _timer = Timer(
          const Duration(milliseconds: 500),
          () {
            if (searchController.text.isNotEmpty) {
              getFriendSearchList();
            } else {
              searchFriendModel!.clear();
              emit(SearchFriendSuccessStates(data: ''));
            }
          },
        );
      },
    );
  }

  //////////// Add Friend
  Future<void> addFriend(
      {required AddFriendBodyModel addFriendBodyModel}) async {
    changeAddIcon[addFriendBodyModel.recieverEmail] =
        !changeAddIcon[addFriendBodyModel.recieverEmail]!;
    emit(SearchFriendSuccessStates(data: ''));
    final data = await _searchFriendRepo.addFriend(
        addFriendBodyModel: addFriendBodyModel);
    data.when(success: ((success) {
      addFriendResponseModel = success;
      emit(AddFriendSuccessStates());
    }), failure: ((error) {
      changeAddIcon[addFriendBodyModel.recieverEmail] =
          !changeAddIcon[addFriendBodyModel.recieverEmail]!;
      emit(AddFriendErrorStates(error: error.apiErrorModel.title ?? ''));
    }));
  }
}
