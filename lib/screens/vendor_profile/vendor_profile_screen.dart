import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:multi_vendor_edam/screens/my_navigation_bar/my_profile/my_chats/single_chat_screen.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:provider/provider.dart';
import '../../demoData/catalog_data.dart';
import '../../theme_shared_preferences/theme_provider.dart';
import '../../utils/my_app_colors.dart';
import '../my_navigation_bar/my_profile/my_chats/chat_data.dart';
import '../my_widgets/myhomewidgets/home_catalog_widget.dart';

class VendorProfileScreen extends StatefulWidget {
  const VendorProfileScreen({Key? key, required this.index}) : super(key: key);

  final int index;

  @override
  State<VendorProfileScreen> createState() => _VendorProfileScreenState();
}

class _VendorProfileScreenState extends State<VendorProfileScreen> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    var themeNotifier = Provider.of<MyThemeModel>(context);
    return Scaffold(
      backgroundColor: themeNotifier.isDark
          ? Theme.of(context).primaryColorDark.withOpacity(0.42)
          : Colors.grey.shade200,
      appBar: AppBar(
        title: Text(
          // myChatsDummyData[widget.index].profileName,
          "Vendor Profile",
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
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Container(
                        height: Get.height * .2,
                        width: Get.height * .2,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            image: DecorationImage(
                                image: AssetImage(
                                  myChatsDummyData[widget.index]
                                      .profileImagePath,
                                ),
                                fit: BoxFit.cover)),
                        child: Container()),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Text(
                            "${myChatsDummyData[widget.index].profileName} (5+ Years)",
                            style: TextStyle(
                                color: MyAppColors.appSecondaryColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 21)),
                        const SizedBox(
                          width: 5,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    Row(
                      children: [
                        RatingBarIndicator(
                          rating: 4.3,
                          itemBuilder: (context, index) => Icon(
                            Icons.star,
                            color: MyAppColors.appSecondaryColor,
                          ),
                          itemCount: 5,
                          itemSize: 20.0,
                          direction: Axis.horizontal,
                        ),
                        const Text(" 4.3 (206 Reviews)",
                            style: TextStyle(
                                // fontFamily: 'Gilroy',
                                color: Colors.grey,
                                fontWeight: FontWeight.w400,
                                fontSize: 14)),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 7,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.access_time_outlined,
                        color:
                            Theme.of(context).iconTheme.color!.withOpacity(.6),
                        size: 18,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      const Text("2 Hours",
                          style: TextStyle(
                              // fontFamily: 'Gilroy',
                              color: Colors.grey,
                              fontWeight: FontWeight.w400,
                              fontSize: 15)),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.done,
                        color:
                            Theme.of(context).iconTheme.color!.withOpacity(.6),
                        size: 18,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      const Text("200 Jobs",
                          style: TextStyle(
                              // fontFamily: 'Gilroy',
                              color: Colors.grey,
                              fontWeight: FontWeight.w400,
                              fontSize: 15)),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      Get.to(SingleChatScreen(widget.index));
                    },
                    child: Container(
                      height: 42,
                      width: 125,
                      decoration: BoxDecoration(
                          color: MyAppColors.appPrimaryColor,
                          border: Border.all(
                              width: 2, color: MyAppColors.appPrimaryColor),
                          borderRadius: BorderRadius.circular(13)),
                      child: const Center(
                        child: Text("Send Message",
                            style: TextStyle(
                                // fontFamily: 'Gilroy',
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 15)),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        isFavorite = !isFavorite;
                      });
                    },
                    child: Container(
                      height: 42,
                      width: 125,
                      decoration: BoxDecoration(
                          // color: MyAppColors.appPrimaryColor,
                          border: Border.all(
                              width: isFavorite ? 3 : 1,
                              color: MyAppColors.appPrimaryColor),
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(
                              isFavorite
                                  ? Icons.favorite
                                  : Icons.favorite_border_outlined,
                              color: MyAppColors.appSecondaryColor,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Text("Favorite",
                                  style: TextStyle(
                                      // fontFamily: 'Gilroy',
                                      color: MyAppColors.appSecondaryColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Divider(
              indent: Get.width * .04,
              endIndent: Get.width * .04,
              color: MyAppColors.appSecondaryColor,
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Row(
                children: const [
                  Text("Availability",
                      style: TextStyle(
                          // fontFamily: 'Gilroy',
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 18)),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      daysBuilder(context, dayName: 'Monday'),
                      daysBuilder(context, dayName: 'Tuesday'),
                      daysBuilder(context, dayName: 'Wednesday'),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      daysBuilder(context, dayName: 'Thursday'),
                      daysBuilder(context, dayName: 'Friday'),
                      daysBuilder(context, dayName: 'Saturday'),
                      daysBuilder(context, dayName: 'Sunday'),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 15,
            ),
            Divider(
              indent: Get.width * .04,
              endIndent: Get.width * .04,
              color: MyAppColors.appSecondaryColor.withOpacity(0.2),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Row(
                children: const [
                  Text("Languages",
                      style: TextStyle(
                          // fontFamily: 'Gilroy',
                          // color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 18)),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            languagesBuilder(languageTitle: 'English', languageLevel: 'Native'),
            languagesBuilder(languageTitle: 'Spanish', languageLevel: 'Fluent'),
            languagesBuilder(
                languageTitle: 'Italian', languageLevel: 'Conversational'),
            const SizedBox(
              height: 15,
            ),
            Divider(
              indent: Get.width * .04,
              endIndent: Get.width * .04,
              color: MyAppColors.appSecondaryColor.withOpacity(0.2),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: const [
                  Text("Items",
                      style: TextStyle(
                          // fontFamily: 'Gilroy',
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 18)),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              height: (Get.height * .2),
              width: Get.width,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: myChatsDummyData.length,
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
                      print('taped ${myChatsDummyData[index].profileName}');
                    },
                  );
                },
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Divider(
              indent: Get.width * .04,
              endIndent: Get.width * .04,
              color: MyAppColors.appSecondaryColor.withOpacity(0.2),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 18),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text("Reviews",
                    style: TextStyle(
                        // fontFamily: 'Gilroy',
                        //color: MyAppColors.appColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 20)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 6),
              child: SizedBox(
                height: 170,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemCount: myChatsDummyData.length,
                    itemBuilder: (_, i) {
                      return reviewBuilder(context,
                          reviewerName: myChatsDummyData[i].profileName,
                          imagePath: myChatsDummyData[i].profileImagePath,
                          description:
                              "Lorem ipsum dolor sit amet, adipiscing elit. Blandit lobortis diam arcu a vulputate. Egestas porta dictum id nulla.",
                          rating: 3.7);
                    }),
              ),
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}

Widget daysBuilder(BuildContext context, {required String dayName}) {
  return Chip(
    // padding: const EdgeInsets.all(4),
    backgroundColor: Theme.of(context).backgroundColor,
    side: BorderSide(color: MyAppColors.appPrimaryColor),
    label: Text(
      dayName,
      style: Theme.of(context).textTheme.titleMedium!.copyWith(
          fontWeight: FontWeight.w500, color: MyAppColors.appPrimaryColor),
    ),
  );
}

Widget languagesBuilder(
    {required String languageTitle, required languageLevel}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 3),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            // Icon(Icons.language, ),
            const SizedBox(
              width: 10,
            ),
            Text(languageTitle,
                style: const TextStyle(
                    // fontFamily: 'Gilroy',
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 17)),
          ],
        ),
        Text(languageLevel,
            style: const TextStyle(
                // fontFamily: 'Gilroy',
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 16)),
      ],
    ),
  );
}

Widget reviewBuilder(BuildContext context,
    {required String reviewerName,
    required imagePath,
    required description,
    required double rating}) {
  return Padding(
    padding: const EdgeInsets.only(right: 15.0),
    child: Container(
      height: 160,
      width: 330,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: Theme.of(context).backgroundColor,
          borderRadius: BorderRadius.circular(16)),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  image: DecorationImage(
                      fit: BoxFit.cover, image: AssetImage(imagePath)),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 7.0),
                    child: Text(reviewerName,
                        style: const TextStyle(
                            // fontFamily: 'Gilroy',
                            //color: MyAppColors.blue,
                            fontWeight: FontWeight.w600,
                            fontSize: 18)),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: Row(
                      children: [
                        RatingBarIndicator(
                          rating: rating,
                          itemBuilder: (context, index) => Icon(
                            Icons.star,
                            color: MyAppColors.appSecondaryColor,
                          ),
                          itemCount: 5,
                          itemSize: 20.0,
                          direction: Axis.horizontal,
                        ),
                        Text(" (${rating.toString()})",
                            style: const TextStyle(
                                // fontFamily: 'Gilroy',
                                color: Colors.grey,
                                fontWeight: FontWeight.w400,
                                fontSize: 14)),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Text(description,
              style: const TextStyle(
                  // fontFamily: 'Gilroy',
                  color: Colors.grey,
                  fontWeight: FontWeight.w400,
                  fontSize: 14)),
        ],
      ),
    ),
  );
}
