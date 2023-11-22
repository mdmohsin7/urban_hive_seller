import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:provider/provider.dart';
import 'package:urban_hive_seller/gen/assets.gen.dart';
import 'package:urban_hive_seller/orders/presentation/widgets/order_details_card_widget.dart';
import 'package:urban_hive_seller/orders/provider/orders_provider.dart';
import 'package:urban_hive_seller/utils/app_colors.dart';
import 'package:urban_hive_seller/utils/app_text_styles.dart';

class OrdersListScreen extends StatefulWidget {
  const OrdersListScreen({super.key});

  @override
  State<OrdersListScreen> createState() => _OrdersListScreenState();
}

class _OrdersListScreenState extends State<OrdersListScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Provider.of<OrdersProvider>(context, listen: false).getOrdersList();
      Provider.of<OrdersProvider>(context, listen: false).filterOrdersList(0);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<String> options = ['Pending', 'Accepted', 'Picked Up'];
    return Scaffold(
      backgroundColor: AppColor.appWhite,
      body: SingleChildScrollView(
        child: Consumer<OrdersProvider>(builder: (context, ordersState, child) {
          return ordersState.isLoading
              ? const Center(
                  child: CircularProgressIndicator(
                    color: AppColor.appPrimaryColor,
                  ),
                )
              : LiquidPullToRefresh(
                  color: AppColor.appPrimaryColor,
                  showChildOpacityTransition: false,
                  onRefresh: () async {
                    await Provider.of<OrdersProvider>(context, listen: false)
                        .getOrdersList();
                  },
                  child: ListView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: <Widget>[
                      Center(
                        child: ChipsChoice<int>.single(
                          spacing: 6.w,
                          value: ordersState.selectedOrderStatus,
                          onChanged: (val) {
                            ordersState.filterOrdersList(val);
                          },
                          wrapped: true,
                          choiceStyle: C2ChipStyle.outlined(
                            borderWidth: 2,
                            color: AppColor.appGrey,
                            selectedStyle: const C2ChipStyle(
                              borderColor: AppColor.appPrimaryColor,
                              foregroundColor: AppColor.appPrimaryColor,
                            ),
                          ),
                          choiceItems: C2Choice.listFrom<int, String>(
                            source: options,
                            value: (i, v) => i,
                            label: (i, v) => v,
                          ),
                        ),
                      ),
                      ordersState.filteredOrders.length > 0
                          ? ListView.separated(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, i) {
                                return Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 28.0.w),
                                  child: OrderDetailsCardWidget(
                                    orderDetails: ordersState.filteredOrders[i],
                                  ),
                                );
                              },
                              separatorBuilder: (context, i) {
                                return SizedBox(
                                  height: 28.h,
                                );
                              },
                              itemCount: ordersState.filteredOrders.length,
                            )
                          : Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 140.h,
                                  ),
                                  SvgPicture.asset(Assets.home.noOrders),
                                  SizedBox(
                                    height: 14.h,
                                  ),
                                  Text(
                                    "No Orders Available",
                                    style: AppTextStyles.s20(
                                      color: AppColor.appBlack,
                                      fontType: FontType.BOLD,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                ],
                              ),
                            ),
                      SizedBox(
                        height: 60.h,
                      ),
                    ],
                  ),
                );
        }),
      ),
    );
  }
}
