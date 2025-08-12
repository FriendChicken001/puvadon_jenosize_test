// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:puvadon_jenosize/common/assets/assets.gen.dart';
import 'package:puvadon_jenosize/src/common/themes/color_theme.dart';
import 'package:puvadon_jenosize/src/common/themes/text_theme.dart';
import 'package:puvadon_jenosize/src/core/navigations/navigation_core.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  AppBarWidget({
    super.key,
    required String? title,
    TextStyle? titleStyle,
    bool? centerTitle,
    Color? backgroundColor,
    bool? showLeading,
    bool? showBottomLine,
    List<Widget>? actions,
    Function()? onTapLeading,
  }) : _title = title ?? '',
       _titleStyle =
           titleStyle ??
           TextThemeCustom.instance.heading3.copyWith(
             color: ColorsTheme.instance.natural,
           ),
       _centerTitle = centerTitle ?? true,
       _backgroundColor = backgroundColor ?? ColorsTheme.instance.white,
       _showLeading = showLeading ?? true,
       _showBottomLine = showBottomLine ?? true,
       _onTapLeading = onTapLeading,
       _actions = actions;

  //controller
  final Navigation _navigation = Get.find<Navigation>();

  //properties
  final String _title;
  final TextStyle _titleStyle;
  final bool _centerTitle;
  final Color _backgroundColor;
  final bool _showLeading;
  final bool _showBottomLine;
  final List<Widget>? _actions;
  final Function()? _onTapLeading;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return _buildLayout();
  }

  Widget _buildLayout() {
    return AppBar(
      scrolledUnderElevation: 0.0,
      backgroundColor: _backgroundColor,
      title: Text(_title, style: _titleStyle),
      centerTitle: _centerTitle,
      titleSpacing: 0,
      leadingWidth: 40,
      leading: _buildLeading(),
      bottom: _buildBottom(),
      actions: _buildActions(),
    );
  }

  List<Widget> _buildActions() {
    return _actions?.isNotEmpty == true ? _actions! : [];
  }

  PreferredSizeWidget? _buildBottom() {
    return _showBottomLine
        ? PreferredSize(
          preferredSize: const Size.fromHeight(4.0),
          child: Container(color: ColorsTheme.instance.primary20p, height: 1),
        )
        : null;
  }

  Widget _buildLeading() {
    return _showLeading
        ? Padding(
          padding: const EdgeInsets.only(left: 15),
          child: GestureDetector(
            onTap: _onTapLeading ?? () => _navigation.pop(),
            child: Container(
              width: 60,
              color: ColorsTheme.instance.transparent,
              alignment: Alignment.center,
              child: Image.asset(
                Assets.icons.arrowBackIcon.path,
                fit: BoxFit.fill,
                width: 10,
                height: 17,
              ),
            ),
          ),
        )
        : const SizedBox.shrink();
  }
}
