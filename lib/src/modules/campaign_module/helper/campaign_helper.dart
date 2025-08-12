// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:puvadon_jenosize/src/common/themes/color_theme.dart';
import 'package:puvadon_jenosize/src/modules/campaign_module/data/models/campaign_list_model.dart';

class CampaignHelper {
  static String getStatusText(CampaignStatus status) {
    switch (status) {
      case CampaignStatus.active:
        return 'Active';
      case CampaignStatus.inactive:
        return 'Inactive';
      case CampaignStatus.completed:
        return 'Completed';
    }
  }

  static Color getStatusColor(CampaignStatus status) {
    switch (status) {
      case CampaignStatus.active:
        return ColorsTheme.instance.primary;
      case CampaignStatus.inactive:
        return ColorsTheme.instance.secondary;
      case CampaignStatus.completed:
        return ColorsTheme.instance.green;
    }
  }
}
