// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:puvadon_jenosize/src/modules/app.dart';
import 'package:puvadon_jenosize/src/modules/profile_module/config/routes/profile_routes.dart';
import 'package:puvadon_jenosize/src/modules/profile_module/presentation/view/profile_point_history_view.dart';
import 'package:puvadon_jenosize/src/modules/profile_module/presentation/view/profile_refer_friend_view.dart';
import 'package:puvadon_jenosize/src/modules/profile_module/presentation/view_model/profile_point_history_view_model.dart';
import 'package:puvadon_jenosize/src/modules/profile_module/presentation/view_model/profile_refer_friend_view_model.dart';

class ProfileModule extends Module {
  @override
  List<GetPage<Map<String, dynamic>>> get routeScreen => [
    GetPage<Map<String, dynamic>>(
      name: ProfileRoutes.referFriendRoute,
      page: () => const ProfileReferFriendView(),
      binding: ProfileBinding(),
    ),
    GetPage<Map<String, dynamic>>(
      name: ProfileRoutes.pointHistoryRoute,
      page: () => const ProfilePointHistoryView(),
      binding: ProfileBinding(),
    ),
  ];
}

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileReferFriendViewModel>(
      () => ProfileReferFriendViewModel(navigation: Get.find()),
    );
    Get.lazyPut<ProfilePointHistoryViewModel>(
      () => ProfilePointHistoryViewModel(),
    );
  }
}
