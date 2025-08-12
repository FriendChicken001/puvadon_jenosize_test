// Package imports:
import 'package:get/get.dart';

// Project imports:
import '../../domain/entities/history_point_entities.dart';

class ProfilePointHistoryViewModel extends GetxController {
  final items =
      [
        HistoryPointEntities(title: 'First Point', point: 10),
        HistoryPointEntities(title: 'Second Point', point: -5),
        HistoryPointEntities(title: 'Third Point', point: 20),
        HistoryPointEntities(title: 'Fourth Point', point: -15),
        HistoryPointEntities(title: 'Fifth Point', point: 30),
        HistoryPointEntities(title: 'Sixth Point', point: -10),
        HistoryPointEntities(title: 'Seventh Point', point: 25),
        HistoryPointEntities(title: 'Eighth Point', point: -20),
        HistoryPointEntities(title: 'Ninth Point', point: 15),
        HistoryPointEntities(title: 'Tenth Point', point: -5),
      ].obs;
}
