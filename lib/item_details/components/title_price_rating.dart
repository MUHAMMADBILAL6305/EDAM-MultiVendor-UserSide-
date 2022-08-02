import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

import '../../utils/my_app_colors.dart';

class TitlePriceRating extends StatelessWidget {
  final int numOfReviews;
  final double rating, price;
  final String name;

  // final RatingChangeCallback onRatingChanged;

  const TitlePriceRating({
    Key? key,
    required this.price,
    required this.numOfReviews,
    required this.rating,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        const SizedBox(width: 4),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: Get.height * .01),
              Text(
                name,
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text("($numOfReviews) reviews"),
              const SizedBox(height: 4),
              Row(
                children: <Widget>[
                  Text("($rating) "),
                  // const SizedBox(width: 2),
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
                ],
              ),
            ],
          ),
        ),
        priceTag(context, price: price),
      ],
    );
  }

  ClipPath priceTag(BuildContext context, {required double price}) {
    return ClipPath(
      clipper: PricerClipper(),
      child: Container(
        alignment: Alignment.topCenter,
        padding: const EdgeInsets.symmetric(vertical: 15),
        height: 80,
        width: 80,
        color: MyAppColors.appPrimaryColor,
        child: Text(
          "\$$price/kg",
          style: Theme.of(context).textTheme.headline6!.copyWith(
              fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class PricerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    double ignoreHeight = 20;
    path.lineTo(0, size.height - ignoreHeight);
    path.lineTo(size.width / 2, size.height);
    path.lineTo(size.width, size.height - ignoreHeight);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
