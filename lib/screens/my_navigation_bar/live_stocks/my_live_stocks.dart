import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:multi_vendor_edam/demoData/catalog_data.dart';
import 'package:multi_vendor_edam/screens/my_navigation_bar/live_stocks/item_grid_builder.dart';
import 'package:multi_vendor_edam/utils/my_app_colors.dart';
import 'package:provider/provider.dart';
import '../../../item_details/details-screen.dart';
import '../../../theme_shared_preferences/theme_provider.dart';
import 'item_list_builder.dart';

class LiveStocks extends StatefulWidget {
  const LiveStocks({Key? key}) : super(key: key);

  @override
  State<LiveStocks> createState() => _LiveStocksState();
}

class _LiveStocksState extends State<LiveStocks> {
  bool isGridView = false;
  List<String> listItems = ['Filter by ', 'Chicken ', "Fish Meal ", 'Meat '];
  int selectedValueFilter = 0;
  int selectedValueSort = 0;

  @override
  Widget build(BuildContext context) {
    var themeNotifier = Provider.of<MyThemeModel>(context);
    return Scaffold(
      backgroundColor: themeNotifier.isDark
          ? Theme
          .of(context)
          .primaryColorDark
          .withOpacity(0.42)
          : Colors.grey.shade200,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            snap: true,
            pinned: false,
            floating: true,
            expandedHeight: Get.height * .15,
            flexibleSpace: FlexibleSpaceBar(
                background: Column(
                    children: [
                Container(
                color: themeNotifier.isDark
                ? Theme.of(context).backgroundColor.withOpacity(0.9)
                    : Colors.grey.shade200,
                padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                PopupMenuButton<String>(
                  icon: isGridView
                      ? const Icon(Icons.grid_view)
                      : const Icon(Icons.list_rounded),
                  onSelected: (String result) {
                    switch (result) {
                      case 'List View':
                        setState(() {
                          isGridView = false;
                        });
                        break;
                      case 'Grid View':
                        setState(() {
                          isGridView = true;
                        });
                        break;
                      default:
                    }
                  },
                  itemBuilder: (BuildContext context) =>
                  <PopupMenuEntry<String>>[
                    const PopupMenuItem<String>(
                      value: 'List View',
                      child: Text('List View'),
                    ),
                    const PopupMenuItem<String>(
                      value: 'Grid View',
                      child: Text('Grid View'),
                    ),
                  ],
                ),
                // IconButton(
                //   onPressed: () {
                //     showModalBottomSheet(
                //       backgroundColor: Colors.transparent,
                //       context: context,
                //       builder: (_) => MyBottomSheet(),
                //     );
                //   },
                //   icon: const Icon(Icons.list),
                // ),
                // ElevatedButton.icon(
                //   icon: const Icon(
                //     Icons.filter_list,
                //     // color: MyAppColors.appPrimaryColor,
                //   ),
                //   style: ButtonStyle(
                //       backgroundColor: MaterialStateProperty.all<Color>(
                //           MyAppColors.appPrimaryColor)),
                //   onPressed: () {},
                //   label: const Text('Filter By '),
                // ),
                Container(
                  height: Get.height * .047,
                  // width: Get.width * .3,
                  padding:
                  EdgeInsets.symmetric(horizontal: Get.width * .03),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: MyAppColors.appPrimaryColor,
                  ),
                  child: Center(
                    child: DropdownButton(
                      focusColor: Colors.black54,
                      elevation: 1,
                      style: Theme
                          .of(context)
                          .textTheme
                          .labelLarge!
                          .copyWith(color: Colors.white),
                      //Dropdown font color
                      dropdownColor: MyAppColors.appPrimaryColor,
                      //dropdown menu background color
                      hint: const Text('Filter By'),
                      icon: SvgPicture.asset(
                        'assets/svg/filter.svg',
                        color: Colors.white,
                        width: 20,
                        height: 20,
                      ),
                      //dropdown indicator icon
                      underline: Container(),
                      //make underline empty
                      value: selectedValueFilter,
                      onChanged: (int? value) {
                        if (value != null) {
                          setState(() {
                            selectedValueFilter = value;
                          });
                        }
                      },
                      items: const [
                        DropdownMenuItem(
                          value: 0,
                          child: Text('Filter By '),
                        ),
                        DropdownMenuItem(
                          value: 1,
                          child: Text('Chicken '),
                        ),
                        DropdownMenuItem(
                          value: 2,
                          child: Text('Fish Meal '),
                        ),
                        DropdownMenuItem(
                          value: 3,
                          child: Text('Meat '),
                        ),
                      ],
                    ),
                  ),
                ),
                // ElevatedButton.icon(
                //   icon: const Icon(
                //     Icons.compare,
                //     // color: MyAppColors.appPrimaryColor,
                //   ),
                //   // style: ButtonStyle(
                //   //     backgroundColor: MaterialStateProperty.all<Color>(
                //   //         MyAppColors.appPrimaryColor)),
                //   onPressed: () {},
                //   label: const Text('Sort By '),
                // ),
                Container(
                  height: Get.height * .047,
                  // width: Get.width * .3,
                  padding:
                  EdgeInsets.symmetric(horizontal: Get.width * .03),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: MyAppColors.appPrimaryColor,
                  ),
                  child: Center(
                    child: DropdownButton(
                      focusColor: Colors.black54,
                      elevation: 1,
                      style: Theme
                          .of(context)
                          .textTheme
                          .labelLarge!
                          .copyWith(color: Colors.white),
                      //Dropdown font color
                      dropdownColor: MyAppColors.appPrimaryColor,
                      //dropdown menu background color
                      hint: const Text('Sort By'),
                      icon: const Icon(Icons.filter_list,
                          color: Colors.white),
                      //dropdown indicator icon
                      underline: Container(),
                      //make underline empty
                      value: selectedValueSort,
                      onChanged: (int? value) {
                        if (value != null) {
                          setState(() {
                            selectedValueSort = value;
                          });
                        }
                      },
                      items: const [
                        DropdownMenuItem(
                          value: 0,
                          child: Text('Sort By '),
                        ),
                        DropdownMenuItem(
                          value: 1,
                          child: Text('Latest First '),
                        ),
                        DropdownMenuItem(
                          value: 2,
                          child: Text('Oldest First '),
                        ),
                        DropdownMenuItem(
                          value: 3,
                          child: Text('Alphabetic '),
                        ),
                        DropdownMenuItem(
                          value: 4,
                          child: Text('Highest First '),
                        ),
                        DropdownMenuItem(
                          value: 5,
                          child: Text('Lowest First '),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            color: Theme.of(context).backgroundColor.withOpacity(0.9),
            child: Container(
              width: double.infinity,
              height: Get.height * .05,
              color: MyAppColors.appPrimaryColor.withOpacity(.1),
              padding: const EdgeInsets.only(top: 8, left: 12),
              child: const Text(
                'Available items',
                style:
                TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
          )
        ],
      ),
      collapseMode: CollapseMode.pin,
    ),
    ),
    isGridView
    ? SliverGrid(
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    childAspectRatio: .68,
    // childAspectRatio: 1,
    // mainAxisExtent: ,
    // mainAxisExtent: Get.height*.1,
    crossAxisSpacing: 5,
    mainAxisSpacing: 10),
    delegate: SliverChildBuilderDelegate(
    childCount: myDummyCatalogData.length,
    // addRepaintBoundaries: true,
    (_, index) {
    return ItemsGridBuilder(
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
    )
        : SliverList(
    delegate: SliverChildBuilderDelegate(
    childCount: myDummyCatalogData.length,
    (_, index) {
    return Container(
    margin: const EdgeInsets.only(bottom: 10),
    child: ItemsListBuilder(
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
}
