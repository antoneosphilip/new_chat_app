import 'package:christy/core/helpers/extensions.dart';
import 'package:christy/features/home/data/model/friend_chat_model.dart';
import 'package:christy/features/home/logic/cubit/friend_list_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';

class ChatItem extends StatelessWidget {
  final Friends friends;
  final FriendChatModel friendChatModel;
  final FriendListCubit friendListCubit;
  const ChatItem(
      {super.key, required this.friends, required this.friendChatModel, required this.friendListCubit});

  @override
  Widget build(BuildContext context) {
    final time = friends.latestMessage?.createdAt != null
        ? DateFormat('hh:mm')
            .format(DateTime.parse(friends.latestMessage?.createdAt))
        : '';

    return InkWell(
      onTap: () {
        context.pushNamed(
          Routes.chatScreen,
          arguments: {
            'friends': friends,
            'friendChatModel': friendChatModel,
            'friendListCubit':friendListCubit,

          },
        );
      },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(color: ColorsManager.mainBurble, width: 1)),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 9.h),
          child: Row(
            children: [
              SizedBox(
                width: 17.w,
              ),
              CircleAvatar(
                radius: 24.r,
                backgroundImage: NetworkImage(friends.image ??
                    'https://th.bing.com/th/id/R.1a169ee0e11d6f85260b7864aa916f2c?rik=F6uhG3K5RxD0Bg&pid=ImgRaw&r=0'),
              ),
              SizedBox(
                width: 13.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        friends.firstname ?? '',
                        style: TextStyles.font18BlackSemiBold,
                      ),
                      time != ''
                          ? Padding(
                              padding: EdgeInsets.only(left: 120.w),
                              child: Text(
                                time,
                                style: TextStyles.font11GreyRegular,
                              ))
                          : const SizedBox(),
                      SizedBox(
                        width: 8.w,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                  Text(
                    friends.latestMessage?.text.toString() ?? '',
                    style: TextStyles.font13GreyRegular,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
