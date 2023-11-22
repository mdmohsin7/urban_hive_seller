/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsHomeGen {
  const $AssetsHomeGen();

  $AssetsHomeIconsGen get icons => const $AssetsHomeIconsGen();

  /// File path: assets/home/no_orders.svg
  String get noOrders => 'assets/home/no_orders.svg';

  /// List of all assets
  List<String> get values => [noOrders];
}

class $AssetsStoreGen {
  const $AssetsStoreGen();

  $AssetsStoreIconsGen get icons => const $AssetsStoreIconsGen();
}

class $AssetsHomeIconsGen {
  const $AssetsHomeIconsGen();

  /// File path: assets/home/icons/ic_message.svg
  String get icMessage => 'assets/home/icons/ic_message.svg';

  /// File path: assets/home/icons/ic_message_filled.svg
  String get icMessageFilled => 'assets/home/icons/ic_message_filled.svg';

  /// File path: assets/home/icons/inventory.svg
  String get inventory => 'assets/home/icons/inventory.svg';

  /// File path: assets/home/icons/inventory_filled.svg
  String get inventoryFilled => 'assets/home/icons/inventory_filled.svg';

  /// File path: assets/home/icons/orders.svg
  String get orders => 'assets/home/icons/orders.svg';

  /// File path: assets/home/icons/orders_filled.svg
  String get ordersFilled => 'assets/home/icons/orders_filled.svg';

  /// File path: assets/home/icons/store.svg
  String get store => 'assets/home/icons/store.svg';

  /// File path: assets/home/icons/store_filled.svg
  String get storeFilled => 'assets/home/icons/store_filled.svg';

  /// List of all assets
  List<String> get values => [
        icMessage,
        icMessageFilled,
        inventory,
        inventoryFilled,
        orders,
        ordersFilled,
        store,
        storeFilled
      ];
}

class $AssetsStoreIconsGen {
  const $AssetsStoreIconsGen();

  /// File path: assets/store/icons/ic_edit_outlined.svg
  String get icEditOutlined => 'assets/store/icons/ic_edit_outlined.svg';

  /// File path: assets/store/icons/ic_instagram_outlined.svg
  String get icInstagramOutlined =>
      'assets/store/icons/ic_instagram_outlined.svg';

  /// List of all assets
  List<String> get values => [icEditOutlined, icInstagramOutlined];
}

class Assets {
  Assets._();

  static const AssetGenImage cover = AssetGenImage('assets/cover.png');
  static const AssetGenImage d2 = AssetGenImage('assets/d2.png');
  static const AssetGenImage d3 = AssetGenImage('assets/d3.png');
  static const AssetGenImage download = AssetGenImage('assets/download.jpeg');
  static const AssetGenImage female = AssetGenImage('assets/female.png');
  static const $AssetsHomeGen home = $AssetsHomeGen();
  static const AssetGenImage logo = AssetGenImage('assets/logo.png');
  static const AssetGenImage male = AssetGenImage('assets/male.png');
  static const $AssetsStoreGen store = $AssetsStoreGen();
  static const AssetGenImage upload = AssetGenImage('assets/upload.png');

  /// List of all assets
  List<AssetGenImage> get values =>
      [cover, d2, d3, download, female, logo, male, upload];
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
