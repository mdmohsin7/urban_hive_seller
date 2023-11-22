import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:urban_hive_seller/orders/entity/order.dart';
import 'package:urban_hive_seller/orders/presentation/order_details_screen.dart';
import 'package:urban_hive_seller/utils/app_colors.dart';
import 'package:urban_hive_seller/utils/app_text_styles.dart';
import 'package:urban_hive_seller/utils/helpers.dart';

class OrderDetailsCardWidget extends StatelessWidget {
  final Order orderDetails;
  const OrderDetailsCardWidget({super.key, required this.orderDetails});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 319.w,
      padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 12.h),
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
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Mohsin",
                    style: AppTextStyles.s14(
                        color: AppColor.appBlack, fontType: FontType.MEDIUM),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Text(
                    epochToFormattedDate(orderDetails.orderedOn),
                    style: AppTextStyles.s10(
                        color: AppColor.appGrey, fontType: FontType.REGULAR),
                  ),
                ],
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
          ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, i) {
              return Row(
                children: [
                  Text(
                    "${orderDetails.items[i].quantity}  x ${orderDetails.items[i].productName}",
                    style: AppTextStyles.s10(
                      color: AppColor.appBlack,
                      fontType: FontType.REGULAR,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    "₹ ${paisaToRupees((orderDetails.items[i].basePrice + orderDetails.items[i].customisationsCost) * orderDetails.items[i].quantity)}",
                    style: AppTextStyles.s10(
                      color: AppColor.appBlack,
                      fontType: FontType.REGULAR,
                    ),
                  ),
                ],
              );
            },
            separatorBuilder: (context, i) {
              return SizedBox(
                height: 6.h,
              );
            },
            itemCount: orderDetails.items.length,
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
                "Total Bill",
                style: AppTextStyles.s10(
                  color: AppColor.appBlack,
                  fontType: FontType.MEDIUM,
                ),
              ),
              const Spacer(),
              Text(
                "₹ ${paisaToRupees(orderDetails.totalBillAmount + orderDetails.deliveryFee + orderDetails.platformFee)}",
                style: AppTextStyles.s10(
                  color: AppColor.appBlack,
                  fontType: FontType.MEDIUM,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          OutlinedButton(
            style: ButtonStyle(
              foregroundColor:
                  const MaterialStatePropertyAll(AppColor.appPrimaryColor),
              backgroundColor: const MaterialStatePropertyAll(
                  AppColor.appSecondaryCardColor),
              side: MaterialStateProperty.all(
                const BorderSide(
                  color: AppColor.appPrimaryColor,
                  width: 1.0,
                  style: BorderStyle.solid,
                ),
              ),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
              ),
            ),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return OrderDetailsScreen(
                      orderDetails: orderDetails,
                    );
                  },
                ),
              );
            },
            child: Text(
              "Review Order",
            ),
          )
        ],
      ),
    );
  }
}
