import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:urban_hive_seller/inventory/screens/add_customisation_screen.dart';
import 'package:urban_hive_seller/inventory/provider/inventory_provider.dart';
import 'package:urban_hive_seller/inventory/screens/widgets/customisations_list_card_widget.dart';
import 'package:urban_hive_seller/utils/app_colors.dart';
import 'package:urban_hive_seller/utils/app_text_styles.dart';
import 'package:textfield_tags/textfield_tags.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  double _distanceToField = 2.0;
  late TextfieldTagsController _controller;
  late TextEditingController _productNameController;
  late TextEditingController _descriptionController;
  late TextEditingController _priceController;
  late TextEditingController _maxQuantityController;
  final GlobalKey<FormState> _key = GlobalKey();
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _distanceToField = MediaQuery.of(context).size.width;
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _productNameController.dispose();
    _descriptionController.dispose();
    _priceController.dispose();
    _maxQuantityController.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller = TextfieldTagsController();
    _productNameController = TextEditingController();
    _descriptionController = TextEditingController();
    _priceController = TextEditingController();
    _maxQuantityController = TextEditingController();
  }

  final maxLines = 5;

  var value = 1;

  @override
  Widget build(BuildContext context) {
    return Consumer<InventoryProvider>(
      builder: (context, inventoryState, child) {
        return Form(
          key: _key,
          child: Scaffold(
            appBar: AppBar(
              title: Container(
                alignment: Alignment.bottomRight,
                child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Preview",
                      style: TextStyle(color: AppColor.appPrimaryColor),
                    )),
              ),
              elevation: 0,
              backgroundColor: AppColor.appWhite,
              scrolledUnderElevation: 0,
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                    size: 30,
                  )),
            ),
            backgroundColor: AppColor.appWhite,
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Center(
                      child: InkWell(
                        onTap: () async {
                          await inventoryState.updateProductHeroImage();
                        },
                        child: inventoryState.heroImage == null
                            ? Image.asset("assets/cover.png")
                            : Image.file(
                                inventoryState.heroImage!,
                                width: 100.w,
                                height: 100.h,
                              ),
                      ),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(width: 0.3),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Product Images",
                              style: AppTextStyles.s14(
                                color: AppColor.appDarkGrey,
                                fontType: FontType.SEMI_BOLD,
                              ),
                            ),
                            SizedBox(
                              height: 4.h,
                            ),
                            Text(
                              "Upload atleast 2 product images",
                              style: AppTextStyles.s10(
                                color: AppColor.appDarkGrey,
                                fontType: FontType.REGULAR,
                              ),
                            ),
                            SizedBox(
                              height: 12.h,
                            ),
                            SizedBox(
                              height: 70.h,
                              child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemBuilder: (ctx, i) {
                                  return InkWell(
                                    onTap: () {
                                      inventoryState.updateProductImage(i);
                                    },
                                    child:
                                        inventoryState.productImages[i] == null
                                            ? Image.asset(
                                                "assets/upload.png",
                                                height: 75.h,
                                                width: 75.h,
                                              )
                                            : Image.file(
                                                inventoryState.productImages[i]
                                                    as File,
                                                width: 70.w,
                                                height: 70.h,
                                              ),
                                  );
                                },
                                separatorBuilder: (ctx, _) {
                                  return SizedBox(
                                    width: 3.w,
                                  );
                                },
                                itemCount: inventoryState.productImages.length,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      "Name",
                      style: AppTextStyles.s14(
                        color: AppColor.appBlack,
                        fontType: FontType.REGULAR,
                      ),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    TextFormField(
                      autofocus: false,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Provide a name for your product";
                        } else {
                          return null;
                        }
                      },
                      controller: _productNameController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        hintText: 'Product Name',
                        hintStyle: AppTextStyles.s14(
                          color: AppColor.appBlack,
                          fontType: FontType.REGULAR,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 22.h,
                    ),
                    Text(
                      "Description",
                      style: AppTextStyles.s14(
                        color: AppColor.appBlack,
                        fontType: FontType.REGULAR,
                      ),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    SizedBox(
                      height: maxLines * 24,
                      child: TextFormField(
                        controller: _descriptionController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Provide a description for your product";
                          } else {
                            return null;
                          }
                        },
                        maxLines: maxLines,
                        autofocus: false,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8)),
                          hintText: "Some description of the product.",
                          hintStyle: AppTextStyles.s14(
                            color: AppColor.appBlack,
                            fontType: FontType.REGULAR,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 22.h,
                    ),
                    Text(
                      "Base Price (in Rupees)",
                      style: AppTextStyles.s14(
                          color: AppColor.appBlack, fontType: FontType.REGULAR),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    TextFormField(
                      controller: _priceController,
                      autofocus: false,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Provide a base price for your product";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8)),
                        hintText: '2500',
                        hintStyle: AppTextStyles.s14(
                          color: AppColor.appBlack,
                          fontType: FontType.REGULAR,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 22.h,
                    ),
                    Text(
                      "Quantity per Order",
                      style: AppTextStyles.s14(
                        color: AppColor.appBlack,
                        fontType: FontType.REGULAR,
                      ),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    TextFormField(
                      autofocus: false,
                      controller: _maxQuantityController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Provide a max quantity for your product";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        hintText: 'Max quantity a person can order at a time',
                        hintStyle: AppTextStyles.s14(
                          color: AppColor.appBlack,
                          fontType: FontType.REGULAR,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 22.h,
                    ),
                    Text(
                      "Tags",
                      style: AppTextStyles.s14(
                          color: AppColor.appBlack, fontType: FontType.REGULAR),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    TextFieldTags(
                      textfieldTagsController: _controller,
                      textSeparators: const [' ', ','],
                      letterCase: LetterCase.normal,
                      validator: (String tag) {
                        if (_controller.getTags!.contains(tag)) {
                          return 'you already entered that';
                        } else {
                          return null;
                        }
                      },
                      inputfieldBuilder:
                          (context, tec, fn, error, onChanged, onSubmitted) {
                        return ((context, sc, tags, onTagDelete) {
                          return Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: TextField(
                              controller: tec,
                              focusNode: fn,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: const BorderSide(
                                    color: Color.fromARGB(255, 74, 137, 92),
                                    width: 3.0,
                                  ),
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                    width: 0,
                                  ),
                                ),
                                helperStyle: const TextStyle(
                                  color: Color.fromARGB(255, 74, 137, 92),
                                ),
                                hintText:
                                    _controller.hasTags ? '' : "Enter tag...",
                                hintStyle: AppTextStyles.s14(
                                    color: AppColor.appBlack,
                                    fontType: FontType.REGULAR),
                                errorText: error,
                                prefixIconConstraints: BoxConstraints(
                                    maxWidth: _distanceToField * 0.74),
                                prefixIcon: tags.isNotEmpty
                                    ? SingleChildScrollView(
                                        controller: sc,
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                            children: tags.map((String tag) {
                                          return Container(
                                            decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(20.0),
                                              ),
                                              color: AppColor.appPrimaryColor,
                                            ),
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 5.0),
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10.0,
                                                vertical: 5.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                InkWell(
                                                  child: Text(
                                                    '#$tag',
                                                    style: const TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                  onTap: () {
                                                    print("$tag selected");
                                                  },
                                                ),
                                                const SizedBox(width: 4.0),
                                                InkWell(
                                                  child: const Icon(
                                                    Icons.cancel,
                                                    size: 14.0,
                                                    color: Color.fromARGB(
                                                        255, 233, 233, 233),
                                                  ),
                                                  onTap: () {
                                                    onTagDelete(tag);
                                                  },
                                                )
                                              ],
                                            ),
                                          );
                                        }).toList()),
                                      )
                                    : null,
                              ),
                              onChanged: onChanged,
                              onSubmitted: onSubmitted,
                            ),
                          );
                        });
                      },
                    ),
                    SizedBox(
                      height: 22.h,
                    ),
                    Text(
                      "Number of Customizations",
                      style: AppTextStyles.s14(
                        color: AppColor.appBlack,
                        fontType: FontType.REGULAR,
                      ),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    DropdownButtonFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                        ),
                        onChanged: (v) {
                          if (v != null) {
                            inventoryState.setCustomisationsCount(v);
                          }
                        },
                        value: inventoryState.customisationsCount,
                        items: const [
                          DropdownMenuItem(
                            value: 0,
                            child: Text("0"),
                          ),
                          DropdownMenuItem(
                            value: 1,
                            child: Text("1"),
                          ),
                          DropdownMenuItem(
                            value: 2,
                            child: Text("2"),
                          ),
                          DropdownMenuItem(
                            value: 3,
                            child: Text("3"),
                          )
                        ]),
                    SizedBox(
                      height: 30.h,
                    ),
                    inventoryState.customisationsCount == 0
                        ? Container()
                        : inventoryState.customisationsAdded
                            ? CustomisationsListCardWidget(
                                customisations: inventoryState.customisations,
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return const AddCustomisationsScreen();
                                      },
                                    ),
                                  );
                                },
                              )
                            : InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return const AddCustomisationsScreen();
                                      },
                                    ),
                                  );
                                },
                                child: DottedBorder(
                                  borderType: BorderType.RRect,
                                  dashPattern: const [5, 3],
                                  radius: const Radius.circular(12),
                                  padding: const EdgeInsets.all(8),
                                  strokeWidth: 1,
                                  color: AppColor.appGrey,
                                  child: SizedBox(
                                    height: 80.h,
                                    width: double.infinity,
                                    child: const Center(
                                      child: Text("Add Customizations"),
                                    ),
                                  ),
                                ),
                              ),
                    SizedBox(
                      height: 40.h,
                    ),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: Padding(
              padding: EdgeInsets.only(bottom: 18.0.h, top: 18.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 139.w,
                    height: 44.h,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        side: const BorderSide(
                            width: 1.0, color: AppColor.appGrey),
                      ),
                      onPressed: () {},
                      child: Text(
                        "Discard",
                        style: AppTextStyles.s14(
                          color: AppColor.appGrey,
                          fontType: FontType.BOLD,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 30.w,
                  ),
                  Container(
                    height: 44.h,
                    width: 139.w,
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                        color: AppColor.appPrimaryColor.withOpacity(0.2),
                        spreadRadius: 4,
                        blurRadius: 10,
                        offset: const Offset(0, 3),
                      )
                    ]),
                    child: ElevatedButton(
                      onPressed: () async {
                        if (_key.currentState!.validate() &&
                            inventoryState.heroImage != null &&
                            inventoryState.customisationsAdded) {
                          if (inventoryState.productImages
                                  .where((e) => e == null)
                                  .length <=
                              2) {
                            await inventoryState.saveProductToDB(
                              productName: _productNameController.text,
                              description: _descriptionController.text,
                              basePrice: int.parse(_priceController.text),
                              maxQuantity:
                                  int.parse(_maxQuantityController.text),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  "upload atleast 2 product images before saving the product",
                                ),
                              ),
                            );
                          }
                        } else {
                          if (!inventoryState.customisationsAdded) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  "Please add customisations before saving the product",
                                ),
                              ),
                            );
                          } else if (inventoryState.heroImage == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  "Please add an image before saving the product",
                                ),
                              ),
                            );
                          }
                        }
                      },
                      style: ButtonStyle(
                        shape: MaterialStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        backgroundColor: const MaterialStatePropertyAll(
                            AppColor.appPrimaryColor),
                      ),
                      child: Text(
                        "Add Product",
                        style: AppTextStyles.s14(
                          color: AppColor.appWhite,
                          fontType: FontType.BOLD,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
