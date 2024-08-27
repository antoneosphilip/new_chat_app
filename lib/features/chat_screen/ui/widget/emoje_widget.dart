import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/colors.dart';
import '../../logic/cubit/chat_cubit.dart';

class EmojiWidget extends StatelessWidget {
  const EmojiWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Offstage(
      offstage: ChatCubit.get(context).emojiShowing,
      child: SizedBox(
        height: 300.h, // Set the height to match the config
        child: EmojiPicker(
          textEditingController: ChatCubit.get(context).messageController,
          scrollController: ChatCubit.get(context).scrollController,
          config: const Config(

            height: 330,
            checkPlatformCompatibility: true,
            emojiViewConfig: EmojiViewConfig(
              columns: 7, // Reduce number of columns for better performance
              emojiSizeMax: 24, // Adjust size for better performance
              verticalSpacing: 0,
              horizontalSpacing: 0,
              gridPadding: EdgeInsets.zero,
              buttonMode: ButtonMode.MATERIAL,
              loadingIndicator: SizedBox.shrink(),
              recentsLimit:   40,
            ),
            swapCategoryAndBottomBar: false,
            skinToneConfig: SkinToneConfig(indicatorColor: ColorsManager.mainBurble,dialogBackgroundColor: ColorsManager.mainBurble),
            categoryViewConfig: CategoryViewConfig(indicatorColor: ColorsManager.mainBurble,iconColorSelected: ColorsManager.mainBurble,),
            bottomActionBarConfig: BottomActionBarConfig(backgroundColor: ColorsManager.mainBurble),
          ),
        ),
      ),
    );

  }
}
