// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:cached_network_image/cached_network_image.dart';

// Project imports:
import 'package:puvadon_jenosize/common/assets/assets.gen.dart';
import 'package:puvadon_jenosize/src/common/themes/color_theme.dart';

class ImageNetworkWidget extends StatelessWidget {
  const ImageNetworkWidget({
    super.key,
    required String imageUrl,
    required double height,
    required double width,
  }) : _imageUrl = imageUrl,
       _height = height,
       _width = width;

  final String _imageUrl;
  final double _height;
  final double _width;

  double get height => _height;
  double get width => _width;

  @override
  Widget build(BuildContext context) {
    return _buildLayout();
  }

  Widget _buildLayout() {
    return CachedNetworkImage(
      imageUrl: _imageUrl,
      imageBuilder:
          (BuildContext context, ImageProvider<Object> imageProvider) =>
              Container(
                width: _width,
                height: _height,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
      placeholder:
          (BuildContext context, String url) => SizedBox(
            width: _width,
            height: _height,
            child: Center(
              child: Image.asset(
                Assets.icons.spinnerIcon.path,
                fit: BoxFit.contain,
                color: ColorsTheme.instance.primary60p,
                width: 100,
                height: 100,
              ),
            ),
          ),
      errorWidget:
          (BuildContext context, String url, Object error) => SizedBox(
            width: _width,
            height: _height,
            child: Image.asset(Assets.icons.defaultIcon.path),
          ),
    );
  }
}
