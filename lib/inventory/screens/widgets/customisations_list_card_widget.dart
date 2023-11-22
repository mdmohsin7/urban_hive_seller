import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:urban_hive_seller/utils/app_colors.dart';
import 'package:urban_hive_seller/utils/app_text_styles.dart';

class CustomisationsListCardWidget extends StatelessWidget {
  final List<Map> customisations;
  final VoidCallback onPressed;
  const CustomisationsListCardWidget(
      {super.key, required this.customisations, required this.onPressed});

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
              itemBuilder: (ctx, i) {
                return Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Customisation ${i + 1}",
                          style: AppTextStyles.s12(
                            color: AppColor.appGrey,
                            fontType: FontType.MEDIUM,
                          ),
                        ),
                        Text(
                          customisations[i]['customisationName'],
                          style: AppTextStyles.s14(
                            color: AppColor.appBlack,
                            fontType: FontType.MEDIUM,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 30.w,
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Customisation Type",
                          style: AppTextStyles.s12(
                            color: AppColor.appGrey,
                            fontType: FontType.MEDIUM,
                          ),
                        ),
                        Text(
                          customisations[i]['customisationType'] == 1
                              ? "Let users enter text"
                              : "Let users select an option",
                          style: AppTextStyles.s14(
                            color: AppColor.appBlack,
                            fontType: FontType.MEDIUM,
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
              separatorBuilder: (ctx, _) {
                return SizedBox(
                  height: 8.h,
                );
              },
              itemCount: customisations.length,
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
                "Edit Customisations",
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
