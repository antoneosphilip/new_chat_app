
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import '../../../../core/networking/api_networking.dart';
import '../model/friend_chat_model.dart';
part 'get_friends_api_service.g.dart'; // This should match your actual file name
@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class GetFriendsApiService {

 factory GetFriendsApiService(Dio dio,{String? baseUrl}) = _GetFriendsApiService;

 @GET(ApiConstants.getFriendsListModel)
 Future<FriendChatModel> getFriendsChatList();
}
