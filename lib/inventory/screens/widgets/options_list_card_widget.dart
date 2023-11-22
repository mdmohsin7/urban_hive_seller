import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:urban_hive_seller/utils/app_colors.dart';
import 'package:urban_hive_seller/utils/app_text_styles.dart';

class OptionsListCardWidget extends StatelessWidget {
  final List<Map> options;
  final VoidCallback onPressed;
  const OptionsListCardWidget(
      {super.key, required this.options, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 16.h,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (ctx, optionsIndex) {
                return Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Option ${optionsIndex + 1}",
                          style: AppTextStyles.s12(
                            color: AppColor.appGrey,
                            fontType: FontType.MEDIUM,
                          ),
                        ),
                        Text(
                          options[optionsIndex]['optionName'],
                          style: AppTextStyles.s14(
                            color: AppColor.appBlack,
                            fontType: FontType.MEDIUM,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Text(
                      options[optionsIndex]['additionalCharge'].toString(),
                      style: AppTextStyles.s14(
                        color: AppColor.appBlack,
                        fontType: FontType.MEDIUM,
                      ),
                    )
                  ],
                );
              },
              separatorBuilder: (ctx, _) {
                return SizedBox(
                  height: 8.h,
                );
              },
              itemCount: options.length,
            ),
            SizedBox(
              height: 6.h,
            ),
            Divider(),
            SizedBox(
              height: 6.h,
            ),
            InkWell(
              onTap: onPressed,
              child: Text(
                "Edit Customisation Options",
                style: AppTextStyles.s14(
                  color: AppColor.appPrimaryColor,
                  fontType: FontType.SEMI_BOLD,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
