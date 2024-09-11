import 'package:christy/core/di/dependency_injection.dart';
import 'package:christy/features/get_friends_reques/logic/cubit/get_friends_request_cubit.dart';
import 'package:christy/features/get_friends_reques/ui/widget/request_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theming/colors.dart';
import '../../../core/theming/styles.dart';

class RequestsFriend extends StatefulWidget {
  const RequestsFriend({super.key});

  @override
  State<RequestsFriend> createState() => _RequestsFriendState();
}

class _RequestsFriendState extends State<RequestsFriend> {
  @override
  void initState() {
    // SignalRService.connection(channelName: 'SentRequest');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          GetFriendsRequestCubit(getIt())..getFriendsRequest(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50.h,
                ),
                Text(
                  "friends requests",
                  style: TextStyles.font20BlackRegular
                      .copyWith(color: ColorsManager.bink),
                ),
                SizedBox(
                  height: 20.h,
                ),
                const RequestListView(),
              ],
            ),
          )),
        ),
      ),
    );
  }
}
