import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_vendor_edam/screens/my_navigation_bar/my_profile/my_order_tab_view/my_orders_cancelled.dart';
import 'package:multi_vendor_edam/screens/my_navigation_bar/my_profile/my_order_tab_view/my_orders_completed.dart';
import 'package:multi_vendor_edam/screens/my_navigation_bar/my_profile/my_order_tab_view/my_orders_pending.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:provider/provider.dart';

import '../../../../theme_shared_preferences/theme_provider.dart';
import '../../../../utils/my_app_colors.dart';
import 'my_orders_all.dart';
import 'my_orders_in_process.dart';

class MyOrdersTabLayout extends StatefulWidget {
  const MyOrdersTabLayout({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MyOrdersTabLayoutState();
  }
}

class _MyOrdersTabLayoutState extends State<MyOrdersTabLayout>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
    _tabController.animateTo(2);
  }

  static const List<Tab> _tabs = [
    Tab(text: 'All'),
    Tab(text: 'Pending'),
    Tab(text: 'InProcess'),
    Tab(text: 'Completed'),
    Tab(text: 'Cancelled'),
  ];

  static const List<Widget> _views = [
    MyOrdersAll(),
    MyOrdersPending(),
    MyOrdersInProcess(),
    MyOrdersCompleted(),
    MyOrdersCancelled(),
  ];

  @override
  Widget build(BuildContext context) {
    var themeNotifier = Provider.of<MyThemeModel>(context);
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        backgroundColor: themeNotifier.isDark
            ? Theme.of(context).primaryColorDark.withOpacity(0.42)
            : Colors.grey.shade200,
        appBar: AppBar(
          title: Text(
            'My Orders',
            style: Theme.of(context).textTheme.headline6,
          ),
          actionsIconTheme: Theme.of(context).appBarTheme.actionsIconTheme,
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Theme.of(context).iconTheme.color,
              size: 20,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: JumpingText(
                'Edam',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: MyAppColors.appPrimaryColor),
              ),
            )
          ],
          backgroundColor: Theme.of(context).backgroundColor,
          elevation: 0,
          bottom: TabBar(
            labelColor: MyAppColors.appPrimaryColor,
            unselectedLabelColor: Colors.grey,
            labelStyle: const TextStyle(fontWeight: FontWeight.bold),
            // unselectedLabelStyle: con,
            overlayColor:
                MaterialStateColor.resolveWith((Set<MaterialState> states) {
              return Colors.transparent;
            }),
            indicatorWeight: 10,
            indicatorColor: Colors.red,
            indicatorSize: TabBarIndicatorSize.tab,
            // indicatorPadding: const EdgeInsets.all(5),
            indicator: BoxDecoration(

              border: Border(bottom: BorderSide(width: 2,color: MyAppColors.appPrimaryColor)),
              // borderRadius: BorderRadius.circular(),
              // color: Colors.pinkAccent,
            ),
            isScrollable: true,
            physics: const BouncingScrollPhysics(),
            onTap: (int index) {
              print('Tab $index is tapped');
            },
            enableFeedback: true,
            // Uncomment the line below and remove DefaultTabController if you want to use a custom TabController
            // controller: _tabController,
            tabs: _tabs,
          ),
        ),
        body: const TabBarView(
          physics: BouncingScrollPhysics(),
          // Uncomment the line below and remove DefaultTabController if you want to use a custom TabController
          // controller: _tabController,
          children: _views,
        ),
      ),
    );
  }
}
