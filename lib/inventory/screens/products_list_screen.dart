import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:urban_hive_seller/inventory/provider/inventory_provider.dart';
import 'package:urban_hive_seller/inventory/screens/add_product_screen.dart';
import 'package:urban_hive_seller/utils/app_colors.dart';
import 'package:urban_hive_seller/utils/app_text_styles.dart';
import 'package:urban_hive_seller/utils/helpers.dart';

class ProductsListScreen extends StatefulWidget {
  const ProductsListScreen({super.key});

  @override
  State<ProductsListScreen> createState() => _ProductsListScreenState();
}

class _ProductsListScreenState extends State<ProductsListScreen> {
  var value = 1;
  bool v = false;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Provider.of<InventoryProvider>(context, listen: false)
          .getProducts();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.appWhite,
      body: Consumer<InventoryProvider>(
          builder: (context, inventoryState, child) {
        return ListView.separated(
            shrinkWrap: true,
            itemCount: inventoryState.products.length,
            separatorBuilder: (context, index) {
              return SizedBox(
                height: 20.h,
              );
            },
            itemBuilder: (BuildContext context, int i) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 1,
                        spreadRadius: 2,
                        color: AppColor.appStrokeGrey,
                        blurStyle: BlurStyle.inner,
                      )
                    ],
                  ),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 8.h,
                      ),
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: 8.w,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            width: 102.w,
                            height: 102.h,
                            child: CachedNetworkImage(
                              fit: BoxFit.cover,
                              imageUrl: inventoryState.products[i].heroImageUrl,
                              imageBuilder: (context, imageProvider) =>
                                  Container(
                                width: 102.w,
                                height: 102.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                      image: imageProvider, fit: BoxFit.cover),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 18.h,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                width: 170.w,
                                child: Text(
                                  inventoryState.products[i].name,
                                  style: AppTextStyles.s14(
                                    color: Colors.black,
                                    fontType: FontType.MEDIUM,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 6.h,
                              ),
                              SizedBox(
                                width: 200.w,
                                height: 45.h,
                                child: Text(
                                  inventoryState.products[i].description,
                                  style: AppTextStyles.s12(
                                    color: AppColor.appGrey,
                                    fontType: FontType.REGULAR,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 6.h,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "₹ ${paisaToRupees(inventoryState.products[i].basePrice)}",
                                    style: AppTextStyles.s14(
                                      color: AppColor.appBlack,
                                      fontType: FontType.SEMI_BOLD,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              "Delete",
                              style: AppTextStyles.s14(
                                color: Colors.red,
                                fontType: FontType.SEMI_BOLD,
                              ),
                            ),
                          ),
                          Text(
                            "|",
                            style: TextStyle(
                              color: Colors.grey[300],
                            ),
                          ),
                          Row(
                            children: [
                              Switch(
                                activeColor: AppColor.appPrimaryColor,
                                value: inventoryState.products[i].isAvailable,
                                onChanged: (value) {
                                  // setState(() {
                                  //   a[index] == 1 ? a[index] = 0 : a[index] = 1;
                                  // });
                                },
                              ),
                              SizedBox(
                                width: 14.w,
                              ),
                              Text(
                                "In Stock",
                                style: AppTextStyles.s14(
                                  color: Colors.black,
                                  fontType: FontType.SEMI_BOLD,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            "|",
                            style: TextStyle(color: Colors.grey[300]),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                            child: TextButton(
                              onPressed: () {},
                              child: Text(
                                "Edit",
                                style: AppTextStyles.s14(
                                  color: AppColor.appPrimaryColor,
                                  fontType: FontType.SEMI_BOLD,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            });
      }),
      floatingActionButton: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddProductScreen(),
            ),
          );
        },
        style: ButtonStyle(
          elevation: const MaterialStatePropertyAll(4),
          shadowColor: const MaterialStatePropertyAll(AppColor.appPrimaryColor),
          backgroundColor: const MaterialStatePropertyAll(
            AppColor.appPrimaryColor,
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
              side: const BorderSide(color: AppColor.appPrimaryColor),
            ),
          ),
        ),
        child: Text(
          "Add Product",
          style: AppTextStyles.s14(
            color: AppColor.appWhite,
            fontType: FontType.SEMI_BOLD,
          ),
        ),
      ),
    );
  }
}
