import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:urban_hive_seller/inventory/provider/inventory_provider.dart';
import 'package:urban_hive_seller/utils/app_colors.dart';
import 'package:urban_hive_seller/utils/app_text_styles.dart';
import 'package:urban_hive_seller/utils/helpers.dart';

class AddCustomisationOptionsScreen extends StatefulWidget {
  final int index;
  const AddCustomisationOptionsScreen({super.key, required this.index});

  @override
  State<AddCustomisationOptionsScreen> createState() =>
      _AddCustomisationOptionsScreenState();
}

class _AddCustomisationOptionsScreenState
    extends State<AddCustomisationOptionsScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  List<int> a = [2, 3, 4];
  @override
  Widget build(BuildContext context) {
    return Consumer<InventoryProvider>(
        builder: (BuildContext context, inventoryState, Widget? child) {
      return Form(
        key: _formKey,
        child: Scaffold(
          backgroundColor: AppColor.appWhite,
          appBar: AppBar(
            title: const Text(
              "Customisation Options",
              style: TextStyle(color: AppColor.appBlack),
            ),
            elevation: 0,
            backgroundColor: Colors.white,
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 30.h,
                ),
                ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: inventoryState.customisationOptionsCount,
                  separatorBuilder: (context, i) {
                    return SizedBox(
                      height: 20.h,
                    );
                  },
                  itemBuilder: (BuildContext context, i) {
                    return Container(
                      margin: EdgeInsets.only(left: 18.w, right: 18.w),
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
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 16.h,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Option #${i + 1}",
                                style: AppTextStyles.s16(
                                    color: AppColor.appBlack,
                                    fontType: FontType.REGULAR)),
                            SizedBox(
                              height: 8.h,
                            ),
                            const Divider(),
                            SizedBox(
                              height: 8.h,
                            ),
                            Text(
                              "Option Name",
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
                              initialValue:
                                  inventoryState.customisations[widget.index]
                                      ['customisationOptions'][i]['optionName'],
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.w),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.w),
                                  borderSide:
                                      const BorderSide(color: AppColor.appGrey),
                                ),
                                hintText:
                                    "Give it a name for users to identify",
                                hintStyle: AppTextStyles.s14(
                                  color: AppColor.appGrey,
                                  fontType: FontType.REGULAR,
                                ),
                              ),
                              onChanged: (value) {
                                inventoryState.updateOptionName(
                                    widget.index, i, value);
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please provide a valid name";
                                } else {
                                  return null;
                                }
                              },
                            ),
                            SizedBox(
                              height: 14.h,
                            ),
                            Row(
                              children: [
                                Switch(
                                  activeColor: AppColor.appPrimaryColor,
                                  value: inventoryState
                                          .customisations[widget.index]
                                      ['customisationOptions'][i]['isPaid'],
                                  onChanged: (value) {
                                    inventoryState.updateIsOptionPaid(
                                      widget.index,
                                      i,
                                      value,
                                    );
                                  },
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Text(
                                  "This option is paid",
                                  style: AppTextStyles.s14(
                                    color: AppColor.appBlack,
                                    fontType: FontType.REGULAR,
                                  ),
                                ),
                              ],
                            ),
                            inventoryState.customisations[widget.index]
                                    ['customisationOptions'][i]['isPaid']
                                ? Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Additional Amount",
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
                                          initialValue: inventoryState
                                              .customisations[widget.index]
                                                  ['customisationOptions'][i]
                                                  ['additionalCharge']
                                              .toString(),
                                          keyboardType: TextInputType.number,
                                          onChanged: (value) {
                                            inventoryState.updateAddtionalCost(
                                              widget.index,
                                              i,
                                              convertMoneyStringToDouble(value),
                                            );
                                          },
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty ||
                                                value == '0') {
                                              return "Please provide a valid amount";
                                            } else {
                                              return null;
                                            }
                                          },
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.w),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.w),
                                              borderSide: const BorderSide(
                                                color: AppColor.appGrey,
                                              ),
                                            ),
                                            hintText: '100',
                                            hintStyle: AppTextStyles.s14(
                                              color: AppColor.appGrey,
                                              fontType: FontType.REGULAR,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                : Container(),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 30.h,
                ),
              ],
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
                      side:
                          const BorderSide(width: 1.0, color: AppColor.appGrey),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Cancel",
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
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        inventoryState.updateCustomisationOptionsAdded(
                            true, widget.index);
                        Navigator.pop(context);
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
                      "Save",
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
    });
  }
}
