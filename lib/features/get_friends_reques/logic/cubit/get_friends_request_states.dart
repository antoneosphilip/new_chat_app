abstract class GetFriendsRequestStates {}

class GetFriendsRequestInitialStates extends GetFriendsRequestStates {}

class GetFriendsRequestLoadingStates extends GetFriendsRequestStates {}

class GetFriendsRequestSuccessStates extends GetFriendsRequestStates {
  // final T data;
  //
  // GetFriendsRequestSuccessStates({required this.data});
}

class GetFriendsRequestErrorStates extends GetFriendsRequestStates {
  final String error;

  GetFriendsRequestErrorStates({required this.error});
}

/// Accept Request States
class AcceptFriendsRequestLoadingStates extends GetFriendsRequestStates {}

class AcceptFriendsRequestSuccessStates extends GetFriendsRequestStates {
  // final T data;
  //
  // GetFriendsRequestSuccessStates({required this.data});
}

class AcceptFriendsRequestErrorStates extends GetFriendsRequestStates {
  final String error;

  AcceptFriendsRequestErrorStates({required this.error});
}

/// reject Request States
class RejectFriendsRequestLoadingStates extends GetFriendsRequestStates {}

class RejectFriendsRequestSuccessStates extends GetFriendsRequestStates {
  // final T data;
  //
  // GetFriendsRequestSuccessStates({required this.data});
}

class RejectFriendsRequestErrorStates extends GetFriendsRequestStates {
  final String error;

  RejectFriendsRequestErrorStates({required this.error});
}