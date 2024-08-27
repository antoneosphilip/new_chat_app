import 'package:christy/core/di/dependency_injection.dart';
import 'package:christy/core/widgets/flutter_show_toast.dart';
import 'package:christy/core/widgets/search_app.dart';
import 'package:christy/features/search_friend/ui/widget/search_friend_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../logic/cubit/search_friend_cubit.dart';
import '../logic/cubit/search_friend_states.dart';

class AddFriendScreen extends StatelessWidget {
  const AddFriendScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SearchFriendCubit(getIt()),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: BlocConsumer<SearchFriendCubit, SearchFriendStates>(
              buildWhen: (previous, current) =>
                  current is SearchFriendSuccessStates ||
                  current is SearchFriendLoadingStates ||
                  current is SearchFriendErrorStates ||
                  current is AddFriendSuccessStates ,
                listener: (BuildContext context, SearchFriendStates state) {
                if (state is AddFriendSuccessStates) {
                  flutterShowToast(
                      message: 'Sent Add successfully.',
                      toastCase: ToastCase.success);
                } else if (state is AddFriendErrorStates) {
                  flutterShowToast(
                      message: state.error.toString(),
                      toastCase: ToastCase.error);
                }
              },
              builder: (BuildContext context, SearchFriendStates state) {
                return Column(
                  children: [
                    SearchApp(
                      text: 'Search For Friend',
                      controller:
                          SearchFriendCubit.get(context).searchController,
                      onTap: () {
                        SearchFriendCubit.get(context)
                            .listenTextEditingController();
                      },
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    SearchFriendListView(
                      state: state,
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
