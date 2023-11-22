import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:urban_hive_seller/gen/assets.gen.dart';
import 'package:urban_hive_seller/utils/app_colors.dart';
import 'package:urban_hive_seller/utils/app_text_styles.dart';

class StoreDetailsScreen extends StatelessWidget {
  const StoreDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.appWhite,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20.h,
            ),
            Container(
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
                children: [
                  Row(
                    children: [
                      Text(
                        "Photos",
                        style: AppTextStyles.s14(
                          color: AppColor.appBlack,
                          fontType: FontType.BOLD,
                        ),
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () {},
                        child: Text(
                          "Connect",
                          style: AppTextStyles.s14(
                            color: AppColor.appPrimaryColor,
                            fontType: FontType.BOLD,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 14.h,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(Assets.store.icons.icInstagramOutlined),
                      SizedBox(
                        width: 12.w,
                      ),
                      SizedBox(
                        width: 235.w,
                        child: Text(
                          "Connect your instagram to import all the images to the gallery section of your profile",
                          style: AppTextStyles.s12(
                            color: AppColor.appBlack,
                            fontType: FontType.MEDIUM,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Center(
              child: Container(
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
                    Row(
                      children: [
                        Text(
                          "Personal Details",
                          style: AppTextStyles.s14(
                            color: AppColor.appBlack,
                            fontType: FontType.BOLD,
                          ),
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () {},
                          child: SvgPicture.asset(
                              Assets.store.icons.icEditOutlined),
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
                    Text(
                      "Name",
                      style: AppTextStyles.s12(
                        color: AppColor.appGrey,
                        fontType: FontType.MEDIUM,
                      ),
                    ),
                    Text(
                      "Mohammed Mohsin",
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
                          "Email Address",
                          style: AppTextStyles.s12(
                            color: AppColor.appGrey,
                            fontType: FontType.MEDIUM,
                          ),
                        ),
                        Text(
                          "mohsin.lp710@gmail.com",
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Phone",
                          style: AppTextStyles.s12(
                            color: AppColor.appGrey,
                            fontType: FontType.MEDIUM,
                          ),
                        ),
                        Text(
                          "+91 12345 67890",
                          style: AppTextStyles.s14(
                            color: AppColor.appBlack,
                            fontType: FontType.MEDIUM,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Center(
              child: Container(
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
                      "Business Details",
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
                      "Name",
                      style: AppTextStyles.s12(
                        color: AppColor.appGrey,
                        fontType: FontType.MEDIUM,
                      ),
                    ),
                    Text(
                      "Donut Gonuts",
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
                          "Address",
                          style: AppTextStyles.s12(
                            color: AppColor.appGrey,
                            fontType: FontType.MEDIUM,
                          ),
                        ),
                        Text(
                          "Malakpet, Hyderabad - 500036",
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Category",
                          style: AppTextStyles.s12(
                            color: AppColor.appGrey,
                            fontType: FontType.MEDIUM,
                          ),
                        ),
                        Text(
                          "Food & Snacks",
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Established On",
                          style: AppTextStyles.s12(
                            color: AppColor.appGrey,
                            fontType: FontType.MEDIUM,
                          ),
                        ),
                        Text(
                          "06th Feb, 2021",
                          style: AppTextStyles.s14(
                            color: AppColor.appBlack,
                            fontType: FontType.MEDIUM,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Center(
              child: Container(
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
                      "Bank Details",
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
                      "Bank Name",
                      style: AppTextStyles.s12(
                        color: AppColor.appGrey,
                        fontType: FontType.MEDIUM,
                      ),
                    ),
                    Text(
                      "State Bank of India",
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
                          "Account Number",
                          style: AppTextStyles.s12(
                            color: AppColor.appGrey,
                            fontType: FontType.MEDIUM,
                          ),
                        ),
                        Text(
                          "4200003420",
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Account Holder Name",
                          style: AppTextStyles.s12(
                            color: AppColor.appGrey,
                            fontType: FontType.MEDIUM,
                          ),
                        ),
                        Text(
                          "Mohammed Mohsin",
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "IFSC Code",
                          style: AppTextStyles.s12(
                            color: AppColor.appGrey,
                            fontType: FontType.MEDIUM,
                          ),
                        ),
                        Text(
                          "KKBK00002947",
                          style: AppTextStyles.s14(
                            color: AppColor.appBlack,
                            fontType: FontType.MEDIUM,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
          ],
        ),
      ),
    );
  }
}
