import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_vendor_edam/screens/authentications/sign_up_screen.dart';
import 'package:multi_vendor_edam/screens/my_navigation_bar/my_profile/my_order_tab_view/tab_layout_order.dart';
import 'package:multi_vendor_edam/screens/my_widgets/myhomewidgets/recent_orders_builder.dart';
import 'package:multi_vendor_edam/screens/welcomescreens/splash_screen.dart';
import 'package:multi_vendor_edam/utils/my_app_colors.dart';
import 'package:provider/provider.dart';
import 'CalenderDemo.dart';
import 'screens/my_navigation_bar/my_navbar.dart';
import 'theme_shared_preferences/theme_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MyThemeModel(),
      child: Consumer(
        builder: (context, MyThemeModel themeModel, child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            // darkTheme: ThemeData.dark(),
            // themeMode: ThemeMode.system,
            title: 'Edam',
            theme: themeModel.isDark
                ? ThemeData.dark().copyWith(
                    primaryColor: MyAppColors.appPrimaryColor,
                    textButtonTheme: TextButtonThemeData(
                      style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all<Color>(
                            MyAppColors.appPrimaryColor),
                      ),
                    ),
                  )
                : _lightTheme,
            home: MyNavBar(),
          );
        },
      ),
    );
  }
}

ThemeData _lightTheme = ThemeData(
  // appBarTheme: AppBarTheme(backgroundColor: Colors.white,foregroundColor: Colors.red),
  backgroundColor: Colors.white,
  primarySwatch: Colors.red,
  primaryColor: const Color(0xffab1d00),
  //Color(0xfff7610a);
  indicatorColor: const Color(0xffab1d00),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(

      // foregroundColor: MaterialStateProperty.all<Color>(MyAppColors.appPrimaryColor),
      backgroundColor:
          MaterialStateProperty.all<Color>(MyAppColors.appPrimaryColor),
    ),
  ),
  // textButtonTheme: TextButtonThemeData(
  //   style: ButtonStyle(
  //     foregroundColor:
  //         MaterialStateProperty.all<Color>(MyAppColors.appPrimaryColor),
  //   ),
  // ),
  bottomAppBarColor: Colors.grey,
  bottomNavigationBarTheme:
      const BottomNavigationBarThemeData(backgroundColor: Colors.black),
);
