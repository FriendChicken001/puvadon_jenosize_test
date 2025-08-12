// Package imports:
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

// Project imports:
import 'package:puvadon_jenosize/src/core/navigations/navigation_core.dart';
import 'package:puvadon_jenosize/src/modules/profile_module/config/routes/profile_routes.dart';

class ProfileReferFriendViewModel extends GetxController {
  ProfileReferFriendViewModel({required this.navigation});

  final Navigation navigation;
  RxString get memberCode => 'Jeno1234'.obs;

  void sharedMemberCode() {
    Share.share(memberCode.value, subject: 'My Member Code');
  }

  void navigateToHistory() {
    navigation.push(ProfileRoutes.pointHistoryRoute);
  }
}
