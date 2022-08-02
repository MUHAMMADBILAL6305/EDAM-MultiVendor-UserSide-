import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyLargeButton extends StatelessWidget {
  const MyLargeButton(
      {Key? key,
      required this.title,
      required this.onTap,
      required this.buttonColor,
      this.titleColor = Colors.white,
      this.borderColor = Colors.transparent,
      this.isShadow = true})
      : super(key: key);

  final bool isShadow;
  final Color buttonColor, titleColor, borderColor;
  final String? title;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          height: Get.height * .05,
          decoration: BoxDecoration(
              color: buttonColor,
              borderRadius: BorderRadius.circular(60),
              border: Border.all(color: borderColor),
              boxShadow: isShadow
                  ? [
                      BoxShadow(
                          color: const Color.fromRGBO(247, 97, 10, 0.3)
                              .withOpacity(0.3),
                          blurRadius: 8,
                          offset: const Offset(0.0, 0.0))
                    ]
                  : null),
          child: Center(
            child: Text(
              title!,
              style: TextStyle(
                  color: titleColor,
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
          )),
    );
  }
}
