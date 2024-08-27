import 'package:christy/core/networking/api_error_handler.dart';
import 'package:christy/core/networking/api_result.dart';
import 'package:christy/features/get_friends_reques/data/models/friend_request_body.dart';
import 'package:christy/features/get_friends_reques/data/models/accept_friend_requests_response.dart';
import 'package:christy/features/get_friends_reques/data/models/get_friend_request_response.dart';

import '../api_Service/get_friends_request_api_service.dart';

class GetFriendsRequestRepo {
  final GetFriendsRequestApiService getFriendsRequestApiService;

  GetFriendsRequestRepo(this.getFriendsRequestApiService);

  Future<ApiResult<GetFriendsRequestResponse>> getFriendsRequest() async {
    try {
      final data = await getFriendsRequestApiService.getFriendsRequest();
      return ApiResult.success(data);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }


  Future<ApiResult<AcceptFriendRequests>> acceptFriendsRequest({required FriendRequestBody acceptFriendRequestsBody}) async {
    try {
      final data = await getFriendsRequestApiService.acceptFriendsRequest(acceptFriendRequestsBody);
      return ApiResult.success(data);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }


  Future<String> rejectFriendsRequest({required FriendRequestBody rejectFriendRequestsBody}) async {
    try {
      final data = await getFriendsRequestApiService.rejectedFriendsRequest(rejectFriendRequestsBody);
      return data;
    } catch (error) {
      return error.toString();
    }
  }
}
