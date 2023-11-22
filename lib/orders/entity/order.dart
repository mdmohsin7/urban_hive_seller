import 'package:equatable/equatable.dart';

import 'order_item.dart';

class Order extends Equatable {
  final String docId;
  final String orderId;
  final String customerId;
  final String sellerId;
  final int orderStatus;
  final int? paymentType;
  final int? paymentMode;
  final List<OrderItem> items;
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

  const Order(
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

  @override
  List<Object?> get props => [
        docId,
        orderId,
        customerId,
        sellerId,
        orderStatus,
        paymentMode,
        paymentId,
        paymentMode,
        items,
        orderedOn,
        totalBillAmount,
        totalAmountPaid,
        deliverAt,
        deliveredAt,
        deliveredOn,
        deliveryFee,
        orderTimeline,
        deliverOn
      ];
}
