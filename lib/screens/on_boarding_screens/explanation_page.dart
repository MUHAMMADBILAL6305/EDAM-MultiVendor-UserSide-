import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'explanation_data.dart';

class ExplanationPage extends StatelessWidget {

  const ExplanationPage({Key? key, required this.data}) : super(key: key);
  final ExplanationData data;
  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Image.asset(data.localImageSrc,
                height: data.imageHeight,
                width: data.imageWidth,
                alignment: Alignment.center),
          ),
          SizedBox(height: 20,),
          Text(
            data.title,
            style: const TextStyle(
              color: Color(0xff1A1A1A),
              fontWeight: FontWeight.w700,
              fontFamily: 'Poppins',
              fontSize: 24,
              fontStyle: FontStyle.normal,
              decoration: TextDecoration.none,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            data.description,
            style: const TextStyle(
              color: Color(0xff1A1A1A),
              fontWeight: FontWeight.w400,
              fontFamily: 'Poppins',
              fontSize: 16,
              fontStyle: FontStyle.normal,
              decoration: TextDecoration.none,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: Get.height*.05,)
        ]);
  }
}
