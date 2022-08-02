import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_vendor_edam/demoData/catalog_data.dart';
import 'package:multi_vendor_edam/screens/my_widgets/myhomewidgets/featured_items_widet.dart';
import 'package:multi_vendor_edam/screens/my_widgets/myhomewidgets/recent_orders_builder.dart';
import 'package:multi_vendor_edam/screens/vendor_profile/vendor_profile_screen.dart';
import 'package:provider/provider.dart';
import '../../../item_details/details-screen.dart';
import '../../../theme_shared_preferences/theme_provider.dart';
import '../../my_navigation_bar/my_profile/my_chats/chat_data.dart';
import 'home_catalog_widget.dart';
import 'home_top_rated_widget.dart';
import 'offers_widget.dart';

class MyHomeScreen extends StatelessWidget {
  MyHomeScreen({Key? key}) : super(key: key);

  List<String> offersDemoData = [
    'assets/images/offer0.jpg',
    'assets/images/offer1.jpg',
    'assets/images/offer2.jpg',
    'assets/images/offer3.jpg',
    'assets/images/offer4.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    var themeNotifier = Provider.of<MyThemeModel>(context);
    return Scaffold(
      backgroundColor: themeNotifier.isDark
          ? Theme.of(context).primaryColorDark.withOpacity(0.42)
          : Colors.grey.shade200,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Offers',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  SizedBox(
                    height: (Get.height * .2),
                    width: Get.width,
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: offersDemoData.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return HomeOffers(
                          imagePath: offersDemoData[index],
                          ontap: () {
                            print('tapped test....');
                          },
                          index: index,
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Featured',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    color: Colors.transparent,
                    height: (Get.height * .33),
                    width: Get.width,
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: myDummyCatalogData.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return FeaturedItemsBuilder(
                            itemName: myDummyCatalogData[index].name,
                            imagePath: myDummyCatalogData[index].imagePath,
                            isFavorite: myDummyCatalogData[index].isFavorite,
                            price: myDummyCatalogData[index].price,
                            gram: myDummyCatalogData[index].grams,
                            calories: myDummyCatalogData[index].calories,
                            index: index,
                            rating: myDummyCatalogData[index].rating);
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Recent Orders',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    height: (Get.height * .3),
                    width: double.infinity,
                    child: ListView.builder(
                        itemCount: 5,
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (_, index) {
                          return RecentOrdersBuilder(
                              onTap: () {}, index: index);
                        }),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Catalog',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    // color: Colors.red,
                    height: (Get.height * .17),
                    width: Get.width,
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: myDummyCatalogData.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return HomeCustomCatalog(
                          imagePath: myDummyCatalogData[index].imagePath,
                          titleText: myDummyCatalogData[index].name,
                          averageRate: myDummyCatalogData[index].rating,
                          grams: myDummyCatalogData[index].grams,
                          vendorName: myDummyCatalogData[index].vendorName,
                          calories: myDummyCatalogData[index].calories,
                          price: myDummyCatalogData[index].price,
                          onTap: () {
                            // print(
                            //     'taped ${myChatsDummyData[index].profileName}');

                            Get.to(ItemDetailsScreen(index: index));
                          },
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Top Rated',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ],
              ),
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: myChatsDummyData.length,
              shrinkWrap: true,
              // scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return TopRatedCustomWidget(
                  imagePath: myChatsDummyData[index].profileImagePath,
                  titleName: myChatsDummyData[index].profileName,
                  location: '123 sawan garden street, Islamabad',
                  rating: ratingChecker(rating: myDummyCatalogData[index].rating),
                  isFavorite: true,
                  onTap: () {
                    Get.to(VendorProfileScreen(index: index));
                    // print('taped ${myChatsDummyData[index].profileName}');
                  },
                  price: 35.45,
                );
              },
            ),
            SizedBox(height: Get.height * .1)
          ],
        ),
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

