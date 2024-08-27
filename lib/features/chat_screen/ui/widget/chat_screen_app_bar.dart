import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../home/data/model/friend_chat_model.dart';
import 'chat_person_name.dart';

class ChatScreenAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Friends friends;
  const ChatScreenAppBar({Key? key, required this.friends}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      flexibleSpace: ChatPersonName(friends: friends),
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(110.h);
}
