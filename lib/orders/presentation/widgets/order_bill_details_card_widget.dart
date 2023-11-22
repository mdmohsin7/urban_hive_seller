import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:urban_hive_seller/orders/entity/order.dart';
import 'package:urban_hive_seller/utils/app_colors.dart';
import 'package:urban_hive_seller/utils/app_text_styles.dart';
import 'package:urban_hive_seller/utils/helpers.dart';

class OrderBillDetailsCardWidget extends StatelessWidget {
  final Order orderDetails;
  const OrderBillDetailsCardWidget({super.key, required this.orderDetails});

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Bill Details",
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
          Row(
            children: [
              Text(
                "Items Total",
                style: AppTextStyles.s12(
                  color: AppColor.appBlack,
                  fontType: FontType.MEDIUM,
                ),
              ),
              Spacer(),
              Text(
                "₹ ${paisaToRupees(orderDetails.totalBillAmount)}",
                style: AppTextStyles.s12(
                  color: AppColor.appBlack,
                  fontType: FontType.MEDIUM,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 6.h,
          ),
          Row(
            children: [
              Text(
                "Delivery Fee",
                style: AppTextStyles.s12(
                  color: AppColor.appBlack,
                  fontType: FontType.MEDIUM,
                ),
              ),
              Spacer(),
              Text(
                "₹ ${orderDetails.deliveryFee}",
                style: AppTextStyles.s12(
                  color: AppColor.appBlack,
                  fontType: FontType.MEDIUM,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 6.h,
          ),
          Row(
            children: [
              Text(
                "Platform Fee",
                style: AppTextStyles.s12(
                  color: AppColor.appBlack,
                  fontType: FontType.MEDIUM,
                ),
              ),
              Spacer(),
              Text(
                "₹ ${orderDetails.platformFee}",
                style: AppTextStyles.s12(
                  color: AppColor.appBlack,
                  fontType: FontType.MEDIUM,
                ),
              ),
            ],
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
          Row(
            children: [
              Text(
                "To be paid by customer",
                style: AppTextStyles.s12(
                  color: AppColor.appBlack,
                  fontType: FontType.MEDIUM,
                ),
              ),
              Spacer(),
              Text(
                "₹ ${paisaToRupees(orderDetails.platformFee + orderDetails.totalBillAmount + orderDetails.deliveryFee)}",
                style: AppTextStyles.s12(
                  color: AppColor.appBlack,
                  fontType: FontType.MEDIUM,
                ),
              ),
            ],
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
          Row(
            children: [
              Text(
                "You will receive",
                style: AppTextStyles.s12(
                  color: AppColor.appBlack,
                  fontType: FontType.MEDIUM,
                ),
              ),
              Spacer(),
              Text(
                "₹ ${paisaToRupees(orderDetails.totalBillAmount) - ((5 * paisaToRupees(orderDetails.totalBillAmount)) / 100)}",
                style: AppTextStyles.s12(
                  color: AppColor.appBlack,
                  fontType: FontType.MEDIUM,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
