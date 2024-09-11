import 'package:christy/core/di/dependency_injection.dart';
import 'package:christy/features/chat_screen/logic/cubit/chat_cubit.dart';
import 'package:christy/features/chat_screen/ui/widget/chat_screen_app_bar.dart';
import 'package:christy/features/chat_screen/ui/widget/chat_screen_body.dart';
import 'package:christy/features/chat_screen/ui/widget/send_message_container.dart';
import 'package:christy/features/home/logic/cubit/friend_list_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../home/data/model/friend_chat_model.dart';

class ChatScreen extends StatelessWidget {
  final Friends? friends;
  final FriendChatModel? friendChatModel;
  final FriendListCubit friendListCubit;

  const ChatScreen(
      {super.key,
      required this.friends,
      required this.friendChatModel,
      required this.friendListCubit});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ChatCubit(getIt())
        ..getMessages(
            chatId: friends!.friendShipId,
            ),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: ChatScreenAppBar(
          friendListCubit: friendListCubit,
          friends: friends!,
        ),
        body: Column(
          children: [
            Expanded(
                child: ChatScreenBody(
              friends: friends!,
              friendChatModel: friendChatModel!,
            )),
            SendMessageContainer(
              friends: friends!,
              friendChatModel: friendChatModel!,
              friendListCubit: friendListCubit,
            ),
          ],
        ),
      ),
    );
  }
}
