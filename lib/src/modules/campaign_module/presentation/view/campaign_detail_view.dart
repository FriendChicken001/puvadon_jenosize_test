// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:puvadon_jenosize/src/common/themes/size_theme.dart';
import 'package:puvadon_jenosize/src/common/themes/text_theme.dart';
import 'package:puvadon_jenosize/src/modules/campaign_module/config/translation/campaign_i18n_key.dart';
import 'package:puvadon_jenosize/src/modules/campaign_module/presentation/view_model/campaign_detail_view_model.dart';
import 'package:puvadon_jenosize/src/modules/core_widget_module/widget/app_bar_widget.dart';
import 'package:puvadon_jenosize/src/modules/core_widget_module/widget/image_network_widget.dart';

class CampaignDetailView extends GetView<CampaignDetailViewModel> {
  const CampaignDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: 'Campaigns Detail'),
      body: Obx(() {
        final c = controller.campaign.value;

        if (c == null) {
          return const Center(child: Text('No campaign data'));
        }

        return buildLayout();
      }),
    );
  }

  Widget buildLayout() {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizeTheme.instance.spacingLHeight,
          buildImageSection(),
          SizeTheme.instance.spacingLHeight,
          buildTitleAndDescription(),
          SizeTheme.instance.spacingLHeight,
          buildJoinButton(),
          SizeTheme.instance.spacingLHeight,
        ],
      ),
    );
  }

  Widget buildImageSection() {
    return Obx(() {
      final imageUrl = controller.campaign.value?.image ?? '';
      return AspectRatio(
        aspectRatio: 16 / 9,
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(16),
            bottomRight: Radius.circular(16),
          ),
          child: ImageNetworkWidget(
            imageUrl: imageUrl,
            height: 200,
            width: double.infinity,
          ),
        ),
      );
    });
  }

  Widget buildTitleAndDescription() {
    return Obx(() {
      final campaign = controller.campaign.value;
      if (campaign == null) return const SizedBox.shrink();

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 20, 16, 8),
            child: Text(
              campaign.title,
              style: TextThemeCustom.instance.heading3,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              campaign.shortDescription,
              style: TextThemeCustom.instance.paragraph3,
            ),
          ),
        ],
      );
    });
  }

  Widget buildJoinButton() {
    return Obx(() {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed:
                (controller.isLoading.value || controller.isJoined.value)
                    ? null
                    : controller.saveJoinedCampaign,
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              child:
                  controller.isLoading.value
                      ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                      : Text(
                        controller.isJoined.value
                            ? CampaignI18nKey.joinedButton.tr
                            : CampaignI18nKey.joinButton.tr,
                        style: TextThemeCustom.instance.button3,
                      ),
            ),
          ),
        ),
      );
    });
  }
}
