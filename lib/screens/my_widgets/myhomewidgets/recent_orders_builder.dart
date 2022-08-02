import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_vendor_edam/demoData/catalog_data.dart';
import 'package:multi_vendor_edam/demoData/orders_data.dart';
import '../../../utils/my_app_colors.dart';

class RecentOrdersBuilder extends StatelessWidget {
  const RecentOrdersBuilder(
      {Key? key, required this.onTap, required this.index})
      : super(key: key);

  final Function() onTap;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: (Get.height * .3),
      width: Get.width * .8,

      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
        borderRadius: BorderRadius.circular(20),
        // boxShadow: [
        //   BoxShadow(
        //       color: Colors.grey.shade300,
        //       offset: const Offset(-2, -1),
        //       blurRadius: 5),
        // ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Total Payment:",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "\$${myDummyCatalogData[index].price.toString()}",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Status:",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    myOrdersDemoData[index].isPending
                        ? 'PENDING'
                        : myOrdersDemoData[index].isInProcess
                            ? 'IN-PROCESS'
                            : myOrdersDemoData[index].isCompleted
                                ? 'COMPLETED'
                                : myOrdersDemoData[index].isCancelled
                                    ? 'CANCELLED'
                                    : 'Error Loading!',
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        color: myOrdersDemoData[index].isPending
                            ? MyAppColors.appPrimaryColor
                            : myOrdersDemoData[index].isInProcess
                                ? Colors.blue
                                : myOrdersDemoData[index].isCompleted
                                    ? Colors.green
                                    : myOrdersDemoData[index].isCancelled
                                        ? Colors.orangeAccent
                                        : Theme.of(context)
                                            .textTheme
                                            .labelLarge!
                                            .color,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  // Text(
                  //   myOrdersDemoData[index].isCompleted
                  //       ? "Completed"
                  //       : "Pending",
                  //   style: Theme.of(context)
                  //       .textTheme
                  //       .bodyText1!
                  //       .copyWith(color: Colors.green),
                  // ),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            "Description:",
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          SizedBox(
              width: Get.width * .6,
              child: const Text(
                  "Lorem ipsum dolor sit amet, adipiscing elit. Blandit lobortis diam arcu a vulputate.")),
          const SizedBox(
            height: 12,
          ),
          Text(
            "Date Time:",
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          Text(DateTime.now().toString().substring(0, 19)),
          const SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Quantity:",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  Text("${myDummyCatalogData[index].rating.toString()} KG"),
                ],
              ),
              InkWell(
                onTap: onTap,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: MyAppColors.appPrimaryColor.withOpacity(.2),
                    border: Border.all(
                        color: MyAppColors.appPrimaryColor, width: 0.5),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text('Reorder'),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 15,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
