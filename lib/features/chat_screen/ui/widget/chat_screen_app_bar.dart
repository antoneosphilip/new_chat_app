import 'package:christy/features/home/logic/cubit/friend_list_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../home/data/model/friend_chat_model.dart';
import 'chat_person_name.dart';

class ChatScreenAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Friends friends;
  final FriendListCubit friendListCubit;
  const ChatScreenAppBar({super.key, required this.friends,required this.friendListCubit });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      flexibleSpace: ChatPersonName(friends: friends,friendListCubit:friendListCubit),
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(110.h);
}
