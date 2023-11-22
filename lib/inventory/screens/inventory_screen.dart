import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:urban_hive_seller/inventory/screens/edit_product_screen.dart';
import 'package:urban_hive_seller/utils/app_colors.dart';
import 'package:urban_hive_seller/utils/app_text_styles.dart';

class InventoryScreen extends StatefulWidget {
  const InventoryScreen({super.key});

  @override
  State<InventoryScreen> createState() => _InventoryScreenState();
}

class _InventoryScreenState extends State<InventoryScreen> {
  @override
  Widget build(BuildContext context) {
    var a;
    var value;
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          scrolledUnderElevation: 0,
          backgroundColor: Colors.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "OUTLET ONLINE",
                    style: AppTextStyles.s10(
                        color: AppColor.appBlack, fontType: FontType.REGULAR),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 180.w,
                        height: 40.h,
                        child: DropdownButtonFormField(
                            // decoration: InputDecoration(
                            //     border: OutlineInputBorder(
                            //       borderRadius: BorderRadius.circular(12),
                            //     ),
                            //     focusedBorder: OutlineInputBorder(
                            //         borderSide: BorderSide(color: AppColor.appGrey))),
                            onChanged: (v) {},
                            value: value,
                            items: const [
                              DropdownMenuItem(
                                value: 1,
                                child: Text("Accepting Orders"),
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
                      )
                    ],
                  )
                ],
              ),
              Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(5)),
                width: 50,
                height: 50,
                child: Image.asset("assets/d3.png"),
              )
            ],
          ),
        ),
        body: ListView.builder(
            shrinkWrap: true,
            itemCount: a.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  width: double.infinity,
                  child: Column(children: <Widget>[
                    SizedBox(
                      height: 50.h,
                    ),
                    Row(
                      children: <Widget>[
                        Image.asset(
                          "assets/d2.png",
                          width: 102.w,
                        ),
                        SizedBox(
                          width: 20.h,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Canvas Paintings",
                              style: AppTextStyles.s16(
                                  color: Colors.black,
                                  fontType: FontType.REGULAR),
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            SizedBox(
                              width: 190.w,
                              child: Text(
                                "Mecca and Madina canvases with floral-gold leaf mandala borders",
                                style: AppTextStyles.s10(
                                    color: AppColor.appGrey,
                                    fontType: FontType.REGULAR),
                              ),
                            ),
                            SizedBox(
                              height: 30.h,
                            ),
                            Text(
                              "₹ 2500",
                              style: AppTextStyles.s16(
                                  color: AppColor.appBlack,
                                  fontType: FontType.REGULAR),
                            )
                          ],
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 12.h, 0, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                            child: Image.asset(
                              "assets/d2.png",
                              width: 150.w,
                            ),
                          ),
                          SizedBox(
                            width: 20.h,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                width: 170.w,
                                child: Text(
                                  "Canvas Painting",
                                  style: AppTextStyles.s20(
                                      color: Colors.black,
                                      fontType: FontType.REGULAR),
                                ),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              Container(
                                width: 170.w,
                                child: Text(
                                  "Mecca and Madina canvases with floral-gold leaf mandala borders",
                                  style: AppTextStyles.s14(
                                      color: AppColor.appGrey,
                                      fontType: FontType.REGULAR),
                                ),
                              ),
                              SizedBox(
                                height: 30.h,
                              ),
                              Row(
                                children: [
                                  Text("₹ 2500",
                                      style: AppTextStyles.s16(
                                          color: AppColor.appBlack,
                                          fontType: FontType.REGULAR))
                                ],
                              ),
                              Text("In Stock",
                                  style: AppTextStyles.s16(
                                      color: Colors.black,
                                      fontType: FontType.REGULAR)),
                              SizedBox(
                                width: 60.w,
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  "Edit",
                                  style: AppTextStyles.s16(
                                      color: AppColor.appPrimaryColor,
                                      fontType: FontType.REGULAR),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    TextButton(
                                        onPressed: () {},
                                        child: Text(
                                          "Delete",
                                          style: AppTextStyles.s16(
                                              color: Colors.red,
                                              fontType: FontType.REGULAR),
                                        )),
                                    SizedBox(
                                      width: 20.w,
                                    ),
                                    Text("|",
                                        style:
                                            TextStyle(color: Colors.grey[300])),
                                    SizedBox(
                                      width: 20.w,
                                    ),
                                    Switch(
                                        value: a[index] == 1 ? true : false,
                                        onChanged: (value) {
                                          setState(() {
                                            a[index] == 1
                                                ? a[index] = 0
                                                : a[index] = 1;
                                          });
                                        }),
                                    SizedBox(
                                      width: 18.w,
                                    ),
                                    Text("In Stock",
                                        style: AppTextStyles.s16(
                                            color: Colors.black,
                                            fontType: FontType.REGULAR)),
                                    SizedBox(
                                      width: 16.w,
                                    ),
                                    Text(
                                      "|",
                                      style: TextStyle(color: Colors.grey[300]),
                                    ),
                                    SizedBox(
                                      width: 20.w,
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(0, 0, 5, 0),
                                      child: TextButton(
                                          onPressed: () {},
                                          child: Text("Edit",
                                              style: AppTextStyles.s16(
                                                  color:
                                                      AppColor.appPrimaryColor,
                                                  fontType: FontType.REGULAR))),
                                    )
                                  ]))
                        ],
                      ),
                    )
                  ]));
            }),
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => EditProductScreen()));
            },
            child: Container(
              padding: EdgeInsets.all(13),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColor.appPrimaryColor),
              child: Text(
                "Add Product",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ));
  }
}
