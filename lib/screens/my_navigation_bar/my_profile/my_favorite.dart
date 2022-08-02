import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_vendor_edam/demoData/catalog_data.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:provider/provider.dart';
import '../../../theme_shared_preferences/theme_provider.dart';
import '../../../utils/my_app_colors.dart';
import '../../my_widgets/myhomewidgets/home_top_rated_widget.dart';
import '../../vendor_profile/vendor_profile_screen.dart';
import 'my_chats/chat_data.dart';

class MyFavoritiesScreen extends StatefulWidget {
  const MyFavoritiesScreen({Key? key, required this.pageTitle}) : super(key: key);

  final String pageTitle;
  @override
  State<MyFavoritiesScreen> createState() => _MyFavoritiesScreenState();
}

class _MyFavoritiesScreenState extends State<MyFavoritiesScreen> {
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
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(children: [

          const SizedBox(height: 20),
          const Text(
            'Favorite Vendors',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const SizedBox(height: 20),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: myChatsDummyData.length,
            shrinkWrap: true,
            // scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return TopRatedCustomWidget(
                imagePath: myChatsDummyData[index].profileImagePath,
                titleName: myChatsDummyData[index].profileName,
                location: myDummyCatalogData[index].vendorName,
                rating: myDummyCatalogData[index].rating,
                isFavorite: true,
                onTap: () {
                  Get.to(VendorProfileScreen(index: index));
                  // print('taped ${myChatsDummyData[index].profileName}');
                },
                price: 35.45,
              );
            },
          ),
        ],),
      ),
    );
  }
}
