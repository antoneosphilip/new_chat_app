import 'package:christy/core/theming/colors.dart';
import 'package:christy/features/home/data/model/friend_chat_model.dart';
import 'package:christy/features/home/logic/cubit/friend_list_cubit.dart';
import 'package:christy/features/home/logic/cubit/friend_list_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/styles.dart';

class ChatPersonName extends StatelessWidget {
  final Friends friends;
  final FriendListCubit friendListCubit;
  const ChatPersonName({super.key, required this.friends, required this.friendListCubit });

  @override
  Widget build(BuildContext context) {

    return BlocProvider.value(
      value: friendListCubit,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24.r),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25), // 25% opacity
              offset: const Offset(0, 4), // x, y offset
              blurRadius: 4, // Blur radius
              spreadRadius: 0, // Spread radius
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 30.w,
            ),
            const Icon(
              Icons.arrow_back,
              color: ColorsManager.black,
              size: 30,
            ),
            SizedBox(
              width: 34.w,
            ),
            Padding(
              padding: EdgeInsets.only(top: 30.h),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(friends.image ??
                        'https://th.bing.com/th/id/R.1a169ee0e11d6f85260b7864aa916f2c?rik=F6uhG3K5RxD0Bg&pid=ImgRaw&r=0'),
                    radius: 26.r,
                  ),
                  SizedBox(
                    width: 13.w,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${friends.firstname}',
                        style: TextStyles.font18BlackSemiBold,
                      ),
                      BlocBuilder<FriendListCubit, FriendListState>(
                        buildWhen: (previous, current) => current is Success,
                        builder: (context, state) {
                          return Text(friends.isOnline! ? 'online' : '',
                              style: TextStyles.font14MainBurbleRegular);
                        },
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
