// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:puvadon_jenosize/src/modules/app.dart';

class CoreWidgetModule extends Module {
  @override
  List<GetPage<Map<String, dynamic>>> get routeScreen =>
      <GetPage<Map<String, dynamic>>>[];
}

class CoreWidgetModuleBinding extends Bindings {
  @override
  void dependencies() {}
}
