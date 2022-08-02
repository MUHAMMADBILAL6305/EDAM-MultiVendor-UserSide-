import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_vendor_edam/screens/my_navigation_bar/my_profile/my_chats/chat_data.dart';
import 'package:provider/provider.dart';

import '../../../demoData/catalog_data.dart';
import '../../../theme_shared_preferences/theme_provider.dart';
import '../../../utils/my_app_colors.dart';

class HomeOffers extends StatelessWidget {
  const HomeOffers(
      {Key? key,
      required this.imagePath,
      required this.ontap,
      required this.index})
      : super(key: key);

  final int index;
  final Function() ontap;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    var themeNotifier = Provider.of<MyThemeModel>(context);
    return InkWell(
      onTap: ontap,
      child: Container(
        // padding: EdgeInsets.all(6),
        // decoration: BoxDecoration(
        //   // borderRadius: BorderRadius.circular(12),
        //   border: Border.all(color: MyAppColors.appPrimaryColor,width: 2),),
        margin: const EdgeInsets.only(top: 12, bottom: 12,right: 6),
        child: Container(
          height: (Get.height * .2),
          width: Get.width * .5,
          decoration: BoxDecoration(
            color: Colors.black26,
            border: Border.all(
                color: themeNotifier.isDark
                    ? MyAppColors.appPrimaryColor
                    : Colors.transparent),
            image: DecorationImage(
              image: AssetImage(
                imagePath,
              ),
            ),
          ),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Get.height * .03,
              width: double.infinity,
              color: Colors.black.withOpacity(.5),
              child: Center(
                child: Text(
                  "Vendor: ${myDummyCatalogData[index].vendorName}",
                  style: TextStyle(color: Colors.white.withOpacity(0.9)),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
