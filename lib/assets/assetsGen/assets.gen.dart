// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/widgets.dart';

class $LibGen {
  const $LibGen();

  /// Directory path: lib/assets
  $LibAssetsGen get assets => const $LibAssetsGen();
}

class $LibAssetsGen {
  const $LibAssetsGen();

  /// File path: lib/assets/assetClasses.dart
  String get assetClasses => 'lib/assets/assetClasses.dart';

  /// Directory path: lib/assets/fonts
  $LibAssetsFontsGen get fonts => const $LibAssetsFontsGen();

  /// Directory path: lib/assets/images
  $LibAssetsImagesGen get images => const $LibAssetsImagesGen();

  /// List of all assets
  List<String> get values => [assetClasses];
}

class $LibAssetsFontsGen {
  const $LibAssetsFontsGen();

  /// File path: lib/assets/fonts/Oxygen-Bold.ttf
  String get oxygenBold => 'lib/assets/fonts/Oxygen-Bold.ttf';

  /// File path: lib/assets/fonts/Oxygen-Light.ttf
  String get oxygenLight => 'lib/assets/fonts/Oxygen-Light.ttf';

  /// File path: lib/assets/fonts/Oxygen-Regular.ttf
  String get oxygenRegular => 'lib/assets/fonts/Oxygen-Regular.ttf';

  /// File path: lib/assets/fonts/icomoon.ttf
  String get icomoon => 'lib/assets/fonts/icomoon.ttf';

  /// List of all assets
  List<String> get values => [oxygenBold, oxygenLight, oxygenRegular, icomoon];
}

class $LibAssetsImagesGen {
  const $LibAssetsImagesGen();

  /// File path: lib/assets/images/background.png
  AssetGenImage get background =>
      const AssetGenImage('lib/assets/images/background.png');

  /// File path: lib/assets/images/ic_home.svg
  String get icHome => 'lib/assets/images/ic_home.svg';

  /// File path: lib/assets/images/ic_home_unselected.svg
  String get icHomeUnselected => 'lib/assets/images/ic_home_unselected.svg';

  /// File path: lib/assets/images/icon_ui_arrow_back.svg
  String get iconUiArrowBack => 'lib/assets/images/icon_ui_arrow_back.svg';

  /// File path: lib/assets/images/icon_ui_warning.svg
  String get iconUiWarning => 'lib/assets/images/icon_ui_warning.svg';

  /// File path: lib/assets/images/icons_calendar.svg
  String get iconsCalendar => 'lib/assets/images/icons_calendar.svg';

  /// File path: lib/assets/images/icons_eye.svg
  String get iconsEye => 'lib/assets/images/icons_eye.svg';

  /// File path: lib/assets/images/icons_eye_disabled.svg
  String get iconsEyeDisabled => 'lib/assets/images/icons_eye_disabled.svg';

  /// List of all assets
  List<dynamic> get values => [
        background,
        icHome,
        icHomeUnselected,
        iconUiArrowBack,
        iconUiWarning,
        iconsCalendar,
        iconsEye,
        iconsEyeDisabled
      ];
}

class Assets {
  const Assets._();

  static const $LibGen lib = $LibGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
    this.animation,
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;
  final AssetGenImageAnimation? animation;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class AssetGenImageAnimation {
  const AssetGenImageAnimation({
    required this.isAnimation,
    required this.duration,
    required this.frames,
  });

  final bool isAnimation;
  final Duration duration;
  final int frames;
}
