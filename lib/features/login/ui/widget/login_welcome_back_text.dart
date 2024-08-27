import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theming/styles.dart';

class LoginWelcomeBackText extends StatelessWidget {
  const LoginWelcomeBackText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left: 22.w),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 45),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 130.h,),
                  Text('Hello, Welcome Back',style: TextStyles.font21BlackSemiBold,),
                  Text('Happy to see you again, to use your account please login first.',style: TextStyles.font15BlackRegular,),
                ],
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:  EdgeInsets.only(top: 45.h),
                child: Image.asset('assets/svgs/Dayflow Sitting.png',fit: BoxFit.cover,),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
