import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyButton extends StatelessWidget {

  const MyButton({
    this.imagePath,
    this.onTap,
  });

  final String? imagePath;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
          padding: const EdgeInsets.all(4),
          height: Get.height * .05,
          width: Get.width * .3,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(60),
              border: Border.all(color: Colors.black12)),
          child: Center(
            child: Image.asset(imagePath!),
          )),
      onTap: onTap,
    );
  }
}
