// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:progress_indicators/progress_indicators.dart';
// import '../../utils/my_app_colors.dart';
// import 'my_chats/my_chats_screen.dart';
// import '../my_widgets/myhomewidgets/my_home.dart';
// import 'my_profile/my_profile.dart';
//
// class MyNavigationBarSimple extends StatefulWidget {
//   const MyNavigationBarSimple({Key? key}) : super(key: key);
//
//
//   //
//   @override
//   _MyNavigationBarSimpleState createState() => _MyNavigationBarSimpleState();
// }
//
// class _MyNavigationBarSimpleState extends State<MyNavigationBarSimple> {
//   int pageIndex = 0;
//   String _pageTitle = 'Home';
//
//   final pages = [
//     MyHomeScreen(),
//     const LiveStocks(),
//     MyChatsScreen(),
//     const MyProfileScreen(),
//   ];
//
//   double selectedIconSize = 30, unSelectedIconSize = 25;
//
//   @override
//   Widget build(BuildContext context) {
//     // var themeNotifier = Provider.of<MyThemeModel>(context);
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
//       backgroundColor: Theme.of(context).backgroundColor,
//       body: pages[pageIndex],
//       bottomNavigationBar: Container(
//         height: Get.height * .06,
//         decoration: const BoxDecoration(
//           // color: Theme.of(context).dividerColor,
//           borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(30),
//             topRight: Radius.circular(30),
//           ),
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             IconButton(
//               enableFeedback: false,
//               onPressed: () {
//                 setState(() {
//                   _pageTitle = 'Home';
//                   pageIndex = 0;
//                 });
//               },
//               icon: pageIndex == 0
//                   ? Icon(
//                       Icons.home_filled,
//                       color: MyAppColors.appPrimaryColor,
//                       size: selectedIconSize,
//                     )
//                   : Icon(
//                       Icons.home_outlined,
//                       color:
//                           Theme.of(context).iconTheme.color!.withOpacity(.4),
//                       size: unSelectedIconSize,
//                     ),
//             ),
//             IconButton(
//               enableFeedback: false,
//               onPressed: () {
//                 setState(() {
//                   _pageTitle = 'Live stocks';
//                   pageIndex = 1;
//                 });
//               },
//               icon: pageIndex == 1
//                   ? Icon(
//                       Icons.widgets_rounded,
//                       color: MyAppColors.appPrimaryColor,
//                       size: selectedIconSize,
//                     )
//                   : Icon(
//                       Icons.widgets_outlined,
//                       color:
//                           Theme.of(context).iconTheme.color!.withOpacity(.4),
//                       size: unSelectedIconSize,
//                     ),
//             ),
//             IconButton(
//               enableFeedback: false,
//               onPressed: () {
//                 setState(() {
//                   _pageTitle = 'Chats';
//                   pageIndex = 2;
//                 });
//               },
//               icon: pageIndex == 2
//                   ? Icon(
//                       Icons.chat,
//                       color: MyAppColors.appPrimaryColor,
//                       size: selectedIconSize,
//                     )
//                   : Icon(
//                       Icons.chat_outlined,
//                       color:
//                           Theme.of(context).iconTheme.color!.withOpacity(.4),
//                       size: unSelectedIconSize,
//                     ),
//             ),
//             IconButton(
//               enableFeedback: false,
//               onPressed: () {
//                 setState(() {
//                   _pageTitle = 'My Profile';
//                   pageIndex = 3;
//                 });
//               },
//               icon: pageIndex == 3
//                   ? Icon(
//                       Icons.person,
//                       color: MyAppColors.appPrimaryColor,
//                       size: selectedIconSize,
//                     )
//                   : Icon(
//                       Icons.person_outline,
//                       color:
//                           Theme.of(context).iconTheme.color!.withOpacity(.4),
//                       size: unSelectedIconSize,
//                     ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
