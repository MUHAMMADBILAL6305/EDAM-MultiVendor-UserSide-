import 'package:flutter/material.dart';

class MyCircularCheckBox extends StatefulWidget {
  final double checkBoxSize;

  const MyCircularCheckBox({this.checkBoxSize = 24, Key? key})
      : super(key: key);

  @override
  _MyCircularCheckBoxState createState() => _MyCircularCheckBoxState();
}

class _MyCircularCheckBoxState extends State<MyCircularCheckBox> {
  bool value = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          value = !value;
        });
      },
      child: Container(
        height: widget.checkBoxSize,
        width: widget.checkBoxSize,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: value ? Colors.black38 : Colors.transparent,
          ),
          color: value ? Colors.transparent : Colors.blue,
        ),
        child: Center(
          child: value
              ? const Icon(
                  Icons.check,
                  size: 20.0,
                  color: Colors.white,
                )
              : const Icon(
                  Icons.check,
                  size: 15.0,
                  color: Colors.white,
                ),
        ),
      ),
    );
  }
}