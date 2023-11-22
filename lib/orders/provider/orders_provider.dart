import 'package:flutter/material.dart';
import 'package:urban_hive_seller/orders/entity/order.dart';
import 'package:urban_hive_seller/orders/repository/orders_repository.dart';

class OrdersProvider extends ChangeNotifier {
  final OrdersRepository _ordersRepository = OrdersRepository();
  bool isLoading = false;
  List<Order> orders = [];
  List<Order> filteredOrders = [];
  int selectedOrderStatus = 0;

  void updateIsLoading(bool val) {
    isLoading = val;
    notifyListeners();
  }

  Future getOrdersList() async {
    updateIsLoading(true);
    var res = await _ordersRepository.getOrdersList();
    res.fold((l) => '', (r) {
      orders = r.map((e) => e.toDomain()).toList();
      orders.removeWhere((e) => e.sellerId != "6533c022c0741897dc8a");
    });
    updateIsLoading(false);
    notifyListeners();
  }

  void filterOrdersList(int val) {
    selectedOrderStatus = val;
    filteredOrders = List.from(orders.where((e) => e.orderStatus == val));
    notifyListeners();
  }

  Future acceptOrder(String docId) async {
    updateIsLoading(true);
    await _ordersRepository.acceptOrder(docId);
    updateIsLoading(false);
    notifyListeners();
  }
}
