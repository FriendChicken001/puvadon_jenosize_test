// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:puvadon_jenosize/src/modules/app.dart';
import 'package:puvadon_jenosize/src/modules/home_module/config/home_routes.dart';
import 'package:puvadon_jenosize/src/modules/home_module/data/data_sources/remote/home_remote_data_source.dart';
import 'package:puvadon_jenosize/src/modules/home_module/data/data_sources/remote/home_remote_data_source_impl.dart';
import 'package:puvadon_jenosize/src/modules/home_module/data/repositories_impl/home_repositories_impl.dart';
import 'package:puvadon_jenosize/src/modules/home_module/domain/repositories/home_repositories.dart';
import 'package:puvadon_jenosize/src/modules/home_module/domain/usecases/home_usecase.dart';
import 'package:puvadon_jenosize/src/modules/home_module/domain/usecases/home_usecase_impl.dart';
import 'package:puvadon_jenosize/src/modules/home_module/presentation/view/home_view.dart';
import 'package:puvadon_jenosize/src/modules/home_module/presentation/view_model/home_view_model.dart';

class HomeModule extends Module {
  @override
  List<GetPage<Map<String, dynamic>>> get routeScreen => [
    GetPage(
      name: HomeRoutes.root,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
  ];
}

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    // data sources
    Get.lazyPut<HomeRemoteDataSource>(
      () => HomeRemoteDataSourceImpl(dio: Get.find()),
    );
    // repositories
    Get.lazyPut<HomeRepositories>(
      () => HomeRepositoriesImpl(remoteDataSource: Get.find()),
    );
    // use cases
    Get.lazyPut<HomeUseCase>(() => HomeUseCaseImpl(repositories: Get.find()));
    // view model
    Get.lazyPut<HomeViewModel>(
      () => HomeViewModel(homeRepositories: Get.find()),
    );
  }
}
