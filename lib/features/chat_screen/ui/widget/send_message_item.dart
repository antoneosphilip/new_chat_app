import 'package:christy/features/chat_screen/data/model/get_messages.dart';
import 'package:christy/features/chat_screen/logic/cubit/chat_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../home/data/model/friend_chat_model.dart';
import '../../logic/cubit/chat_cubit.dart';

class MessageItem extends StatelessWidget {
  final GetMessageResponse message;
  final AlignmentGeometry align;
  final Friends? friends;

  const MessageItem({
    super.key,
    required this.message,
    required this.align,
    required,
    this.friends,
  });

  @override
  Widget build(BuildContext context) {
    // Parse the string to a DateTime object
    DateTime dateTime = DateTime.parse(message.createdAt!);

    String period = dateTime.hour >= 12 ? "PM" : "AM";

    // Convert to 12-hour format
    int hour = dateTime.hour % 12;
    hour = hour == 0 ? 12 : hour; // Convert '0' hour to '12'

    // Format to get the time in 12-hour format
    String time =
        "${hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')} $period";

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Align(
            alignment: align,
            child: Container(
              decoration: BoxDecoration(
                  color: align == Alignment.centerRight
                      ? ColorsManager.mainBurble
                      : Colors.white,
                  borderRadius: BorderRadius.circular(16.r),
                  border: align == Alignment.centerLeft
                      ? Border.all(color: ColorsManager.mainBurble, width: 2)
                      : Border.all()),
              width: 244.w,
              child: Center(
                  child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Center(
                  child: Text(
                    message.text ?? '',
                    style: TextStyles.font14MainBurbleRegular.copyWith(
                        color: align == Alignment.centerRight
                            ? Colors.white
                            : ColorsManager.secondBlack),
                  ),
                ),
              )),
            ),
          ),
        ),
        SizedBox(
          height: 9.h,
        ),
        Align(
          alignment: align,
          child: Padding(
            padding: EdgeInsets.only(
              right: align == Alignment.centerRight ? 21.w : 0,
              left: align == Alignment.centerLeft ? 21.w : 0,
            ),
            child: Container(
              width: align == Alignment.centerRight ? 100.w : 80.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                color: ColorsManager.lightGrey,
              ),
              child: BlocBuilder<ChatCubit, ChatStates>(
                buildWhen: (previous, current) =>
                    current is SendMessagesSuccessStates,
                builder: (BuildContext context, state) {
                  return Center(
                    child: Row(
                      children: [
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          time,
                          style: TextStyles.font11GreyRegular.copyWith(
                              fontSize: 12.sp, color: ColorsManager.deepGrey),
                        ),
                        SizedBox(
                          width: 12.w,
                        ),
                        align == Alignment.centerRight
                            ? ChatCubit.get(context)
                                    .checkSendMessage[message.id]!
                                ? const Icon(
                                    Icons.check,
                                    size: 20,
                                    color: ColorsManager.deepGrey,
                                  )
                                : const Icon(
                                    Icons.sensors_off,
                                    size: 20,
                                    color: ColorsManager.deepGrey,
                                  )
                            : const SizedBox(),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        )
      ],
    );
  }
}
