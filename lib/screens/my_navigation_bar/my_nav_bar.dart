// import 'package:fluid_bottom_nav_bar/fluid_bottom_nav_bar.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:multi_vendor_edam/screens/my_navigation_bar/my_chats/my_chats_screen.dart';
// import 'package:multi_vendor_edam/screens/my_widgets/myhomewidgets/my_home.dart';
// import 'package:multi_vendor_edam/screens/my_navigation_bar/my_profile/my_profile.dart';
// import 'package:multi_vendor_edam/utils/my_app_colors.dart';
// import 'package:progress_indicators/progress_indicators.dart';
// import 'package:provider/provider.dart';
//
// import '../../theme_shared_preferences/theme_provider.dart';
//
// class MyNavigationBar extends StatefulWidget {
//   const MyNavigationBar({Key? key}) : super(key: key);
//
//   @override
//   State createState() {
//     return _MyNavigationBarState();
//   }
// }
//
// String _pageTitle = 'Home';
//
// class _MyNavigationBarState extends State {
//   Widget? _child;
//
//   @override
//   void initState() {
//     _child = MyHomeScreen();
//     super.initState();
//   }
//
//   @override
//   Widget build(context) {
//     // Build a simple container that switches content based of off the selected navigation item
//     var themeNotifier = Provider.of<MyThemeModel>(context);
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           _pageTitle,
//           style: Theme.of(context).textTheme.headline6,
//         ),
//         actionsIconTheme: Theme.of(context).appBarTheme.actionsIconTheme,
//         centerTitle: true,
//         leading: IconButton(
//           onPressed: () {
//             Get.back();
//           },
//           icon: Icon(
//             Icons.arrow_back_ios,
//             color: Theme.of(context).iconTheme.color,
//             size: 20,
//           ),
//         ),
//         actions: [
//           Padding(
//             padding: const EdgeInsets.only(right: 12.0),
//             child: JumpingText(
//               'Edam',
//               style: TextStyle(
//                   fontWeight: FontWeight.w600,
//                   color: MyAppColors.appPrimaryColor),
//             ),
//           )
//         ],
//         backgroundColor: Theme.of(context).backgroundColor,
//         elevation: 0,
//       ),
//       extendBody: true,
//       body: _child,
//       bottomNavigationBar: FluidNavBar(
//         icons: [
//           FluidNavBarIcon(
//               icon: Icons.home_rounded,
//               selectedForegroundColor: MyAppColors.appNavSelectedIconColor,
//               backgroundColor: MyAppColors.appNavIconCircleColor,
//               unselectedForegroundColor: MyAppColors.appNavUnSelectedIconColor,
//               extras: {"label": "home"}),
//           FluidNavBarIcon(
//               icon: Icons.apps,
//               selectedForegroundColor: MyAppColors.appNavSelectedIconColor,
//               backgroundColor: MyAppColors.appNavIconCircleColor,
//               unselectedForegroundColor: MyAppColors.appNavUnSelectedIconColor,
//               extras: {"label": "liveStocks"}),
//           FluidNavBarIcon(
//               icon: Icons.chat,
//               selectedForegroundColor: MyAppColors.appNavSelectedIconColor,
//               backgroundColor: MyAppColors.appNavIconCircleColor,
//               unselectedForegroundColor: MyAppColors.appNavUnSelectedIconColor,
//               extras: {"label": "chats"}),
//           FluidNavBarIcon(
//               // svgPath: "assets/conference.svg",
//               icon: Icons.account_circle,
//               selectedForegroundColor: MyAppColors.appNavSelectedIconColor,
//               backgroundColor: MyAppColors.appNavIconCircleColor,
//               unselectedForegroundColor: MyAppColors.appNavUnSelectedIconColor,
//               extras: {"label": "user"}),
//         ],
//         onChange: _handleNavigationChange,
//         style: FluidNavBarStyle(
//             barBackgroundColor: themeNotifier.isDark
//                 ? MyAppColors.appNavDarkThemeColor
//                 : MyAppColors.appNavLightThemeColor),
//         scaleFactor: 1.5,
//         defaultIndex: 0,
//         itemBuilder: (icon, item) => Semantics(
//           label: icon.extras!["label"],
//           child: item,
//         ),
//       ),
//     );
//   }
//
//   void _handleNavigationChange(int index) {
//     setState(() {
//       switch (index) {
//         case 0:
//           {
//             _pageTitle = 'Home';
//             _child = MyHomeScreen();
//           }
//           break;
//         case 1:
//           {
//             _pageTitle = 'LiveStock';
//             _child = const LiveStocks();
//           }
//           break;
//         case 2:
//           {
//             _pageTitle = 'My Chats';
//             _child = MyChatsScreen();
//           }
//           break;
//         case 3:
//           {
//             _pageTitle = 'My Profile';
//             _child = const MyProfileScreen();
//           }
//           break;
//       }
//       _child = AnimatedSwitcher(
//         switchInCurve: Curves.easeOut,
//         switchOutCurve: Curves.easeIn,
//         duration: const Duration(milliseconds: 500),
//         child: _child,
//       );
//     });
//   }
// }
