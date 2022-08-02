import 'package:flutter/material.dart';
import 'package:multi_vendor_edam/theme_shared_preferences/theme_provider.dart';
import 'package:multi_vendor_edam/utils/my_app_colors.dart';
import 'package:provider/provider.dart';

class MyTextFormField extends StatefulWidget {
  const MyTextFormField(
      {Key? key,
      required this.titleText,
      required this.hintText,
      required this.myController,
      this.errorText,
      this.isPassword = false,
      this.isNumeric = false})
      : super(key: key);

  final String? titleText, hintText, errorText;
  final TextEditingController myController;
  final bool isPassword, isNumeric;

  @override
  State<MyTextFormField> createState() => _MyTextFormFieldState();
}

class _MyTextFormFieldState extends State<MyTextFormField> {
  bool _isHidden = true;

  void passwordWrapper() {
    if (widget.isPassword == true) {
      _isHidden = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    var themeNotifier = Provider.of<MyThemeModel>(context);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        // textAlign: TextAlign.center,
        style: const TextStyle(color: Colors.black, fontSize: 15),
        controller: widget.myController,
        keyboardType:
            widget.isNumeric ? TextInputType.number : TextInputType.text,
        obscureText: widget.isPassword ? _isHidden : false,
        validator: (text) {
          if (text == null || text.isEmpty) {
            return 'Field is empty!';
          } else if (widget.isPassword == true && text.length <= 5) {
            return 'Password must be at-least 6 characters!';
          }
          return null;
        },
        decoration: InputDecoration(
          // counterStyle: TextStyle(color: Colors.red),
          errorText: widget.errorText,
          suffix: widget.isPassword
              ? InkWell(
                  onTap: _togglePasswordView,
                  child: Icon(
                    _isHidden
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    color: Colors.grey, //const Color(0xff979797),
                    size: 20,
                  ),
                )
              : null,
          labelText: widget.titleText,
          labelStyle: themeNotifier.isDark
              ?  TextStyle(
              backgroundColor: Colors.grey.shade100,
              color: Colors.black26)
              : TextStyle(fontSize: 14, color: Theme.of(context).hintColor),
          hintText: widget.hintText,
          hintStyle: const TextStyle(fontSize: 14, color: Colors.grey),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(
              width: .1,
              color: MyAppColors.appPrimaryColor,
              style: BorderStyle.solid,
            ),
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: MyAppColors.appPrimaryColor)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  width: 2,
                  color: MyAppColors.appPrimaryColor)),
          filled: true,
          contentPadding: const EdgeInsets.all(16),
          fillColor: Colors.grey.shade100,
        ),
      ),
    );
  }

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }
}
