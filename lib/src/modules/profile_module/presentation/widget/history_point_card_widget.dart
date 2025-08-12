// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:puvadon_jenosize/src/common/themes/text_theme.dart';
import 'package:puvadon_jenosize/src/modules/profile_module/domain/entities/history_point_entities.dart';

class HistoryPointCardWidget extends StatelessWidget {
  const HistoryPointCardWidget({super.key, required this.item});
  final HistoryPointEntities item;

  @override
  Widget build(BuildContext context) {
    final isPositive = item.point >= 0;
    final sign = isPositive ? '+' : '';

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: CircleAvatar(
          child: Icon(isPositive ? Icons.trending_up : Icons.trending_down),
        ),
        title: Text(item.title, style: TextThemeCustom.instance.heading4),
        trailing: Text(
          '$sign${item.point} pts',
          style: TextThemeCustom.instance.paragraph3,
        ),
        // subtitle: Text('Optional subtitle/date here'),
      ),
    );
  }
}
