import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../theme_shared_preferences/theme_provider.dart';
import '../../../../utils/my_app_colors.dart';

class MyChatWidget extends StatelessWidget {
  const MyChatWidget(
      {Key? key,
      required this.profileImagePath,
      required this.profileName,
      required this.lastMessage,
      required this.messageTime,
      required this.isMessageRead,
      required this.isOnline})
      : super(key: key);

  final String profileImagePath, profileName, lastMessage, messageTime;
  final bool isMessageRead, isOnline;

  @override
  Widget build(BuildContext context) {
    var themeNotifier = Provider.of<MyThemeModel>(context);
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 12),
          height: 53,
          width: 53,
          child: Stack(children: [
            CircleAvatar(
              backgroundColor: MyAppColors.appPrimaryColor,
              radius: 50,
              child: ClipOval(
                child: Image.asset(profileImagePath,
                    fit: BoxFit.cover, width: 51.0, height: 51.0),
              ),
            ),
            isOnline
                ? Positioned(
                    bottom: 4,
                    right: 4,
                    child: Container(
                      height: 12,
                      width: 12,
                      decoration: BoxDecoration(
                          color: Colors.green,
                          border: Border.all(color: Colors.white, width: 1.5),
                          borderRadius: BorderRadius.circular(60)),
                    ))
                : Container(),
          ]),
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              profileName,
              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 4),
            Text(
              lastMessage + '   -' + messageTime,
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                  color: themeNotifier.isDark
                      ? isMessageRead
                          ? Colors.grey
                          : Colors.white30
                      : isMessageRead
                          ? Colors.black26
                          : Colors.black),
            ),
          ],
        )
      ],
    );
  }
}
