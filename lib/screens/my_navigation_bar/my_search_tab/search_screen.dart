import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:multi_vendor_edam/utils/my_app_colors.dart';
import 'package:provider/provider.dart';
import '../../../demoData/catalog_data.dart';
import '../../../item_details/details-screen.dart';
import '../../../theme_shared_preferences/theme_provider.dart';
import '../../my_widgets/myhomewidgets/home_top_rated_widget.dart';
import '../../vendor_profile/vendor_profile_screen.dart';
import '../live_stocks/item_list_builder.dart';
import '../my_profile/my_chats/chat_data.dart';

class MySearchScreen extends StatefulWidget {
  const MySearchScreen({Key? key}) : super(key: key);

  @override
  State<MySearchScreen> createState() => _MySearchScreenState();
}

class _MySearchScreenState extends State<MySearchScreen> {
  bool isItemSearch = false;
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var themeNotifier = Provider.of<MyThemeModel>(context);
    return Scaffold(
      backgroundColor: themeNotifier.isDark
          ? Theme.of(context).primaryColorDark.withOpacity(0.42)
          : Colors.grey.shade200,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            floating: true,
            pinned: true,
            snap: false,
            expandedHeight: 60,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                color: Theme.of(context).backgroundColor.withOpacity(0.9),
                child: Container(
                  width: double.infinity,
                  // height: 40,
                  decoration: BoxDecoration(
                      color: MyAppColors.appPrimaryColor.withOpacity(0.05),
                      border: Border(
                          bottom:
                              BorderSide(color: MyAppColors.appPrimaryColor))),
                  child: Center(
                    child: Row(
                      children: [
                        PopupMenuButton<String>(
                          icon: SvgPicture.asset(
                            isItemSearch
                                ? 'assets/svg/sheepIcon (5).svg'
                                : 'assets/svg/vendorShop.svg',
                            semanticsLabel: 'sheepIcon',
                            color: MyAppColors.appPrimaryColor,
                            width: isItemSearch ? 20 : 25,
                            height: isItemSearch ? 20 : 25,
                          ),
                          onSelected: (String result) {
                            switch (result) {
                              case 'Search Item':
                                setState(() {
                                  isItemSearch = true;
                                });
                                break;
                              case 'Search Shop':
                                setState(() {
                                  isItemSearch = false;
                                });
                                break;
                              default:
                            }
                          },
                          itemBuilder: (BuildContext context) =>
                              <PopupMenuEntry<String>>[
                            const PopupMenuItem<String>(
                              value: 'Search Item',
                              child: Text('Search Item'),
                            ),
                            const PopupMenuItem<String>(
                              value: 'Search Shop',
                              child: Text('Search Shop'),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: Get.width * .85,
                          child: TextFormField(
                            controller: searchController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: isItemSearch
                                  ? 'Search for items'
                                  : 'Search for shop',
                              prefixIcon: Container(
                                // color: Colors.black45,
                                padding: const EdgeInsets.all(15),
                                child: SvgPicture.asset(
                                  'assets/svg/search.svg',
                                  height: 5,
                                  width: 5,
                                  color: MyAppColors.appPrimaryColor,
                                ),
                              ),
                              suffix: GestureDetector(
                                onTap: () {
                                  searchController.clear();
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.cancel,
                                    size: 20,
                                    color: MyAppColors.guestButtonColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          // Other Sliver Widgets
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: myDummyCatalogData.length - 10,
              (_, index) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 10, top: 12),
                  child: isItemSearch
                      ? ItemsListBuilder(
                          imagePath: myDummyCatalogData[index].imagePath,
                          titleText: myDummyCatalogData[index].name,
                          averageRate: myDummyCatalogData[index].rating,
                          vendorName: myDummyCatalogData[index].vendorName,
                          price: myDummyCatalogData[index].price,
                          isFavorite: myDummyCatalogData[index].isFavorite,
                          index: index,
                          onTap: () {
                            // print(
                            //     'taped ${myChatsDummyData[index].profileName}');

                            Get.to(ItemDetailsScreen(index: index));
                          },
                        )
                      : TopRatedCustomWidget(
                          imagePath: myChatsDummyData[index].profileImagePath,
                          titleName: myChatsDummyData[index].profileName,
                          location: '123 sawan garden street, Islamabad',
                          rating: ratingChecker(
                              rating: myDummyCatalogData[index].rating),
                          isFavorite: true,
                          onTap: () {
                            Get.to(VendorProfileScreen(index: index));
                            // print('taped ${myChatsDummyData[index].profileName}');
                          },
                          price: 35.45,
                        ),
                );
              },
            ),
          ),
          SliverPadding(
              padding: EdgeInsets.symmetric(vertical: Get.height * .05)),
        ],
      ),
    );
  }

  double ratingChecker({required double rating}) {
    if (rating > 5.0) {
      rating = 5.0;
    } else if (rating < 1.0) {
      rating = 1.0;
    } else {
      rating = rating;
    }

    return rating;
  }
}

//
// class _HomePageState extends State<HomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: CustomScrollView(
//         slivers: [
//           SliverAppBar(
//             floating: true,
//             pinned: true,
//             snap: false,
//             centerTitle: false,
//             title: Text('code.com'),
//             actions: [
//               IconButton(
//                 icon: Icon(Icons.shopping_cart),
//                 onPressed: () {},
//               ),
//             ],
//             bottom: AppBar(
//               title: Container(
//                 width: double.infinity,
//                 height: 40,
//                 color: Colors.white,
//                 child: Center(
//                   child: TextField(
//                     decoration: InputDecoration(
//                         hintText: 'Search for something',
//                         prefixIcon: Icon(Icons.search),
//                         suffixIcon: Icon(Icons.camera_alt)),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           // Other Sliver Widgets
//           SliverList(
//             delegate: SliverChildListDelegate([
//               Container(
//                 height: 400,
//                 child: Center(
//                   child: Text(
//                     'This is an awesome shopping platform',
//                   ),
//                 ),
//               ),
//               Container(
//                 height: 1000,
//                 color: Colors.pink,
//               ),
//             ]),
//           ),
//         ],
//       ),
//     );
//   }
// }
