import 'package:christy/core/routing/routes.dart';
import 'package:christy/features/chat_screen/ui/chat_screen.dart';
import 'package:christy/features/home/logic/cubit/friend_list_cubit.dart';
import 'package:christy/features/home/ui/home_Screen.dart';
import 'package:christy/features/home_bottom_nav/ui/home_bottom_nav.dart';
import 'package:christy/features/login/ui/login_screen.dart';
import 'package:flutter/material.dart';

import '../../features/home/data/model/friend_chat_model.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    final arguments = settings.arguments as Map<String, dynamic>?;

    switch (settings.name) {
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      case Routes.homeBottomNav:
        return MaterialPageRoute(
          builder: (_) => HomeBottomNav(),
        );
      case Routes.chatScreen:
        if (arguments != null) {
          final friends = arguments['friends'] as Friends?;
          final friendChatModel = arguments['friendChatModel'] as FriendChatModel?;
          final friendListCubit = arguments['friendListCubit'] as FriendListCubit?;
          return MaterialPageRoute(
            builder: (_) => ChatScreen(
              friends: friends!,
              friendChatModel: friendChatModel!, friendListCubit: friendListCubit!,
            ),
          );
        }
        return null;

      default:
        return null;
    }
  }
}
