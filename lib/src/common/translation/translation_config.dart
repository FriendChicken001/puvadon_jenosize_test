// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:puvadon_jenosize/src/core/errors/translation/error_i18n_en.dart';
import 'package:puvadon_jenosize/src/core/errors/translation/error_i18n_th.dart';
import 'package:puvadon_jenosize/src/modules/home_module/presentation/config/translation/home_i18n_en.dart';
import 'package:puvadon_jenosize/src/modules/home_module/presentation/config/translation/home_i18n_th.dart';

class TranslationsConfig extends Translations {
  @override
  Map<String, Map<String, String>> get keys => <String, Map<String, String>>{
    'th_TH': <String, String>{...errorI18nTH, ...homeI18nTH},
    'en_EN': <String, String>{...errorI18nEN, ...homeI18nEN},
  };
}
