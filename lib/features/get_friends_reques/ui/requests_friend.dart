import 'package:christy/core/di/dependency_injection.dart';
import 'package:christy/features/get_friends_reques/logic/cubit/get_friends_request_cubit.dart';
import 'package:christy/features/get_friends_reques/ui/widget/request_list_view.dart';
import 'package:christy/features/home/data/api_service/singlar_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RequestsFriend extends StatefulWidget {
  const RequestsFriend({super.key});

  @override
  State<RequestsFriend> createState() => _RequestsFriendState();
}

class _RequestsFriendState extends State<RequestsFriend> {
  @override
  void initState() {
    // SignalRService.connection(channelName: 'SentRequest');
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          GetFriendsRequestCubit(getIt())..getFriendsRequest(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
              child: Column(
            children: [
              SizedBox(
                height: 50.h,
              ),
              const RequestListView(),
            ],
          )),
        ),
      ),
    );
  }
}
