// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:puvadon_jenosize/src/modules/core_widget_module/widget/app_bar_widget.dart';
import 'package:puvadon_jenosize/src/modules/profile_module/presentation/view_model/profile_point_history_view_model.dart';

class ProfilePointHistoryView extends GetView<ProfilePointHistoryViewModel> {
  const ProfilePointHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: 'Point History'),
      body: Center(
        child: Text('Point history functionality will be implemented here.'),
      ),
    );
  }
}
