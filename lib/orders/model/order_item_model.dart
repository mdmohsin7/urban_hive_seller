import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:urban_hive_seller/orders/entity/order_item.dart';

import 'customisation_model.dart';

part 'order_item_model.g.dart';

@JsonSerializable()
class OrderItemModel {
  final String productId;
  final int quantity;
  final String productName;
  final int basePrice;
  final bool hasCustomisations;
  final int customisationsCost;
  final List<CustomisationModel>? customisations;

  OrderItemModel(
      {required this.productId,
      required this.quantity,
      required this.productName,
      required this.basePrice,
      required this.hasCustomisations,
      required this.customisationsCost,
      this.customisations});

  factory OrderItemModel.fromJson(Map<String, dynamic> json) {
    return _$OrderItemModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$OrderItemModelToJson(this);

  OrderItem toDomain() => OrderItem(
        productId: productId,
        quantity: quantity,
        productName: productName,
        basePrice: basePrice,
        hasCustomisations: hasCustomisations,
        customisationsCost: customisationsCost,
        customisations: customisations?.map((e) => e.toDomain()).toList(),
      );
}
