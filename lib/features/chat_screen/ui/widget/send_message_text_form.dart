import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../logic/cubit/chat_cubit.dart';

class SendMessageTextForm extends StatelessWidget {

  const SendMessageTextForm({super.key});

  @override
  Widget build(BuildContext context) {
    FocusNode focusNode = FocusNode();

    return   Expanded(
      child: Padding(
        padding: EdgeInsets.only(left: 50.w),
        child: TextField(
          focusNode: focusNode,
          controller: ChatCubit.get(context).messageController,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "Type Here...",
            hintStyle: TextStyles.font15BlackRegular.copyWith(
              fontSize: 17.sp,
              color: ColorsManager.secondGrey,
            ),
          ),
        ),
      ),
    );
  }
}
