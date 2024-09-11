import 'package:cached_network_image/cached_network_image.dart';
import 'package:christy/core/theming/colors.dart';
import 'package:christy/features/get_friends_reques/data/models/friend_request_body.dart';
import 'package:christy/features/get_friends_reques/data/models/get_friend_request_response.dart';
import 'package:christy/features/get_friends_reques/logic/cubit/get_friends_request_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/styles.dart';

class RequestItem extends StatelessWidget {
  final Requests? request;
  final GetFriendsRequestCubit cubit;

  const RequestItem({super.key, required this.request, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return !request!.outGoing!
        ? Column(
          children: [
            Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24.r),
                    border: Border.all(color: ColorsManager.mainBurble)),
                child: Row(
                  children: [
                    SizedBox(
                      width: 17.w,
                    ),
                    Container(
                      width: 60.w,
                      height: 80.h,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: CachedNetworkImageProvider(request!.image ??
                                'https://th.bing.com/th/id/R.1a169ee0e11d6f85260b7864aa916f2c?rik=F6uhG3K5RxD0Bg&pid=ImgRaw&r=0')),
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(
                      width: 13.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${request!.firstname} ${request!.lastname}',
                          style: TextStyles.font18BlackSemiBold,
                        ),
                        Text(
                          '${request!.email}',
                          style: TextStyles.font13GreyRegular,
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    InkWell(
                      onTap: () {
                        cubit.acceptFriendsRequest(
                            acceptFriendRequestsBody:
                                FriendRequestBody(requestId: request!.id!));
                      },
                      child: const Icon(
                        Icons.check,
                        size: 30,
                        color: Colors.green,
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    InkWell(
                      onTap: () {
                        cubit.rejectFriendsRequest(
                            rejectFriendRequestsBody:
                                FriendRequestBody(requestId: request!.id!));
                      },
                      child: const Icon(
                        Icons.close,
                        size: 30,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
            SizedBox(height: 15.h,),

          ],
        )
        : const SizedBox();
  }
}
