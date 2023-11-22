import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:urban_hive_seller/core/core_provider.dart';
import 'package:urban_hive_seller/core/home_screen.dart';
import 'package:urban_hive_seller/customization/providers/customization.dart';

import 'package:urban_hive_seller/inventory/provider/image.dart';
import 'package:urban_hive_seller/inventory/provider/inventory_provider.dart';
import 'package:urban_hive_seller/orders/provider/orders_provider.dart';
import 'package:urban_hive_seller/utils/app_colors.dart';

import 'service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  ServiceLocator.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      useInheritedMediaQuery: true,
      builder: (context, child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) {
              return OrdersProvider();
            }),
            ChangeNotifierProvider(create: (context) {
              return CoreProvider();
            }),
            ChangeNotifierProvider(create: (context) {
              return InventoryProvider();
            }),
            ChangeNotifierProvider(create: (context) => image()),
            ChangeNotifierProvider(create: (context) => customisation())
          ],
          child: const MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Urban Hive Seller',
            home: HomeScreen(),
          ),
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        elevation: 0,
        // title: Row(
        //   children: [
        //     const Text('Outlet Online'),
        //     const Spacer(),
        //     Container(
        //       width: 45.w,
        //       height: 45.w,
        //       color: Colors.red,
        //     )
        //   ],
        // ),
      ),
      backgroundColor: AppColor.appBackgroundColor,
      body: HomeScreen(),
    );
  }
}
