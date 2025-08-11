// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:puvadon_jenosize/src/common/themes/color_theme.dart';
import 'package:puvadon_jenosize/src/modules/core_widget_module/widget/app_bar_widget.dart';
import 'package:puvadon_jenosize/src/modules/home_module/data/models/campaign_list_model.dart';
import 'package:puvadon_jenosize/src/modules/home_module/presentation/component/campaign_card_widget.dart';
import 'package:puvadon_jenosize/src/modules/home_module/presentation/view_model/home_view_model.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  void onJoinPressed() {
    // Handle join button press
    Get.snackbar('Join Campaign', 'You have joined the campaign successfully!');
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Get.find<HomeViewModel>();
    return Scaffold(
      appBar: AppBarWidget(title: 'Campaigns'),
      backgroundColor: ColorsTheme.instance.natural20p,
      body: Obx(() {
        if (viewModel.campaigns.isEmpty) {
          return Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          padding: const EdgeInsets.all(16.0),
          itemCount: viewModel.campaigns.length,
          itemBuilder: (context, index) {
            final campaign = viewModel.campaigns[index];
            final enable = campaign.status == CampaignStatus.active;

            return CampaignCardWidget(
              name: campaign.title,
              subName: campaign.shortDescription,
              imageUrl: campaign.image,
              status: campaign.status,
              onJoinPressed: enable ? onJoinPressed : null,
            );
          },
        );
      }),
    );
  }
}
