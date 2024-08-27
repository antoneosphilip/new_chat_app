import 'package:christy/core/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/di/dependency_injection.dart';
import '../../../../core/helpers/app_regex.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/widgets/app_text_button.dart';
import '../../../../core/widgets/app_text_form_field.dart';
import '../../logic/cubit/login_cubit.dart';
import '../../logic/cubit/login_states.dart';

class LoginTextFormField extends StatelessWidget {
  const LoginTextFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formKey,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 22.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Email Address',
              style: TextStyles.font15BlackRegular,
            ),
            SizedBox(
              height: 7.h,
            ),
            AppTextFormField(
              hintText: 'example@gmail.com',
              validator: (String? value) {
                if (value == null || value.isEmpty||!AppRegex.isEmailValid(value)) {
                  return 'Please enter a valid password';
                }
              },
              controller: context.read<LoginCubit>().emailController,
            ),
            SizedBox(
              height: 26.h,
            ),
            Text(
              'Password',
              style: TextStyles.font15BlackRegular,
            ),
            SizedBox(
              height: 7.h,
            ),
            AppTextFormField(
              hintText: 'As1234#',
              validator: (String? value)
              {
                if (value == null || value.isEmpty) {
                  return 'Please enter a valid password';
                }
              },
              controller: context.read<LoginCubit>().passwordController,
            ),
            SizedBox(
              height: 75.h,
            ),

          ],
        ),
      ),
    );
  }
}
