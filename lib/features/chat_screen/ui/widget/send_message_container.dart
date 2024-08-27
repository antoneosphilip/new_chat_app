import 'package:christy/features/chat_screen/data/model/get_messages.dart';
import 'package:christy/features/chat_screen/logic/cubit/chat_cubit.dart';
import 'package:christy/features/chat_screen/ui/widget/send_message_text_form.dart';
import 'package:christy/features/home/logic/cubit/friend_list_cubit.dart';
import 'package:christy/features/home/logic/cubit/friend_list_states.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/colors.dart';
import '../../../home/data/model/friend_chat_model.dart';

class SendMessageContainer extends StatefulWidget {
  final FriendChatModel friendChatModel;
  final Friends friends;
  final FriendListCubit friendListCubit;

  const SendMessageContainer({
    super.key,
    required this.friendChatModel,
    required this.friends,
    required this.friendListCubit,
  });

  @override
  State<SendMessageContainer> createState() => _SendMessageContainerState();
}

class _SendMessageContainerState extends State<SendMessageContainer> {
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  bool _emojiShowing = false;
  int i = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: widget.friendListCubit,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 70.h,
            decoration: BoxDecoration(
              color: ColorsManager.secondWhite,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24.r),
                topRight: Radius.circular(24.r),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.10),
                  offset: const Offset(0, 4),
                  blurRadius: 4,
                  spreadRadius: 10,
                ),
              ],
            ),
            child: Row(
              children: [
                const SendMessageTextForm(),
                BlocBuilder<FriendListCubit, FriendListState>(
                  builder: (BuildContext context, state) {
                    return Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            sendMessage(context: context);
                          },
                          icon: Icon(
                            Icons.send,
                            color: ColorsManager.mainBurble,
                            size: 30.sp,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              _emojiShowing = !_emojiShowing;
                            });
                          },
                          icon: const Icon(Icons.emoji_emotions_outlined),
                        ),
                      ],
                    );
                  },
                ),
                SizedBox(width: 20.w),
              ],
            ),
          ),
          Offstage(
            offstage: !_emojiShowing,
            child: SizedBox(
              height: 300.h, // Set the height to match the config
              child: EmojiPicker(
                textEditingController: ChatCubit.get(context).messageController,
                scrollController: _scrollController,
                config: const Config(
                  height: 330,
                  checkPlatformCompatibility: true,
                  emojiViewConfig: EmojiViewConfig(
                    columns: 7,
                    // Reduce number of columns for better performance
                    emojiSizeMax: 24,
                    // Adjust size for better performance
                    verticalSpacing: 0,
                    horizontalSpacing: 0,
                    gridPadding: EdgeInsets.zero,
                    buttonMode: ButtonMode.MATERIAL,
                    loadingIndicator: SizedBox.shrink(),
                    recentsLimit: 40,
                  ),
                  swapCategoryAndBottomBar: false,
                  skinToneConfig: SkinToneConfig(
                      indicatorColor: ColorsManager.mainBurble,
                      dialogBackgroundColor: ColorsManager.mainBurble),
                  categoryViewConfig: CategoryViewConfig(
                    indicatorColor: ColorsManager.mainBurble,
                    iconColorSelected: ColorsManager.mainBurble,
                  ),
                  bottomActionBarConfig: BottomActionBarConfig(
                      backgroundColor: ColorsManager.mainBurble),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void sendMessage({required context}) {
    if (ChatCubit.get(context).messageController.text.isNotEmpty) {
      ChatCubit.get(context).sendMessage(
        getMessageResponse: GetMessageResponse(
          text: ChatCubit.get(context).messageController.text,
          id: i++,
          createdAt: DateTime.now().toString(),
          senderId: widget.friendChatModel.id,
          isSent: false,
        ),
        friendShipId: int.parse(widget.friends.friendShipId!),
      );

      FriendListCubit.get(context).updateLastMessage(
        ChatCubit.get(context).messageController.text,
        widget.friends,
        widget.friendChatModel.id,
      );
      ChatCubit.get(context).scrollController.animateTo(
            ChatCubit.get(context).scrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 400),
            curve: Curves.fastOutSlowIn,
          );
      ChatCubit.get(context).messageController.clear();
    }
  }
}
