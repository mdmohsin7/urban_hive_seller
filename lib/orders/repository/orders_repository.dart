import 'package:appwrite/appwrite.dart';
import 'package:dartz/dartz.dart';
import 'package:urban_hive_seller/core/failure.dart';
import 'package:urban_hive_seller/orders/model/order_model.dart';
import 'package:urban_hive_seller/service_locator.dart';
import 'package:urban_hive_seller/utils/constants.dart';

class OrdersRepository {
  final databases = Databases(sl<Client>());

  Future<Either<Failure, List<OrderModel>>> getOrdersList() async {
    try {
      var res = await databases.listDocuments(
          databaseId: databaseId, collectionId: 'Orders');
      return right(
          res.documents.map((e) => OrderModel.fromJson(e.data)).toList());
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  Future<Either<Failure, bool>> acceptOrder(String documentId) async {
    try {
      var res = await databases.updateDocument(
          databaseId: databaseId,
          collectionId: 'Orders',
          documentId: documentId,
          data: {
            "orderStatus": 1,
          });
      return right(true);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
