import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/shimmer.dart';
import '../../logic/cubit/friend_list_cubit.dart';
import '../../logic/cubit/friend_list_states.dart';
import 'friend_item.dart';

class ChatListView extends StatelessWidget {
  const ChatListView({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = FriendListCubit.get(context);
    return BlocBuilder<FriendListCubit, FriendListState>(
      buildWhen: (previous, current) =>
          current is Success || current is Error || current is Loading,
      builder: (context, state) {
        if (state is Loading) {
          return const CustomShimmer();
        } else if (state is Success) {
          return ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return ChatItem(
                  friends: cubit.friendChatModel!.friends![index],
                  friendChatModel: cubit.friendChatModel!,
                  friendListCubit: cubit);
            },
            separatorBuilder: (context, index) => SizedBox(height: 32.h),
            itemCount: cubit.friendChatModel?.friends?.length ?? 0,
          );
        } else if (state is Error) {
          return Center(child: Text(state.error));
        } else {
          return Container();
        }
      },
    );
  }
}
