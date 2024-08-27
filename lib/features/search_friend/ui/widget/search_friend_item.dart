import 'package:christy/features/search_friend/data/models/add_friend_body_model.dart';
import 'package:christy/features/search_friend/logic/cubit/search_friend_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../data/models/search_friend_model.dart';

class SearchFriendItem extends StatelessWidget {
  final SearchFriendModel searchFriendModel;

  const SearchFriendItem({super.key, required this.searchFriendModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: ColorsManager.mainBurble, width: 1)),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 9.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 17.w,
            ),
            CircleAvatar(
              radius: 24.r,
              backgroundImage: NetworkImage(searchFriendModel.image ??
                  'https://th.bing.com/th/id/R.1a169ee0e11d6f85260b7864aa916f2c?rik=F6uhG3K5RxD0Bg&pid=ImgRaw&r=0'),
            ),
            SizedBox(
              width: 13.w,
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          '${searchFriendModel.firstname} ${searchFriendModel.lastname}',
                          style: TextStyles.font18BlackSemiBold,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    Text(
                      searchFriendModel.email ?? '',
                      style: TextStyles.font13GreyRegular,
                    )
                  ],
                ),
              ],
            ),
            const Spacer(),
            !SearchFriendCubit.get(context).changeAddIcon[searchFriendModel.email]!
                ? InkWell(
                    onTap: () {
                      SearchFriendCubit.get(context).addFriend(
                          addFriendBodyModel: AddFriendBodyModel(
                              recieverEmail: searchFriendModel.email));
                    },
                    child: SvgPicture.asset(
                      'assets/svgs/add.svg',
                      height: 25,
                      width: 25,
                    ),
                  )
                : const SizedBox(),
            SizedBox(
              width: 15.w,
            )
          ],
        ),
      ),
    );
  }
}
