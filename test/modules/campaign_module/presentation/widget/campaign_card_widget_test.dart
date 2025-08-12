// test/widgets/campaign_card_widget_test.dart

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

// Project imports:
import 'package:puvadon_jenosize/src/common/translation/translation_config.dart';
import 'package:puvadon_jenosize/src/modules/campaign_module/config/translation/campaign_i18n_key.dart';
import 'package:puvadon_jenosize/src/modules/campaign_module/data/models/campaign_list_model.dart';
import 'package:puvadon_jenosize/src/modules/campaign_module/helper/campaign_helper.dart';
import 'package:puvadon_jenosize/src/modules/campaign_module/presentation/widget/campaign_card_widget.dart';
import 'package:puvadon_jenosize/src/modules/core_widget_module/widget/image_network_widget.dart';
import '../../../../configs/bindings/init_binding_test_config.dart';

Widget _wrap(Widget child) {
  return GetMaterialApp(
    translations: TranslationsConfig(),
    home: Scaffold(body: Center(child: child)),
  );
}

void main() {
  setUp(() {
    InitBindingTestConfig().dependencies();
    Get.testMode = true;
  });

  group('CampaignCardWidget', () {
    testWidgets('renders name, subName, image, status chip, and button', (
      tester,
    ) async {
      const name = 'Summer Sale 2025';
      const subName = 'Up to 50% off all items';
      const imageUrl = 'https://example.com';
      const status = CampaignStatus.active;

      await tester.pumpWidget(
        _wrap(
          CampaignCardWidget(
            name: name,
            subName: subName,
            imageUrl: imageUrl,
            status: status,
            onJoinPressed: () {},
          ),
        ),
      );

      expect(find.text(name), findsOneWidget);
      expect(find.text(subName), findsOneWidget);

      expect(find.text(CampaignI18nKey.seeMoreButton.tr), findsOneWidget);

      expect(find.byType(ImageNetworkWidget), findsOneWidget);

      final statusText = CampaignHelper.getStatusText(status);
      expect(find.text(statusText), findsOneWidget);
    });

    testWidgets('invokes onJoinPressed when button tapped', (tester) async {
      var pressed = false;

      await tester.pumpWidget(
        _wrap(
          CampaignCardWidget(
            name: 'Name',
            subName: 'Sub',
            imageUrl: null,
            status: CampaignStatus.inactive,
            onJoinPressed: () => pressed = true,
          ),
        ),
      );

      await tester.tap(find.text(CampaignI18nKey.seeMoreButton.tr));
      await tester.pumpAndSettle();

      expect(pressed, isTrue);
    });

    testWidgets('status chip uses color from CampaignHelper', (tester) async {
      const status = CampaignStatus.completed;

      await tester.pumpWidget(
        _wrap(
          const CampaignCardWidget(
            name: 'Name',
            subName: 'Sub',
            imageUrl: null,
            status: status,
          ),
        ),
      );

      final expectedColor = CampaignHelper.getStatusColor(status);
      final statusText = CampaignHelper.getStatusText(status);

      final textWidget = tester.widget<Text>(find.text(statusText));
      expect(textWidget.style?.color, equals(expectedColor));
      expect(textWidget.style?.fontWeight, FontWeight.bold);
      expect(textWidget.style?.fontSize, 12);
    });
  });
}
