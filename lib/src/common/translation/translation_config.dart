// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:puvadon_jenosize/src/core/errors/translation/error_i18n_en.dart';
import 'package:puvadon_jenosize/src/core/errors/translation/error_i18n_th.dart';
import 'package:puvadon_jenosize/src/modules/campaign_module/config/translation/campaign_i18n_en.dart';
import 'package:puvadon_jenosize/src/modules/campaign_module/config/translation/campaign_i18n_th.dart';

class TranslationsConfig extends Translations {
  @override
  Map<String, Map<String, String>> get keys => <String, Map<String, String>>{
    'th_TH': <String, String>{...errorI18nTH, ...campaignI18nTH},
    'en_EN': <String, String>{...errorI18nEN, ...campaignI18nEN},
  };
}
