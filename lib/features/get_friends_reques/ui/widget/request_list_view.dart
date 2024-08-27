import 'package:christy/core/theming/styles.dart';
import 'package:christy/core/widgets/flutter_show_toast.dart';
import 'package:christy/features/get_friends_reques/logic/cubit/get_friends_request_cubit.dart';
import 'package:christy/features/get_friends_reques/logic/cubit/get_friends_request_states.dart';
import 'package:christy/features/get_friends_reques/ui/widget/request_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/colors.dart';

class RequestListView extends StatelessWidget {
  const RequestListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetFriendsRequestCubit, GetFriendsRequestStates>(
      buildWhen: (previous, current) =>
          current is GetFriendsRequestSuccessStates ||
          current is GetFriendsRequestErrorStates ||
          current is GetFriendsRequestLoadingStates ||
          current is AcceptFriendsRequestSuccessStates ||
          current is RejectFriendsRequestSuccessStates,
      listener: (BuildContext context, GetFriendsRequestStates state) {
        if (state is AcceptFriendsRequestSuccessStates) {
          flutterShowToast(
              message: "accept Friend Successfully",
              toastCase: ToastCase.success);
        }
        if (state is RejectFriendsRequestSuccessStates) {
          flutterShowToast(
              message: "Rejected Friend Successfully",
              toastCase: ToastCase.success);
        }
      },
      builder: (BuildContext context, state) {
        final cubit = GetFriendsRequestCubit.get(context);
        if (state is GetFriendsRequestLoadingStates) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is GetFriendsRequestSuccessStates ||
            state is AcceptFriendsRequestSuccessStates ||
            state is RejectFriendsRequestSuccessStates) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30.h,
                ),
                Text(
                  "friends requests",
                  style: TextStyles.font20BlackRegular
                      .copyWith(color: ColorsManager.bink),
                ),
                SizedBox(
                  height: 20.h,
                ),
                ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return RequestItem(
                          request:
                              cubit.getFriendsRequestResponse?.requests[index],
                          cubit: cubit);
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: 15.h,
                      );
                    },
                    itemCount:
                        cubit.getFriendsRequestResponse!.requests.length),
              ],
            ),
          );
        } else if (state is GetFriendsRequestErrorStates) {
          return Text(state.error.toString());
        } else {
          return Container();
        }
      },
    );
  }
}
