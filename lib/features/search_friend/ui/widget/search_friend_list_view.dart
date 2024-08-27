import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../logic/cubit/search_friend_cubit.dart';
import '../../logic/cubit/search_friend_states.dart';
import 'search_friend_item.dart';

class SearchFriendListView extends StatelessWidget {
  final SearchFriendStates state;

  const SearchFriendListView({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final cubit = SearchFriendCubit.get(context);
    if (state is SearchFriendLoadingStates) {
      return const Center(child: CircularProgressIndicator());
    } else if (state is SearchFriendSuccessStates || state is AddFriendSuccessStates) {
      return ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return SearchFriendItem(
            searchFriendModel: cubit.searchFriendModel![index],
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(
            height: 32.h,
          );
        },
        itemCount: cubit.searchFriendModel!
            .length, // You might want to use successState.data.length if it represents a list
      );
    } else if (state is SearchFriendErrorStates) {
      final errorState =
          state as SearchFriendErrorStates; // Cast to get the error property
      return Center(child: Text(errorState.error.toString()));
    } else {
      return Container();
    }
  }
}
