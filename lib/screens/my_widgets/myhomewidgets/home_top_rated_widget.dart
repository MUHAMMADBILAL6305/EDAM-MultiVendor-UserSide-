import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import '../../../utils/my_app_colors.dart';

class TopRatedCustomWidget extends StatefulWidget {
  TopRatedCustomWidget(
      {Key? key,
      required this.imagePath,
      required this.titleName,
      required this.location,
      required this.rating,
      required this.isFavorite,
      required this.onTap,
      required this.price})
      : super(key: key);
  final Function() onTap;
  final String imagePath, titleName, location;
  double rating;
  final double price;
  final bool isFavorite;

  @override
  State<TopRatedCustomWidget> createState() => _TopRatedCustomWidgetState();
}

class _TopRatedCustomWidgetState extends State<TopRatedCustomWidget> {
  @override
  void initState() {
    setState(() {
      if (widget.rating > 5.0) {
        widget.rating = 5.0;
      } else if (widget.rating < 1.0) {
        widget.rating = 1.0;
      } else {
        widget.rating = widget.rating;
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: Get.height * .34,
      //260,
      padding: const EdgeInsets.only(bottom: 12),
      margin: const EdgeInsets.only(left: 10, right: 10, top: 6, bottom: 6),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.withOpacity(0.3))),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: Get.height * .2399,
            child: Stack(
              children: [
                Container(
                  height: Get.height * .213,
                  margin: const EdgeInsets.only(top: 4, right: 4, left: 4),
                  width: Get.width,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(widget.imagePath),
                          fit: BoxFit.cover)),
                ),
                Positioned(
                  top: 10,
                  right: 5,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(.6),
                        border: Border.all(color: MyAppColors.appPrimaryColor),
                        borderRadius: BorderRadius.circular(12)),
                    padding: const EdgeInsets.all(2),
                    child: Icon(
                      Icons.favorite,
                      size: 40,
                      color: MyAppColors.appPrimaryColor,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 10,
                  child: Container(
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                        border: Border.all(color: MyAppColors.appPrimaryColor),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      " \$${widget.price.toString()}",
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: 20, color: MyAppColors.appPrimaryColor),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 18.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: SizedBox(
                        width: Get.width * .5,
                        child: Text(
                          widget.titleName,
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .copyWith(fontSize: 17),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 18.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: SizedBox(
                        width: Get.width * .5,
                        // color: Colors.yellow,
                        child: Text(
                          widget.location,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(color: MyAppColors.guestButtonColor),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 18, bottom: 2),
                    child: Row(
                      children: [
                        Text(
                          "(${widget.rating.toString()})",
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        const SizedBox(
                          width: 7,
                        ),
                        RatingBarIndicator(
                          rating: widget.rating,
                          itemBuilder: (context, index) => Icon(
                            Icons.star,
                            color: MyAppColors.appPrimaryColor,
                          ),
                          itemCount: 5,
                          itemSize: 20.0,
                          direction: Axis.horizontal,
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              InkWell(
                onTap: widget.onTap,
                child: Padding(
                  padding: const EdgeInsets.only(right: 18.0),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 6, horizontal: 10),
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
                          Text('Visit Shop'),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 15,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
