import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../theming/colors.dart';
import 'app_text_form_field.dart';

class SearchApp extends StatelessWidget {
 final String? text;
 final TextEditingController controller;
 final void Function(String)? onChanged;
 final void Function()? onTap;

 const SearchApp({super.key, this.text, required this.controller,  this.onChanged, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 70.h,
        ),
        AppTextFormField(
          onTap:onTap ,
          hintText: text??'Search Chat',
          backgroundColor: ColorsManager.lightGrey,
          validator: (valur) {},
          controller: controller,
          onChanged: onChanged,
          prefixIcon: Padding(
            padding: const EdgeInsets.all(12.0),
            child: SvgPicture.asset(
              'assets/svgs/search.svg',
              height: 20,
              width: 20,
            ),
          ),
        ),
      ],
    );
  }
}
