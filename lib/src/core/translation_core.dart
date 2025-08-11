// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:puvadon_jenosize/src/common/constants/constants.dart';
import 'package:puvadon_jenosize/src/common/enums/global_enums.dart';
import '../common/themes/text_theme.dart';
import 'secure_storage_core.dart';

abstract class Translation {
  Future<void> changeLocale({required LanguageCode languageCode});

  Future<LanguageCode> currentLanguage();
}

class TranslationImpl implements Translation {
  final SecureStorage _secureStorage = Get.find<SecureStorage>();

  @override
  Future<void> changeLocale({required LanguageCode languageCode}) async {
    Locale? locale;

    if (languageCode == LanguageCode.th) {
      locale = const Locale('th', 'TH');
    } else {
      locale = const Locale('en', 'EN');
    }

    // Reset all text themes
    TextThemeCustom.instance.reset();

    if (!Get.testMode) {
      Get.updateLocale(locale);
    }

    await _secureStorage.write(
      key: languageCodeKey,
      value: languageCode.toString(),
    );
  }

  @override
  Future<LanguageCode> currentLanguage() async {
    final String? languageCode = await _secureStorage.read(
      key: languageCodeKey,
    );

    return LanguageCode.values.firstWhere(
      (LanguageCode e) => e.toString() == languageCode,
      orElse: () => LanguageCode.th,
    );
  }
}
