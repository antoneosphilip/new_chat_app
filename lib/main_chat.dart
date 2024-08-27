import 'package:christy/core/helpers/constans.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'core/routing/app_router.dart';
import 'core/routing/routes.dart';
import 'core/theming/colors.dart';
import 'features/internet_connection/cubit/internet_connection_cubit.dart';

class ChristyApp extends StatefulWidget {
  final AppRouter appRouter;

  const ChristyApp({
    super.key,
    required this.appRouter,
  });

  @override
  State<ChristyApp> createState() => _ChristyAppState();
}

class _ChristyAppState extends State<ChristyApp> {
  bool result = false;

  @override
  void initState() {
    // checkConnection();
    super.initState();
  }

  Future<void> checkConnection() async {
    result = await Connectivity()
        .onConnectivityChanged
        .contains(ConnectivityResult.wifi);
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        child: BlocProvider(
          create: (BuildContext context) =>
              InternetConnectionCubit()..checkConnection(),
          child: BlocBuilder<InternetConnectionCubit, InternetConnectionState>(
            builder: (BuildContext context, state) {
              return InternetConnectionCubit.get(context).isConnected? MaterialApp(
                title: 'Chat App',
                theme: ThemeData(
                  primaryColor: ColorsManager.white,
                  scaffoldBackgroundColor: ColorsManager.white,
                ),
                debugShowCheckedModeBanner: false,
                builder: EasyLoading.init(),
                onGenerateRoute: widget.appRouter.generateRoute,
                initialRoute:
                    isLogin ? Routes.homeBottomNav : Routes.loginScreen, // home:isLogin?HomeScreen(): LoginScreen()
              ):MaterialApp(
                theme: ThemeData(
                  primaryColor: ColorsManager.white,
                  scaffoldBackgroundColor: ColorsManager.white,
                ),
                debugShowCheckedModeBanner: false,
                builder: (context, child) {
                  return Scaffold(
                    body: Center(
                      child:  Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Lottie.asset('assets/animation/no_connection.json'),  // Add your error animation JSON file here
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ));
  }
}
