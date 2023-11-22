// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderItemModel _$OrderItemModelFromJson(Map<String, dynamic> json) =>
    OrderItemModel(
      productId: json['productId'] as String,
      quantity: json['quantity'] as int,
      productName: json['productName'] as String,
      basePrice: json['basePrice'] as int,
      hasCustomisations: json['hasCustomisations'] as bool,
      customisationsCost: json['customisationsCost'] as int,
      customisations: (json['customisations'] as List<dynamic>?)
          ?.map((e) => CustomisationModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OrderItemModelToJson(OrderItemModel instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'quantity': instance.quantity,
      'productName': instance.productName,
      'basePrice': instance.basePrice,
      'hasCustomisations': instance.hasCustomisations,
      'customisationsCost': instance.customisationsCost,
      'customisations': instance.customisations,
    };
