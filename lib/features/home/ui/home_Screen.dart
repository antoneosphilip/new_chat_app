import 'package:christy/core/theming/colors.dart';
import 'package:christy/core/widgets/search_app.dart';
import 'package:christy/features/home/ui/widgets/firend_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/di/dependency_injection.dart';
import '../../../core/theming/styles.dart';
import '../logic/cubit/friend_list_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          FriendListCubit(getIt())..fetchInitialData(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 22.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SearchApp(
                  controller: TextEditingController(),
                ),
                SizedBox(
                  height: 36.h,
                ),
                InkWell(
                  onTap: () {

                  },
                  child: Text(
                    'chats',
                    style: TextStyles.font20BlackRegular
                        .copyWith(color: ColorsManager.bink),
                  ),
                ),
                SizedBox(
                  height: 24.h,
                ),
                const ChatListView(),
                SizedBox(
                  height: 24.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
