// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:puvadon_jenosize/src/common/themes/color_theme.dart';
import 'package:puvadon_jenosize/src/modules/campaign_module/data/models/campaign_list_model.dart';
import 'package:puvadon_jenosize/src/modules/campaign_module/presentation/view_model/campaign_view_model.dart';
import 'package:puvadon_jenosize/src/modules/campaign_module/presentation/widget/campaign_card_widget.dart';
import 'package:puvadon_jenosize/src/modules/core_widget_module/widget/app_bar_widget.dart';

class CampaignView extends GetView<CampaignViewModel> {
  const CampaignView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: 'Campaigns',
        showLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.local_activity),
            onPressed: () {
              controller.navigationToReferFriend();
            },
          ),
        ],
      ),
      backgroundColor: ColorsTheme.instance.natural20p,
      body: Obx(() {
        if (controller.campaigns.isEmpty) {
          return Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          padding: const EdgeInsets.all(16.0),
          itemCount: controller.campaigns.length,
          itemBuilder: (context, index) {
            final campaign = controller.campaigns[index];
            final enable = campaign.status == CampaignStatus.active;

            return CampaignCardWidget(
              name: campaign.title,
              subName: campaign.shortDescription,
              imageUrl: campaign.image,
              status: campaign.status,
              onJoinPressed:
                  enable
                      ? () => controller.navigateToCampaignDetail(campaign)
                      : null,
            );
          },
        );
      }),
    );
  }
}
