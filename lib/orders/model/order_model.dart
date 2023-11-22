import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:urban_hive_seller/orders/entity/order.dart';
import 'package:urban_hive_seller/orders/model/order_item_model.dart';

part 'order_model.g.dart';

@JsonSerializable()
class OrderModel {
  @JsonKey(name: "\$id")
  final String docId;
  final String orderId;
  final String customerId;
  final String sellerId;
  final int orderStatus;
  final int? paymentType;
  final int? paymentMode;
  final List<OrderItemModel> items;
  final int orderedOn;
  final int totalBillAmount;
  final int platformFee;
  final int deliveryFee;
  final dynamic orderTimeline;
  final int? deliveredOn;
  final dynamic deliveredAt;
  final dynamic deliverAt;
  final String? paymentId;
  final int totalAmountPaid;
  final dynamic deliverOn;

  const OrderModel(
      {required this.docId,
      required this.orderId,
      required this.customerId,
      required this.sellerId,
      required this.orderStatus,
      required this.paymentType,
      required this.paymentMode,
      required this.items,
      required this.orderedOn,
      required this.totalBillAmount,
      required this.platformFee,
      required this.deliveryFee,
      required this.orderTimeline,
      this.deliveredOn,
      this.deliveredAt,
      required this.deliverAt,
      this.paymentId,
      required this.totalAmountPaid,
      required this.deliverOn});

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    var items = jsonDecode(json['items']);
    var orderTimeline = jsonDecode(json['orderTimeline']);
    json['items'] = items;
    json['orderTimeline'] = orderTimeline;
    return _$OrderModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$OrderModelToJson(this);

  Order toDomain() => Order(
        docId: docId,
        orderId: orderId,
        customerId: customerId,
        sellerId: sellerId,
        orderStatus: orderStatus,
        paymentId: paymentId,
        paymentMode: paymentMode,
        paymentType: paymentType,
        items: items.map((e) => e.toDomain()).toList(),
        orderedOn: orderedOn,
        totalBillAmount: totalBillAmount,
        totalAmountPaid: totalAmountPaid,
        platformFee: platformFee,
        deliveryFee: deliveryFee,
        deliverAt: deliverAt,
        deliveredAt: deliveredAt,
        deliveredOn: deliveredOn,
        orderTimeline: orderTimeline,
        deliverOn: deliverOn,
      );
}
