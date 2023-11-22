import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:urban_hive_seller/inventory/entity/product.dart';
import 'package:urban_hive_seller/inventory/model/customisation_model.dart';
import 'package:urban_hive_seller/inventory/model/customisation_option_model.dart';
import 'package:urban_hive_seller/inventory/model/product_model.dart';
import 'package:urban_hive_seller/inventory/repository/inventory_repository.dart';
import 'package:urban_hive_seller/utils/helpers.dart';
import 'package:xid/xid.dart';

class InventoryProvider extends ChangeNotifier {
  final InventoryRepository _inventoryRepository = InventoryRepository();
  bool isLoading = false;
  List<Product> products = [];
  Map productDetails = {};
  int customisationsCount = 0;
  int customisationOptionsCount = 0;
  List<Map> customisations = [];
  List<bool> customisationOptionsAdded = [];
  bool customisationsAdded = false;
  File? heroImage;
  List<File?> productImages = List.generate(4, (index) => null);

  Future<String> uploadImage(File file) async {
    var res = await _inventoryRepository.uploadImage(file);
    var url = '';
    res.fold(
      (l) {},
      (r) {
        url = r;
      },
    );
    notifyListeners();
    return url;
  }

  Future saveProductToDB(
      {required String productName,
      required String description,
      required int basePrice,
      required int maxQuantity}) async {
    String productId = Xid().toString();
    List<String> sampleImagesUrls = [];
    var heroImageRes = await uploadImage(heroImage!);
    await Future.forEach(productImages, (e) async {
      if (e != null) {
        var res = await uploadImage(e);
        sampleImagesUrls.add(res);
      }
    });
    List<CustomisationModel> customisationsData = [];
    customisations.forEach((e) {
      List<CustomisationOptionModel> options = [];
      if (e['customisationType'] == 2) {
        e['customisationOptions'].forEach(
          (option) {
            options.add(
              CustomisationOptionModel(
                optionId: Xid().toString(),
                optionName: option['optionName'],
                isAvailable: true,
                isPaid: option['isPaid'],
                additionalCharge:
                    option['isPaid'] == true ? option['additionalCharge'] : 0,
              ),
            );
          },
        );
      }
      customisationsData.add(
        CustomisationModel(
          customisationId: Xid().toString(),
          customisationName: e['customisationName'],
          isAvailable: true,
          customisationType: e['customisationType'],
          multipleSelect: false,
          customisationOptions: options,
        ),
      );
    });
    var productData = ProductModel(
      id: productId,
      name: productName,
      isAvailable: true,
      heroImageUrl: heroImageRes,
      sampleImages: sampleImagesUrls,
      basePrice: basePrice,
      description: description,
      providerId: '653e2dc5757ab2c77181',
      maxOrderQuantity: maxQuantity,
      ratingsCount: 0,
      rating: 0.0,
      hasCustomisations: customisationsCount == 0 ? false : true,
      customisations: customisationsData,
    );
    var res = await _inventoryRepository.saveProductToDB(productData);
    res.fold((l) {}, (r) {});
    notifyListeners();
  }

  Future<void> updateProductImage(int i) async {
    final img = await ImagePicker().pickImage(source: ImageSource.gallery);
    productImages[i] = File(img!.path);
    notifyListeners();
  }

  Future<void> updateProductHeroImage() async {
    final img = await ImagePicker().pickImage(source: ImageSource.gallery);
    heroImage = File(img!.path);
    notifyListeners();
  }

  void updateCustomisationOptionsAdded(bool val, int i) {
    customisationOptionsAdded[i] = val;
    notifyListeners();
  }

  void updateCustomisationsAdded(bool val) {
    customisationsAdded = val;
    notifyListeners();
  }

  void setCustomisationsCount(int val) {
    customisationsCount = val;
    customisations = List.generate(val, (index) => {});
    customisationOptionsAdded = List.generate(val, (index) => false);
    if (val == 0) {
      customisationsAdded = true;
    }
    notifyListeners();
  }

  void updateCustomisationName(int i, String value) {
    customisations[i]['customisationName'] = value;
    notifyListeners();
  }

  void updateCustomisationType(int i, int type) {
    customisations[i]['customisationType'] = type;
    notifyListeners();
  }

  void updateOptionName(int initialIndex, int i, String val) {
    customisations[initialIndex]['customisationOptions'][i]['optionName'] = val;
    notifyListeners();
  }

  void updateIsOptionPaid(int initialIndex, int i, bool isPaid) {
    customisations[initialIndex]['customisationOptions'][i]['isPaid'] = isPaid;
    notifyListeners();
  }

  void updateAddtionalCost(int initialIndex, int i, double amount) {
    if (customisations[initialIndex]['customisationOptions'][i]
            ['additionalCharge'] ==
        null) {
      customisations[initialIndex]['customisationOptions'][i]
          ['additionalCharge'] = 0;
    }
    customisations[initialIndex]['customisationOptions'][i]
        ['additionalCharge'] = rupeesToPaisa(amount);
    notifyListeners();
  }

  void updateCustomisationOptionsCount(int i, int val) {
    customisationOptionsCount = val;
    customisations[i]['customisationOptions'] =
        List.generate(val, (index) => <String, dynamic>{"isPaid": false});
    notifyListeners();
  }

  void updateIsLoading(bool val) {
    isLoading = val;
    notifyListeners();
  }

  Future getProducts() async {
    updateIsLoading(true);
    var res = await _inventoryRepository.getProducts();
    res.fold((l) {}, (r) {
      products = r.map((e) => e.toDomain()).toList();
    });
    updateIsLoading(false);
    notifyListeners();
  }
}
