import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:urban_hive_seller/orders/entity/order_item.dart';
import 'package:urban_hive_seller/utils/app_colors.dart';
import 'package:urban_hive_seller/utils/app_text_styles.dart';

import 'order_item_details_card_widget.dart';

class OrderItemsDetailsCardWidget extends StatelessWidget {
  final List<OrderItem> orderItems;
  const OrderItemsDetailsCardWidget({super.key, required this.orderItems});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 319.w,
      padding: EdgeInsets.all(18.w),
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
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Order Details",
            style: AppTextStyles.s14(
              color: AppColor.appBlack,
              fontType: FontType.BOLD,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          const Divider(
            height: 2,
            thickness: 2,
            color: AppColor.appStrokeGrey,
          ),
          SizedBox(
            height: 10.h,
          ),
          ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, i) {
              return OrderItemDetailsCardWidget(item: orderItems[i]);
            },
            separatorBuilder: (context, i) {
              return SizedBox(
                height: 8.h,
              );
            },
            itemCount: orderItems.length,
          )
        ],
      ),
    );
  }
}
