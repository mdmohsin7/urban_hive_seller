import 'dart:convert';
import 'dart:io';

import 'package:appwrite/appwrite.dart';
import 'package:dartz/dartz.dart';

import 'package:urban_hive_seller/core/failure.dart';
import 'package:urban_hive_seller/inventory/model/product_model.dart';
import 'package:urban_hive_seller/service_locator.dart';
import 'package:urban_hive_seller/utils/constants.dart';

class InventoryRepository {
  final databases = Databases(sl<Client>());
  final storage = Storage(sl<Client>());

  Future<Either<Failure, List<ProductModel>>> getProducts() async {
    try {
      var res = await databases.listDocuments(
        databaseId: databaseId,
        collectionId: 'Products',
        queries: [
          Query.equal('providerId', '6533c022c0741897dc8a'),
        ],
      );
      return right(
          res.documents.map((e) => ProductModel.fromJson(e.data)).toList());
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  Future<Either<Failure, String>> uploadImage(File file) async {
    try {
      final fileRes = await storage.createFile(
        bucketId: 'products',
        fileId: ID.unique(),
        file: InputFile.fromPath(path: file.path),
      );
      return right(
          "https://appwrite.snapseva.com/v1/storage/buckets/products/files/${fileRes.$id}/view?project=snapseva");
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  Future<Either<Failure, bool>> saveProductToDB(ProductModel data) async {
    try {
      var dataJson = data.toJson();
      dataJson['customisations'] = jsonEncode(dataJson['customisaions']);
      var res = await databases.createDocument(
        databaseId: databaseId,
        collectionId: 'Products',
        documentId: ID.unique(),
        data: dataJson,
      );
      return right(true);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
