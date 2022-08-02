import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../../theme_shared_preferences/theme_provider.dart';
import '../../../utils/my_app_colors.dart';

class MyWalletScreen extends StatefulWidget {
  const MyWalletScreen({Key? key, required this.pageTitle}) : super(key: key);

  final String pageTitle;
  @override
  State<MyWalletScreen> createState() => _MyWalletScreenState();
}

class _MyWalletScreenState extends State<MyWalletScreen> {
  @override
  Widget build(BuildContext context) {
    var themeNotifier = Provider.of<MyThemeModel>(context);
    return Scaffold(
      backgroundColor: themeNotifier.isDark
          ? Theme.of(context).primaryColorDark.withOpacity(0.42)
          : Colors.grey.shade200,
      appBar: AppBar(
        title: Text(
          widget.pageTitle,
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
      ),
      body: Center(child: Text(widget.pageTitle),),
    );
  }
}
