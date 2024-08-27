import 'package:christy/core/networking/api_error_handler.dart';
import 'package:christy/core/networking/api_result.dart';
import 'package:christy/features/search_friend/data/models/add_friend_body_model.dart';
import 'package:christy/features/search_friend/data/models/add_friend_response_model.dart';

import '../api_Service/search_friend_api_service.dart';
import '../models/search_friend_model.dart';

class SearchFriendRepo {
  SearchFriendApiService searchFriendApiService;

  SearchFriendRepo(this.searchFriendApiService);

//Search Friend
  Future<ApiResult<List<SearchFriendModel>>> searchFriend(
      {required String searchKey}) async {
    try {
      final response = await searchFriendApiService.searchFriend(searchKey);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  // Add Friend
  Future<ApiResult<AddFriendResponseModel>> addFriend({required AddFriendBodyModel addFriendBodyModel}) async {
    try {
      final response = await searchFriendApiService.addFriend(addFriendBodyModel);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
