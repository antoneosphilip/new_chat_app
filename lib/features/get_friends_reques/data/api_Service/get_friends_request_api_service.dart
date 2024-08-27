// Import necessary packages
import 'package:christy/core/networking/api_networking.dart';
import 'package:christy/features/get_friends_reques/data/models/friend_request_body.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

import '../models/accept_friend_requests_response.dart';
import '../models/get_friend_request_response.dart';

// Define part directive
part 'get_friends_request_api_service.g.dart';

// Define API Service interface
@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class GetFriendsRequestApiService {
  factory GetFriendsRequestApiService(Dio dio, {String? baseUrl}) =
      _GetFriendsRequestApiService;

  @GET(ApiConstants.getFriendsRequest)
  Future<GetFriendsRequestResponse> getFriendsRequest();

  @POST(ApiConstants.acceptFriendsRequest)
  Future<AcceptFriendRequests> acceptFriendsRequest(@Body() FriendRequestBody acceptFriendRequestsBody);


  @POST(ApiConstants.rejectedFriendsRequest)
  Future<String> rejectedFriendsRequest(@Body() FriendRequestBody rejectedFriendRequestsBody);
}
