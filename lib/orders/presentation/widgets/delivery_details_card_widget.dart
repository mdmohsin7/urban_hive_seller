import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:urban_hive_seller/utils/app_colors.dart';
import 'package:urban_hive_seller/utils/app_text_styles.dart';

class DeliveryDetailsCardWidget extends StatelessWidget {
  const DeliveryDetailsCardWidget({super.key});

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
            "Delivery Details",
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
          Text(
            "Delivery Date",
            style: AppTextStyles.s12(
              color: AppColor.appGrey,
              fontType: FontType.MEDIUM,
            ),
          ),
          Text(
            "Wed, 01 Nov 2023",
            style: AppTextStyles.s14(
              color: AppColor.appBlack,
              fontType: FontType.MEDIUM,
            ),
          ),
          SizedBox(
            height: 12.h,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Time Slot",
                style: AppTextStyles.s12(
                  color: AppColor.appGrey,
                  fontType: FontType.MEDIUM,
                ),
              ),
              Text(
                "10:00 AM - 12:00 PM",
                style: AppTextStyles.s14(
                  color: AppColor.appBlack,
                  fontType: FontType.MEDIUM,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 12.h,
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Address",
                    style: AppTextStyles.s12(
                      color: AppColor.appGrey,
                      fontType: FontType.MEDIUM,
                    ),
                  ),
                  SizedBox(
                    width: 230.w,
                    child: Text(
                      "HNo. 16-20-91, Malakpet, Hyderabad, Telangana, 500036",
                      style: AppTextStyles.s14(
                        color: AppColor.appBlack,
                        fontType: FontType.MEDIUM,
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              TextButton(
                style: ButtonStyle(
                  padding: MaterialStatePropertyAll(EdgeInsets.all(4.w)),
                  minimumSize: const MaterialStatePropertyAll(Size.zero),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                onPressed: () {},
                child: Text(
                  "copy",
                  style: AppTextStyles.s12(
                    color: AppColor.appPrimaryColor,
                    fontType: FontType.BOLD,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
