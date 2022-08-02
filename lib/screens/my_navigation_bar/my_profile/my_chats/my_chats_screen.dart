import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../../../../theme_shared_preferences/theme_provider.dart';
import 'my_chat_widget.dart';
import 'chat_data.dart';
import 'single_chat_screen.dart';

class MyChatsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var themeNotifier = Provider.of<MyThemeModel>(context);
    return Scaffold(
      backgroundColor: themeNotifier.isDark
          ? Theme.of(context).primaryColorDark.withOpacity(0.42)
          : Colors.grey.shade200,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                const SizedBox(height: 20),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  reverse: true,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        InkWell(
                          onTap: () => Get.to(SingleChatScreen(index)),
                          child: MyChatWidget(
                            profileName: myChatsDummyData[index].profileName,
                            lastMessage: myChatsDummyData[index].lastMessage,
                            profileImagePath:
                                myChatsDummyData[index].profileImagePath,
                            messageTime: myChatsDummyData[index].messageTime,
                            isOnline: myChatsDummyData[index].isOnline,
                            isMessageRead: myChatsDummyData[index].isTextRead,
                          ),
                        ),
                        const Divider()
                      ],
                    );
                  },
                  itemCount: myChatsDummyData.length,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
