abstract class FriendListState {}

class Initial extends FriendListState {}

class Loading extends FriendListState {}

class Success extends FriendListState {}

class RealTime<T> extends FriendListState {
  final T data;

  RealTime(this.data);
}

class Error extends FriendListState {
  final String error;

  Error(this.error);
}
