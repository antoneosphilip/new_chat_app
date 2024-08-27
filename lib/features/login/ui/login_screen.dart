import 'package:christy/core/widgets/app_text_button.dart';
import 'package:christy/features/login/ui/widget/login_block_listener.dart';
import 'package:christy/features/login/ui/widget/login_text_form_field.dart';
import 'package:christy/features/login/ui/widget/login_welcome_back_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/di/dependency_injection.dart';
import '../../../core/theming/styles.dart';
import '../../../core/widgets/app_text_form_field.dart';
import '../logic/cubit/login_cubit.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LoginCubit(getIt()),
      child: Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const LoginWelcomeBackText(),
                SizedBox(height: 10.h,),
                const LoginTextFormField(),
                const LoginBlockListener(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
