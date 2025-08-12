// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';

// Project imports:
import 'package:puvadon_jenosize/src/common/themes/color_theme.dart';
import 'package:puvadon_jenosize/src/common/themes/size_theme.dart';
import 'package:puvadon_jenosize/src/common/themes/text_theme.dart';
import 'package:puvadon_jenosize/src/modules/core_widget_module/widget/app_bar_widget.dart';
import 'package:puvadon_jenosize/src/modules/profile_module/presentation/view_model/profile_refer_friend_view_model.dart';

class ProfileReferFriendView extends GetView<ProfileReferFriendViewModel> {
  const ProfileReferFriendView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: 'Refer a Friend',
        actions: [
          IconButton(
            icon: const Icon(Icons.history),
            onPressed: () => controller.navigateToHistory(),
          ),
        ],
      ),
      backgroundColor: ColorsTheme.instance.natural20p,
      body: Obx(() {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              QrImageView(
                data: controller.memberCode.value,
                size: 180,
                backgroundColor: Colors.white,
              ),
              SizeTheme.instance.spacingLHeight,
              Text(
                'Code : ${controller.memberCode.value}',
                style: TextThemeCustom.instance.subTitle2,
              ),
              SizeTheme.instance.spacingMHeight,
              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  onPressed: () => controller.sharedMemberCode(),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: ColorsTheme.instance.primary,
                    side: BorderSide(color: ColorsTheme.instance.primary),
                    backgroundColor: ColorsTheme.instance.white,
                  ),
                  icon: const Icon(Icons.ios_share),
                  label: const Text('Share'),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
