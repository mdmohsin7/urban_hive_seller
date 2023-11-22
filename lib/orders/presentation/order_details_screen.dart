import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:urban_hive_seller/orders/entity/order.dart';
import 'package:urban_hive_seller/orders/presentation/widgets/delivery_details_card_widget.dart';
import 'package:urban_hive_seller/orders/provider/orders_provider.dart';
import 'package:urban_hive_seller/utils/app_colors.dart';
import 'package:urban_hive_seller/utils/app_text_styles.dart';

import 'widgets/customer_details_card_widget.dart';
import 'widgets/order_bill_details_card_widget.dart';
import 'widgets/order_items_details_card_widget.dart';

class OrderDetailsScreen extends StatelessWidget {
  final Order orderDetails;
  const OrderDetailsScreen({super.key, required this.orderDetails});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: AppColor.appBlack),
        title: Text(
          "Order Details",
          style: AppTextStyles.s14(
            color: AppColor.appBlack,
            fontType: FontType.REGULAR,
          ),
        ),
        elevation: 0,
        backgroundColor: AppColor.appWhite,
      ),
      backgroundColor: AppColor.appWhite,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CustomerDetailsCardWidget(),
              SizedBox(
                height: 28.h,
              ),
              DeliveryDetailsCardWidget(),
              SizedBox(
                height: 28.h,
              ),
              OrderItemsDetailsCardWidget(
                orderItems: orderDetails.items,
              ),
              SizedBox(
                height: 28.h,
              ),
              OrderBillDetailsCardWidget(
                orderDetails: orderDetails,
              ),
              SizedBox(
                height: 28.h,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: orderDetails.orderStatus == 0
          ? Padding(
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
                        "Can’t Fulfil?",
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
                        await Provider.of<OrdersProvider>(context,
                                listen: false)
                            .acceptOrder(orderDetails.docId);
                        await Provider.of<OrdersProvider>(context,
                                listen: false)
                            .getOrdersList();
                        Navigator.pop(context);
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
                        "Accept",
                        style: AppTextStyles.s14(
                          color: AppColor.appWhite,
                          fontType: FontType.BOLD,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          : Padding(
              padding: EdgeInsets.only(
                  bottom: 12.0.h, top: 12.h, left: 24.w, right: 24.w),
              child: ElevatedButton(
                onPressed: () async {},
                style: ButtonStyle(
                  shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  backgroundColor:
                      const MaterialStatePropertyAll(AppColor.appPrimaryColor),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    "Mark Ready for Pick Up",
                    style: AppTextStyles.s14(
                      color: AppColor.appWhite,
                      fontType: FontType.BOLD,
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
