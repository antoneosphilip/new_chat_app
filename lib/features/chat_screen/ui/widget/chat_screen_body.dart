import 'package:christy/features/chat_screen/ui/widget/send_message_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../home/data/model/friend_chat_model.dart';
import '../../logic/cubit/chat_cubit.dart';
import '../../logic/cubit/chat_states.dart';

class ChatScreenBody extends StatefulWidget {
  final Friends friends;
  final FriendChatModel? friendChatModel;

  const ChatScreenBody({super.key, required this.friends, this.friendChatModel});

  @override
  State<ChatScreenBody> createState() => _ChatScreenBodyState();
}

class _ChatScreenBodyState extends State<ChatScreenBody> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChatCubit, ChatStates>(
      listener: (BuildContext context, ChatStates state) {
      },
      buildWhen: (previous, current) =>
          current is GetMessagesSuccessStates ||
          current is GetMessagesErrorStates ||
          current is GetMessagesLoadingStates,
      builder: (BuildContext context, state) {
        final cubit = ChatCubit.get(context);
        final scrollController = cubit.scrollController;

        if (state is GetMessagesLoadingStates) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is GetMessagesErrorStates) {
          return Center(child: Text(state.error));
        } else if (state is GetMessagesSuccessStates) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            scrollController.jumpTo(scrollController.position.maxScrollExtent);
          });

          return ListView.builder(
            // reverse: true,
            controller: scrollController,
            itemCount: cubit.getMessagesResponse!.length,
            itemBuilder: (context, index) {
              final message = cubit.getMessagesResponse![index];
              return Padding(
                padding: index == 0
                    ? EdgeInsets.symmetric(vertical: 30.h)
                    : EdgeInsets.only(bottom: 30.h),
                child: Column(
                  children: [
                    MessageItem(
                        message: message,
                        align: message.senderId != widget.friends.userId
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                      friends:widget.friends,
                    )
                  ],
                ),
              );
            },
          );
        } else {
          return Container();
        }
      },
    );
  }
}
