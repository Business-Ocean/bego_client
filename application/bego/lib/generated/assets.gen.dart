/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class $AssetsImageGen {
  const $AssetsImageGen();

  /// File path: assets/image/bg_abstract.jpeg
  AssetGenImage get bgAbstract =>
      const AssetGenImage('assets/image/bg_abstract.jpeg');

  /// File path: assets/image/header_bg_1.jpg
  AssetGenImage get headerBg1 =>
      const AssetGenImage('assets/image/header_bg_1.jpg');

  /// File path: assets/image/header_bg_2.jpg
  AssetGenImage get headerBg2 =>
      const AssetGenImage('assets/image/header_bg_2.jpg');

  /// File path: assets/image/header_bg_3.jpg
  AssetGenImage get headerBg3 =>
      const AssetGenImage('assets/image/header_bg_3.jpg');

  /// File path: assets/image/stacked_waves.png
  AssetGenImage get stackedWaves =>
      const AssetGenImage('assets/image/stacked_waves.png');

  /// List of all assets
  List<AssetGenImage> get values =>
      [bgAbstract, headerBg1, headerBg2, headerBg3, stackedWaves];
}

class $AssetsLogoGen {
  const $AssetsLogoGen();

  /// File path: assets/logo/bego_logo.png
  AssetGenImage get begoLogo =>
      const AssetGenImage('assets/logo/bego_logo.png');

  /// List of all assets
  List<AssetGenImage> get values => [begoLogo];
}

class $AssetsSvgGen {
  const $AssetsSvgGen();

  /// File path: assets/svg/bego_icon.svg
  SvgGenImage get begoIcon => const SvgGenImage('assets/svg/bego_icon.svg');

  /// File path: assets/svg/blob_1.svg
  SvgGenImage get blob1 => const SvgGenImage('assets/svg/blob_1.svg');

  /// File path: assets/svg/blob_2.svg
  SvgGenImage get blob2 => const SvgGenImage('assets/svg/blob_2.svg');

  /// File path: assets/svg/blob_3.svg
  SvgGenImage get blob3 => const SvgGenImage('assets/svg/blob_3.svg');

  /// File path: assets/svg/business_ocean.svg
  SvgGenImage get businessOcean =>
      const SvgGenImage('assets/svg/business_ocean.svg');

  /// File path: assets/svg/google_logo.svg
  SvgGenImage get googleLogo => const SvgGenImage('assets/svg/google_logo.svg');

  /// File path: assets/svg/stacked_waves.svg
  SvgGenImage get stackedWaves =>
      const SvgGenImage('assets/svg/stacked_waves.svg');

  /// List of all assets
  List<SvgGenImage> get values =>
      [begoIcon, blob1, blob2, blob3, businessOcean, googleLogo, stackedWaves];
}

class AppAssets {
  AppAssets._();

  static const $AssetsImageGen image = $AssetsImageGen();
  static const $AssetsLogoGen logo = $AssetsLogoGen();
  static const $AssetsSvgGen svg = $AssetsSvgGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

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
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
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

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

  SvgPicture svg({
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
    SvgTheme theme = const SvgTheme(),
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      theme: theme,
      colorFilter: colorFilter,
      color: color,
      colorBlendMode: colorBlendMode,
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
