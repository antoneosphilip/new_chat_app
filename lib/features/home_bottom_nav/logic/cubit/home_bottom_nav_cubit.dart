import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:christy/features/home/ui/home_screen.dart';
import 'package:christy/features/search_friend/ui/search_friend.dart';

abstract class BottomNavState {}

class BottomNavInitial extends BottomNavState {}

class BottomNavChanged extends BottomNavState {}

class BottomNavVisibilityChanged extends BottomNavState {
  final bool isVisible;

  BottomNavVisibilityChanged(this.isVisible);
}

class BottomNavCubit extends Cubit<BottomNavState> {
  BottomNavCubit() : super(BottomNavInitial());

  static BottomNavCubit get(context) => BlocProvider.of<BottomNavCubit>(context);

  List<Widget> screens = const [
    HomeScreen(),
    AddFriendScreen(),
    AddFriendScreen(),
  ];

  int selectedIndex = 0;

  void changeIndex(int index) {
    selectedIndex = index;
    emit(BottomNavChanged());
  }

  void setScreenVisibility(bool isVisible) {
    emit(BottomNavVisibilityChanged(isVisible));
  }
}
