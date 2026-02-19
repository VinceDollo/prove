// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart' as _svg;
import 'package:vector_graphics/vector_graphics.dart' as _vg;

class $LibGen {
  const $LibGen();

  /// Directory path: lib/core
  $LibCoreGen get core => const $LibCoreGen();
}

class $LibCoreGen {
  const $LibCoreGen();

  /// Directory path: lib/core/assets
  $LibCoreAssetsGen get assets => const $LibCoreAssetsGen();
}

class $LibCoreAssetsGen {
  const $LibCoreAssetsGen();

  /// File path: lib/core/assets/assetClasses.dart
  String get assetClasses => 'lib/core/assets/assetClasses.dart';

  /// Directory path: lib/core/assets/fonts
  $LibCoreAssetsFontsGen get fonts => const $LibCoreAssetsFontsGen();

  /// Directory path: lib/core/assets/images
  $LibCoreAssetsImagesGen get images => const $LibCoreAssetsImagesGen();

  /// List of all assets
  List<String> get values => [assetClasses];
}

class $LibCoreAssetsFontsGen {
  const $LibCoreAssetsFontsGen();

  /// File path: lib/core/assets/fonts/InriaSerif-Bold.ttf
  String get inriaSerifBold => 'lib/core/assets/fonts/InriaSerif-Bold.ttf';

  /// File path: lib/core/assets/fonts/InriaSerif-BoldItalic.ttf
  String get inriaSerifBoldItalic =>
      'lib/core/assets/fonts/InriaSerif-BoldItalic.ttf';

  /// File path: lib/core/assets/fonts/InriaSerif-Italic.ttf
  String get inriaSerifItalic => 'lib/core/assets/fonts/InriaSerif-Italic.ttf';

  /// File path: lib/core/assets/fonts/InriaSerif-Light.ttf
  String get inriaSerifLight => 'lib/core/assets/fonts/InriaSerif-Light.ttf';

  /// File path: lib/core/assets/fonts/InriaSerif-LightItalic.ttf
  String get inriaSerifLightItalic =>
      'lib/core/assets/fonts/InriaSerif-LightItalic.ttf';

  /// File path: lib/core/assets/fonts/InriaSerif-Regular.ttf
  String get inriaSerifRegular =>
      'lib/core/assets/fonts/InriaSerif-Regular.ttf';

  /// List of all assets
  List<String> get values => [
        inriaSerifBold,
        inriaSerifBoldItalic,
        inriaSerifItalic,
        inriaSerifLight,
        inriaSerifLightItalic,
        inriaSerifRegular
      ];
}

class $LibCoreAssetsImagesGen {
  const $LibCoreAssetsImagesGen();

  /// File path: lib/core/assets/images/heart_outline.svg
  SvgGenImage get heartOutline =>
      const SvgGenImage('lib/core/assets/images/heart_outline.svg');

  /// File path: lib/core/assets/images/heart_solid.svg
  SvgGenImage get heartSolid =>
      const SvgGenImage('lib/core/assets/images/heart_solid.svg');

  /// File path: lib/core/assets/images/home_outline.svg
  SvgGenImage get homeOutline =>
      const SvgGenImage('lib/core/assets/images/home_outline.svg');

  /// File path: lib/core/assets/images/home_solid.svg
  SvgGenImage get homeSolid =>
      const SvgGenImage('lib/core/assets/images/home_solid.svg');

  /// File path: lib/core/assets/images/setting_outline.svg
  SvgGenImage get settingOutline =>
      const SvgGenImage('lib/core/assets/images/setting_outline.svg');

  /// File path: lib/core/assets/images/setting_solid.svg
  SvgGenImage get settingSolid =>
      const SvgGenImage('lib/core/assets/images/setting_solid.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
        heartOutline,
        heartSolid,
        homeOutline,
        homeSolid,
        settingOutline,
        settingSolid
      ];
}

class Assets {
  const Assets._();

  static const $LibGen lib = $LibGen();
}

class SvgGenImage {
  const SvgGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  }) : _isVecFormat = false;

  const SvgGenImage.vec(
    this._assetName, {
    this.size,
    this.flavors = const {},
  }) : _isVecFormat = true;

  final String _assetName;
  final Size? size;
  final Set<String> flavors;
  final bool _isVecFormat;

  _svg.SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    _svg.SvgTheme? theme,
    _svg.ColorMapper? colorMapper,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    final _svg.BytesLoader loader;
    if (_isVecFormat) {
      loader = _vg.AssetBytesLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
      );
    } else {
      loader = _svg.SvgAssetLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
        theme: theme,
        colorMapper: colorMapper,
      );
    }
    return _svg.SvgPicture(
      loader,
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      colorFilter: colorFilter ??
          (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
