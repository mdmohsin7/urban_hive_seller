// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderModel _$OrderModelFromJson(Map<String, dynamic> json) => OrderModel(
      docId: json[r'$id'] as String,
      orderId: json['orderId'] as String,
      customerId: json['customerId'] as String,
      sellerId: json['sellerId'] as String,
      orderStatus: json['orderStatus'] as int,
      paymentType: json['paymentType'] as int?,
      paymentMode: json['paymentMode'] as int?,
      items: (json['items'] as List<dynamic>)
          .map((e) => OrderItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      orderedOn: json['orderedOn'] as int,
      totalBillAmount: json['totalBillAmount'] as int,
      platformFee: json['platformFee'] as int,
      deliveryFee: json['deliveryFee'] as int,
      orderTimeline: json['orderTimeline'],
      deliveredOn: json['deliveredOn'] as int?,
      deliveredAt: json['deliveredAt'],
      deliverAt: json['deliverAt'],
      paymentId: json['paymentId'] as String?,
      totalAmountPaid: json['totalAmountPaid'] as int,
      deliverOn: json['deliverOn'],
    );

Map<String, dynamic> _$OrderModelToJson(OrderModel instance) =>
    <String, dynamic>{
      r'$id': instance.docId,
      'orderId': instance.orderId,
      'customerId': instance.customerId,
      'sellerId': instance.sellerId,
      'orderStatus': instance.orderStatus,
      'paymentType': instance.paymentType,
      'paymentMode': instance.paymentMode,
      'items': instance.items,
      'orderedOn': instance.orderedOn,
      'totalBillAmount': instance.totalBillAmount,
      'platformFee': instance.platformFee,
      'deliveryFee': instance.deliveryFee,
      'orderTimeline': instance.orderTimeline,
      'deliveredOn': instance.deliveredOn,
      'deliveredAt': instance.deliveredAt,
      'deliverAt': instance.deliverAt,
      'paymentId': instance.paymentId,
      'totalAmountPaid': instance.totalAmountPaid,
      'deliverOn': instance.deliverOn,
    };
