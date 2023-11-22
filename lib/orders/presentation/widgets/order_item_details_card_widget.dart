import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:urban_hive_seller/orders/entity/order_item.dart';
import 'package:urban_hive_seller/utils/app_colors.dart';
import 'package:urban_hive_seller/utils/app_text_styles.dart';
import 'package:urban_hive_seller/utils/helpers.dart';

class OrderItemDetailsCardWidget extends StatelessWidget {
  final OrderItem item;
  const OrderItemDetailsCardWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColor.appSecondaryCardColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "${item.productName}  x${item.quantity}",
                  style: AppTextStyles.s12(
                    color: AppColor.appBlack,
                    fontType: FontType.SEMI_BOLD,
                  ),
                ),
                const Spacer(),
                Text(
                  "₹ ${paisaToRupees(item.basePrice * item.quantity)}",
                  style: AppTextStyles.s12(
                    color: AppColor.appBlack,
                    fontType: FontType.SEMI_BOLD,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 8.h,
            ),
            const Divider(
              height: 2,
              thickness: 2,
              color: AppColor.appStrokeGrey,
            ),
            SizedBox(
              height: 8.h,
            ),
            item.hasCustomisations
                ? ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, i) {
                      return Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.customisations![i].customisationName,
                                style: AppTextStyles.s12(
                                  color: AppColor.appGrey,
                                  fontType: FontType.MEDIUM,
                                ),
                              ),
                              Text(
                                item.customisations![i]
                                    .selectedCustomisationValue,
                                style: AppTextStyles.s12(
                                  color: AppColor.appBlack,
                                  fontType: FontType.MEDIUM,
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          TextButton(
                            style: ButtonStyle(
                              padding:
                                  MaterialStatePropertyAll(EdgeInsets.all(4.w)),
                              minimumSize:
                                  const MaterialStatePropertyAll(Size.zero),
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            onPressed: () {},
                            child: Text(
                              "₹ ${paisaToRupees(item.customisations?[i].additionalCharge ?? 0)}",
                              style: AppTextStyles.s12(
                                color: AppColor.appBlack,
                                fontType: FontType.MEDIUM,
                              ),
                            ),
                          )
                        ],
                      );
                    },
                    separatorBuilder: (context, i) {
                      return SizedBox(
                        height: 6.h,
                      );
                    },
                    itemCount: item.customisations?.length ?? 0,
                  )
                : Container(
                    child: Text(
                      "No customisations for this product",
                      style: AppTextStyles.s12(
                        color: AppColor.appGrey,
                        fontType: FontType.MEDIUM,
                      ),
                    ),
                  ),
            SizedBox(
              height: 8.h,
            ),
            const Divider(
              height: 2,
              thickness: 2,
              color: AppColor.appStrokeGrey,
            ),
            SizedBox(
              height: 8.h,
            ),
            Row(
              children: [
                Text(
                  "Total",
                  style: AppTextStyles.s12(
                    color: AppColor.appBlack,
                    fontType: FontType.SEMI_BOLD,
                  ),
                ),
                const Spacer(),
                Text(
                  "₹ ${paisaToRupees((item.basePrice + item.customisationsCost) * item.quantity)}",
                  style: AppTextStyles.s12(
                    color: AppColor.appBlack,
                    fontType: FontType.SEMI_BOLD,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
