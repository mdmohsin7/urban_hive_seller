import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:urban_hive_seller/inventory/screens/inventory_screen.dart';
import 'package:urban_hive_seller/utils/app_colors.dart';
import 'package:urban_hive_seller/utils/app_text_styles.dart';
import 'package:textfield_tags/textfield_tags.dart';

class EditProductScreen extends StatefulWidget {
  const EditProductScreen({super.key});

  @override
  State<EditProductScreen> createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  @override
  Widget build(BuildContext context) {
    final maxLines = 5;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        scrolledUnderElevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const InventoryScreen()));
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 30,
            )),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 30.h,
                ),
                Center(child: Image.asset("assets/d2.png")),
                SizedBox(
                  height: 30.h,
                ),
                Text("Product ID",
                    style: AppTextStyles.s14(
                        color: AppColor.appBlack, fontType: FontType.REGULAR)),
                TextField(
                  autofocus: false,
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: '01234',
                      hintStyle: AppTextStyles.s14(
                          color: AppColor.appBlack,
                          fontType: FontType.REGULAR)),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Text("Name",
                    style: AppTextStyles.s14(
                        color: AppColor.appBlack, fontType: FontType.REGULAR)),
                TextField(
                  autofocus: false,
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: 'Canvas Painting',
                      hintStyle: AppTextStyles.s14(
                          color: AppColor.appBlack,
                          fontType: FontType.REGULAR)),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Text("Description",
                    style: AppTextStyles.s14(
                        color: AppColor.appBlack, fontType: FontType.REGULAR)),
                Container(
                  height: maxLines * 24,
                  child: TextField(
                    maxLines: maxLines,
                    autofocus: false,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText:
                          "Some description of the product. This is EditProductScreen mode.",
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Text("Price",
                    style: AppTextStyles.s14(
                        color: AppColor.appBlack, fontType: FontType.REGULAR)),
                TextField(
                  autofocus: false,
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: '₹2500',
                      hintStyle: AppTextStyles.s14(
                          color: AppColor.appBlack,
                          fontType: FontType.REGULAR)),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Text("Quantity per Order",
                    style: AppTextStyles.s14(
                        color: AppColor.appBlack, fontType: FontType.REGULAR)),
                TextField(
                  autofocus: false,
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: 'Max quantity a person can order at a time',
                      hintStyle: AppTextStyles.s14(
                          color: AppColor.appBlack,
                          fontType: FontType.REGULAR)),
                ),
                const Text("Tags"),
                const TextField(
                  autofocus: false,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "#Painting",
                      hintStyle: TextStyle(
                        backgroundColor: Colors.amber,
                      )),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.amber),
                          child: const Padding(
                            padding: EdgeInsets.all(15.0),
                            child: Text("Discard Changes"),
                          ),
                        )),
                    InkWell(
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.amber),
                          child: const Padding(
                            padding: EdgeInsets.all(15.0),
                            child: Text("Save Changes"),
                          ),
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
