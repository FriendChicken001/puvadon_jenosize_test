// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:puvadon_jenosize/src/common/themes/color_theme.dart';
import 'package:puvadon_jenosize/src/common/themes/size_theme.dart';
import 'package:puvadon_jenosize/src/common/themes/text_theme.dart';
import 'package:puvadon_jenosize/src/modules/core_widget_module/widget/image_network_widget.dart';
import 'package:puvadon_jenosize/src/modules/home_module/data/models/campaign_list_model.dart';
import 'package:puvadon_jenosize/src/modules/home_module/helper/home_helper.dart';
import 'package:puvadon_jenosize/src/modules/home_module/presentation/config/translation/home_i18n_key.dart';

class CampaignCardWidget extends StatelessWidget {

  const CampaignCardWidget({
    super.key,
    required this.name,
    required this.subName,
    this.imageUrl,
    required this.status,
    this.onJoinPressed,
  });
  final String name;
  final String subName;
  final String? imageUrl;
  final CampaignStatus status;
  final VoidCallback? onJoinPressed;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildDetail(),
            SizeTheme.instance.spacingMHeight,
            _buildButtonJoin(),
          ],
        ),
      ),
    );
  }

  Widget _buildDetail() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: ImageNetworkWidget(
            imageUrl: imageUrl ?? '',
            height: 60,
            width: 60,
          ),
        ),
        SizeTheme.instance.spacingMWidth,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                maxLines: 1,
                style: TextThemeCustom.instance.subTitle3,
              ),
              SizeTheme.instance.spacingSHeight,
              Text(
                subName,
                maxLines: 2,
                style: TextThemeCustom.instance.paragraph4,
              ),
            ],
          ),
        ),
        const SizedBox(width: 8),
        _StatusChip(status: status),
      ],
    );
  }

  Widget _buildButtonJoin() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onJoinPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: ColorsTheme.instance.secondary80p,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        ),
        child: Text(
          HomeI18nKey.joinButton.tr,
          style: TextThemeCustom.instance.button2,
        ),
      ),
    );
  }
}

class _StatusChip extends StatelessWidget {
  const _StatusChip({required this.status});
  final CampaignStatus status;

  @override
  Widget build(BuildContext context) {
    final color = HomeHelper.getStatusColor(status);
    final text = HomeHelper.getStatusText(status);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.15),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 12,
          color: color,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
