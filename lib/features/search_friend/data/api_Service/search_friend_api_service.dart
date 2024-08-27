import 'package:christy/core/networking/api_networking.dart';
import 'package:christy/features/search_friend/data/models/add_friend_body_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../models/add_friend_response_model.dart';
import '../models/search_friend_model.dart';

part 'search_friend_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class SearchFriendApiService {
  factory SearchFriendApiService(Dio dio, {String? baseUrl}) =
      _SearchFriendApiService;

// Add Friend
  @POST(ApiConstants.addFriend)
  Future<AddFriendResponseModel> addFriend(
  @Body()  AddFriendBodyModel addFriendBodyModel,
  );

  //
  @GET(ApiConstants.searchFriend)
  Future<List<SearchFriendModel>> searchFriend(
      @Query('search') String searchKey);
}
