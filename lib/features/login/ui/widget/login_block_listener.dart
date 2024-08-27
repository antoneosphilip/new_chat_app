import 'package:christy/core/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/widgets/app_text_button.dart';
import '../../../../core/widgets/error_message.dart';
import '../../logic/cubit/login_cubit.dart';
import '../../logic/cubit/login_states.dart';

class LoginBlockListener extends StatelessWidget {
  const LoginBlockListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          current is Error1 || current is Error || current is Loading,
      listener: (BuildContext context, LoginState state) {
        state.whenOrNull(success: (loginResponse) {
          context.pushNamed(Routes.homeScreen);
          EasyLoading.dismiss();
        }, error: (error) {
          EasyLoading.dismiss();
          showErrorAnimation(context, error);
        }, loading: () {
          EasyLoading.show();
        });
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 22.w),
        child: AppTextButton(
          buttonText: 'Login',
          textStyle: TextStyles.font20WhiteMedium,
          onPressed: () {
            if (context.read<LoginCubit>().formKey.currentState!.validate()) {
              context.read<LoginCubit>().login();
            }
          },
          buttonHeight: 55,
        ),
      ),
    );
  }
}
