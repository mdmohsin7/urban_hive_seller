import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:urban_hive_seller/inventory/screens/add_customisation_options_screen.dart';
import 'package:urban_hive_seller/inventory/screens/widgets/options_list_card_widget.dart';
import 'package:urban_hive_seller/inventory/provider/inventory_provider.dart';
import 'package:urban_hive_seller/utils/app_colors.dart';
import 'package:urban_hive_seller/utils/app_text_styles.dart';

class AddCustomisationsScreen extends StatefulWidget {
  const AddCustomisationsScreen({super.key});

  @override
  State<AddCustomisationsScreen> createState() =>
      _AddCustomisationsScreenState();
}

class _AddCustomisationsScreenState extends State<AddCustomisationsScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Consumer<InventoryProvider>(
        builder: (BuildContext context, inventoryState, Widget? child) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Customisations",
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
        backgroundColor: AppColor.appWhite,
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (ctx, i) {
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
                              Text(
                                "Customization #${i + 1}",
                                style: AppTextStyles.s16(
                                    color: AppColor.appBlack,
                                    fontType: FontType.REGULAR),
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              const Divider(),
                              SizedBox(
                                height: 8.h,
                              ),
                              Text(
                                "Customisation Name",
                                style: AppTextStyles.s14(
                                  color: AppColor.appBlack,
                                  fontType: FontType.REGULAR,
                                ),
                              ),
                              SizedBox(
                                height: 4.h,
                              ),
                              TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Please enter a valid name";
                                  } else {
                                    return null;
                                  }
                                },
                                initialValue: inventoryState.customisations[i]
                                    ['customisationName'],
                                autofocus: false,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.w),
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                    vertical: 6.h,
                                    horizontal: 10.w,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.w),
                                    borderSide: const BorderSide(
                                      color: AppColor.appBlack,
                                    ),
                                  ),
                                  hintText: 'Give your customisation a name',
                                  hintStyle: AppTextStyles.s14(
                                    color: AppColor.appGrey,
                                    fontType: FontType.REGULAR,
                                  ),
                                ),
                                onChanged: (value) {
                                  inventoryState.updateCustomisationName(
                                      i, value);
                                },
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              Text(
                                "Customisation Type",
                                style: AppTextStyles.s14(
                                  color: AppColor.appBlack,
                                  fontType: FontType.REGULAR,
                                ),
                              ),
                              SizedBox(
                                height: 4.h,
                              ),
                              DropdownButtonFormField(
                                validator: (value) {
                                  if (value == null) {
                                    return "Please select a type";
                                  } else {
                                    return null;
                                  }
                                },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.w),
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                    vertical: 6.h,
                                    horizontal: 10.w,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.w),
                                    borderSide: const BorderSide(
                                      color: AppColor.appBlack,
                                    ),
                                  ),
                                ),
                                onChanged: (type) {
                                  if (type != null) {
                                    inventoryState.updateCustomisationType(
                                      i,
                                      type as int,
                                    );
                                    if (type == 1) {
                                      inventoryState
                                          .updateCustomisationOptionsAdded(
                                        true,
                                        i,
                                      );
                                    }
                                  }
                                },
                                value: inventoryState.customisations[i]
                                    ['customisationType'],
                                items: const [
                                  DropdownMenuItem(
                                    value: 1,
                                    child: Text("Let users enter some text"),
                                  ),
                                  DropdownMenuItem(
                                    value: 2,
                                    child: Text(
                                        "Let users select from list of options"),
                                  ),
                                ],
                              ),
                              inventoryState.customisations[i]
                                          ['customisationType'] !=
                                      2
                                  ? Container()
                                  : Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 20.h,
                                        ),
                                        Text(
                                          "Number of Customisation Options",
                                          style: AppTextStyles.s14(
                                            color: AppColor.appBlack,
                                            fontType: FontType.REGULAR,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 4.h,
                                        ),
                                        DropdownButtonFormField(
                                          validator: (value) {
                                            if (value == null) {
                                              return "Please select the options count";
                                            } else {
                                              return null;
                                            }
                                          },
                                          decoration: InputDecoration(
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                              vertical: 6.h,
                                              horizontal: 10.w,
                                            ),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.w),
                                            ),
                                            focusedBorder:
                                                const OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: AppColor.appGrey,
                                              ),
                                            ),
                                          ),
                                          onChanged: (v) {
                                            if (v != null) {
                                              inventoryState
                                                  .updateCustomisationOptionsCount(
                                                      i, v);
                                            }
                                          },
                                          value: inventoryState
                                                      .customisationOptionsCount ==
                                                  0
                                              ? null
                                              : inventoryState
                                                  .customisationOptionsCount,
                                          items: const [
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
                                          ],
                                        ),
                                        SizedBox(
                                          height: 20.h,
                                        ),
                                        inventoryState
                                                .customisationOptionsAdded[i]
                                            ? OptionsListCardWidget(
                                                options: inventoryState
                                                        .customisations[i]
                                                    ['customisationOptions'],
                                                onPressed: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) {
                                                        return AddCustomisationOptionsScreen(
                                                          index: i,
                                                        );
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
                                                        return AddCustomisationOptionsScreen(
                                                          index: i,
                                                        );
                                                      },
                                                    ),
                                                  );
                                                },
                                                child: DottedBorder(
                                                  borderType: BorderType.RRect,
                                                  dashPattern: const [5, 3],
                                                  radius:
                                                      const Radius.circular(12),
                                                  padding:
                                                      const EdgeInsets.all(8),
                                                  strokeWidth: 1,
                                                  color: AppColor.appGrey,
                                                  child: SizedBox(
                                                    height: 65.h,
                                                    width: double.infinity,
                                                    child: Center(
                                                      child: Text(
                                                        "Add options for user to select from",
                                                        style:
                                                            AppTextStyles.s12(
                                                          color:
                                                              AppColor.appGrey,
                                                          fontType: FontType
                                                              .SEMI_BOLD,
                                                        ),
                                                      ),
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
                    },
                    separatorBuilder: (ctx, i) {
                      return SizedBox(
                        height: 32.h,
                      );
                    },
                    itemCount: inventoryState.customisationsCount,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  SizedBox(
                    height: 100.h,
                  ),
                ],
              ),
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
                    side: const BorderSide(width: 1.0, color: AppColor.appGrey),
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
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      if (inventoryState.customisationOptionsAdded
                          .where((e) => e == false)
                          .isEmpty) {
                        inventoryState.updateCustomisationsAdded(true);
                        Navigator.pop(context);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                                "Please add options for user to select from before saving"),
                          ),
                        );
                      }
                    } else {}
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
      );
    });
  }
}
