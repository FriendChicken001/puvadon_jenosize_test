// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:puvadon_jenosize/src/common/themes/color_theme.dart';
import 'package:puvadon_jenosize/src/modules/core_widget_module/widget/app_bar_widget.dart';
import 'package:puvadon_jenosize/src/modules/profile_module/presentation/view_model/profile_point_history_view_model.dart';
import 'package:puvadon_jenosize/src/modules/profile_module/presentation/widget/history_point_card_widget.dart';

class ProfilePointHistoryView extends GetView<ProfilePointHistoryViewModel> {
  const ProfilePointHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: 'Point History'),
      backgroundColor: ColorsTheme.instance.natural20p,
      body: Obx(() {
        final data = controller.items;
        if (data.isEmpty) {
          return const Center(child: Text('No history yet'));
        }

        return ListView.separated(
          padding: const EdgeInsets.all(12),
          itemCount: data.length,
          separatorBuilder: (_, __) => const SizedBox(height: 8),
          itemBuilder: (_, i) => HistoryPointCardWidget(item: data[i]),
        );
      }),
    );
  }
}
