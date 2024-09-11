import 'package:christy/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../theming/styles.dart';

class CustomShimmer extends StatelessWidget {
  final bool isChat;
  const CustomShimmer({super.key,  this.isChat=false});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: ColorsManager.mainBurble,
        highlightColor: Colors.white,
        child:!isChat? ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  border:
                      Border.all(color: ColorsManager.mainBurble, width: 1)),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 9.h),
                child: Row(
                  children: [
                    SizedBox(
                      width: 17.w,
                    ),
                    CircleAvatar(
                      radius: 24.r,
                      backgroundImage: const NetworkImage(
                          'https://th.bing.com/th/id/R.1a169ee0e11d6f85260b7864aa916f2c?rik=F6uhG3K5RxD0Bg&pid=ImgRaw&r=0'),
                    ),
                    SizedBox(
                      width: 13.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              '',
                              style: TextStyles.font18BlackSemiBold,
                            ),
                            Padding(
                                padding: EdgeInsets.only(left: 120.w),
                                child: Text(
                                  "",
                                  style: TextStyles.font11GreyRegular,
                                ))
                          ],
                        ),
                        SizedBox(
                          height: 6.h,
                        ),
                        Text(
                          '',
                          style: TextStyles.font13GreyRegular,
                        )
                      ],
                    )
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => SizedBox(height: 32.h),
          itemCount: 10,
        ):
        ListView.builder(
          // reverse: true,
          itemCount: 10,
          itemBuilder: (context, index) {
            return Padding(
              padding: index == 0
                  ? EdgeInsets.symmetric(vertical: 30.h)
                  : EdgeInsets.only(bottom: 30.h),
              child: Column(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            decoration: BoxDecoration(
                                color:  ColorsManager.mainBurble,
                                borderRadius: BorderRadius.circular(16.r),
                                // border: align == Alignment.centerLeft
                                //     ? Border.all(color: ColorsManager.mainBurble, width: 2)
                                //     : Border.all()),
                            ),
                            width: 244.w,
                            child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Center(
                                    child: Text(
                                       '',
                                      style: TextStyles.font14MainBurbleRegular.copyWith(
                                          color:Colors.white),
                                    ),
                                  ),
                                )),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 9.h,
                      ),
                    ],
                  )
                ],
              ),
            );
          },
        )

    );
  }
}
