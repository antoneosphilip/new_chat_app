abstract class SearchFriendStates {}

class SearchFriendInitialStates extends SearchFriendStates {}

class SearchFriendLoadingStates extends SearchFriendStates {}

class SearchFriendSuccessStates<T> extends SearchFriendStates {
  final T data;

  SearchFriendSuccessStates({required this.data});
}

class SearchFriendErrorStates extends SearchFriendStates {
  final String error;

  SearchFriendErrorStates({required this.error});
}

/// Add Friend States

class AddFriendSuccessStates extends SearchFriendStates {}

class AddFriendErrorStates extends SearchFriendStates {
  final String error;

  AddFriendErrorStates({required this.error});
}