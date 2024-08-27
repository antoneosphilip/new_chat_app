import 'package:christy/core/theming/colors.dart';
import 'package:christy/core/theming/font_weight_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextStyles {
  static TextStyle font21BlackSemiBold = TextStyle(
    fontSize: 21.sp,
    fontWeight: FontWeightHelper.semiBold,
    color: Colors.black,
  );
  static TextStyle font15BlackRegular = TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeightHelper.regular,
    color: Colors.black,
  );
  static TextStyle font20BlackRegular = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeightHelper.regular,
    color: ColorsManager.lightBlack,
  );
  static TextStyle font20WhiteMedium = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeightHelper.medium,
    color: Colors.white,
  );
  static TextStyle font18BlackW500 = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  );
  static TextStyle font18BlackSemiBold = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeightHelper.semiBold,
    color: ColorsManager.darkGrey,
  );
  static TextStyle font13GreyRegular = TextStyle(
    fontSize: 13.sp,
    fontWeight: FontWeightHelper.regular,
    color: ColorsManager.greyBlack,
  );
  static TextStyle font11GreyRegular = TextStyle(
    fontSize: 11.sp,
    fontWeight: FontWeightHelper.regular,
    color: const Color(0xff5C5C5C),
  );
  static TextStyle font14MainBurbleRegular =  TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.regular,
    color: ColorsManager.mainBurble,
  );
}
