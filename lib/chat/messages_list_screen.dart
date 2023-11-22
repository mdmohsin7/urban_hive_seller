import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:urban_hive_seller/gen/assets.gen.dart';
import 'package:urban_hive_seller/utils/app_colors.dart';
import 'package:urban_hive_seller/utils/app_text_styles.dart';

class MessagesListScreen extends StatelessWidget {
  const MessagesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.appWhite,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Container(
              width: 329.w,
              height: 85.h,
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
              child: Row(
                children: [
                  SizedBox(
                    width: 20.w,
                  ),
                  Container(
                    height: 45.h,
                    width: 45.w,
                    decoration: BoxDecoration(
                      color: AppColor.accentColor,
                      borderRadius: BorderRadius.circular(50),
                      image: DecorationImage(
                        image: AssetImage(Assets.male.path),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 235.w,
                        child: Row(
                          children: [
                            Text(
                              "Tabrez",
                              style: AppTextStyles.s16(
                                color: AppColor.appBlack,
                                fontType: FontType.MEDIUM,
                              ),
                            ),
                            const Spacer(),
                            Text(
                              "10:20 AM",
                              style: AppTextStyles.s12(
                                color: AppColor.appGrey,
                                fontType: FontType.MEDIUM,
                              ),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 235.w,
                        child: Row(
                          children: [
                            Text(
                              "Okay",
                              style: AppTextStyles.s14(
                                color: AppColor.appGrey,
                                fontType: FontType.MEDIUM,
                              ),
                            ),
                            const Spacer(),
                            const CircleAvatar(
                              radius: 4,
                              backgroundColor: AppColor.appPrimaryColor,
                            ),
                            SizedBox(
                              width: 15.w,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 12.h,
          ),
          Center(
            child: Container(
              width: 329.w,
              height: 85.h,
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
              child: Row(
                children: [
                  SizedBox(
                    width: 20.w,
                  ),
                  Container(
                    height: 45.h,
                    width: 45.w,
                    decoration: BoxDecoration(
                      color: AppColor.accentColor,
                      borderRadius: BorderRadius.circular(50),
                      image: DecorationImage(
                        image: AssetImage(Assets.female.path),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 235.w,
                        child: Row(
                          children: [
                            Text(
                              "B. Sarwath",
                              style: AppTextStyles.s16(
                                color: AppColor.appBlack,
                                fontType: FontType.MEDIUM,
                              ),
                            ),
                            const Spacer(),
                            Text(
                              "09:12 AM",
                              style: AppTextStyles.s12(
                                color: AppColor.appGrey,
                                fontType: FontType.MEDIUM,
                              ),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 235.w,
                        child: Row(
                          children: [
                            Text(
                              "product done?",
                              style: AppTextStyles.s14(
                                color: AppColor.appGrey,
                                fontType: FontType.MEDIUM,
                              ),
                            ),
                            const Spacer(),
                            const CircleAvatar(
                              radius: 4,
                              backgroundColor: AppColor.appPrimaryColor,
                            ),
                            SizedBox(
                              width: 15.w,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
