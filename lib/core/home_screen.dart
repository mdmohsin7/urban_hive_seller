import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:urban_hive_seller/chat/messages_list_screen.dart';
import 'package:urban_hive_seller/core/core_provider.dart';
import 'package:urban_hive_seller/gen/assets.gen.dart';
import 'package:urban_hive_seller/inventory/screens/products_list_screen.dart';
import 'package:urban_hive_seller/orders/presentation/orders_list_screen.dart';
import 'package:urban_hive_seller/store/store_details_screen.dart';
import 'package:urban_hive_seller/utils/app_colors.dart';
import 'package:urban_hive_seller/utils/app_text_styles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CoreProvider>(builder: (context, coreState, child) {
      return Scaffold(
        backgroundColor: AppColor.appBackgroundColor,
        appBar: AppBar(
          elevation: 0,
          scrolledUnderElevation: 0,
          backgroundColor: AppColor.appWhite,
          title: Padding(
            padding: EdgeInsets.only(top: 8.0.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      width: 165.w,
                      child: DropdownButtonFormField(
                        decoration: InputDecoration(
                          label: Text("OUTLET STATUS"),
                          labelStyle: TextStyle(color: Colors.grey),
                        ),
                        padding: EdgeInsets.zero,
                        onChanged: (v) {},
                        value: 1,
                        items: const [
                          DropdownMenuItem(
                            value: 1,
                            child: Text("Accepting Orders"),
                          ),
                          DropdownMenuItem(
                            value: 2,
                            child: Text("Not Accepting Orders"),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: AppColor.appPrimaryColor)),
                  width: 40.w,
                  height: 40.w,
                  child: CachedNetworkImage(
                    imageUrl:
                        "https://firebasestorage.googleapis.com/v0/b/snapseva-consumer.appspot.com/o/SC01_providersProfiles%2Fdonut-gonuts-profile.png?alt=media&token=1d191f8f-663f-4937-b962-ca58d9d85b7d",
                    imageBuilder: (context, imageProvider) => Container(
                      width: 40.w,
                      height: 40.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          image: DecorationImage(image: imageProvider),
                          border: Border.all(color: AppColor.appPrimaryColor)),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 16.0.h),
          child: IndexedStack(
            index: coreState.homeIndex,
            children: [
              OrdersListScreen(),
              ProductsListScreen(),
              MessagesListScreen(),
              StoreDetailsScreen(),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          height: 82.h,
          decoration: const BoxDecoration(
            color: AppColor.appWhite,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            boxShadow: [
              BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 1),
            ],
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            child: BottomNavigationBar(
              onTap: (value) {
                coreState.updateHomeIndex(value);
              },
              currentIndex: coreState.homeIndex,
              selectedItemColor: AppColor.appPrimaryColor,
              elevation: 5,
              showSelectedLabels: true,
              backgroundColor: const Color(0xFFFFFFFF),
              selectedLabelStyle: AppTextStyles.s10(
                  color: AppColor.appPrimaryColor, fontType: FontType.REGULAR),
              items: [
                BottomNavigationBarItem(
                  backgroundColor: const Color(0xFFFFFFFF),
                  icon: coreState.homeIndex == 0
                      ? SvgPicture.asset(
                          Assets.home.icons.ordersFilled,
                        )
                      : SvgPicture.asset(
                          Assets.home.icons.orders,
                        ),
                  label: "Orders",
                ),
                BottomNavigationBarItem(
                    backgroundColor: const Color(0xFFFFFFFF),
                    icon: coreState.homeIndex == 1
                        ? SvgPicture.asset(Assets.home.icons.inventoryFilled)
                        : SvgPicture.asset(Assets.home.icons.inventory),
                    label: "Inventory"),
                BottomNavigationBarItem(
                    backgroundColor: const Color(0xFFFFFFFF),
                    icon: coreState.homeIndex == 2
                        ? SvgPicture.asset(Assets.home.icons.icMessageFilled)
                        : SvgPicture.asset(Assets.home.icons.icMessage),
                    label: "Messages"),
                BottomNavigationBarItem(
                    backgroundColor: const Color(0xFFFFFFFF),
                    icon: coreState.homeIndex == 3
                        ? SvgPicture.asset(Assets.home.icons.storeFilled)
                        : SvgPicture.asset(Assets.home.icons.store),
                    label: "Store"),
              ],
            ),
          ),
        ),
      );
    });
  }
}
