import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../../../../theme_shared_preferences/theme_provider.dart';
import '../../../../utils/my_app_colors.dart';
import 'chat_data.dart';
import 'single_chat_data.dart';

class SingleChatScreen extends StatefulWidget {
  const SingleChatScreen(this.index, {Key? key}) : super(key: key);
  final int index;

  @override
  _SingleChatScreenState createState() => _SingleChatScreenState();
}

class _SingleChatScreenState extends State<SingleChatScreen> {
  @override
  Widget build(BuildContext context) {
    var themeNotifier = Provider.of<MyThemeModel>(context);
    return Scaffold(
      backgroundColor: themeNotifier.isDark
          ? Theme.of(context).dividerColor
          : Colors.grey.shade200,
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Theme.of(context).backgroundColor,
        foregroundColor: Theme.of(context).primaryColor,
        title: Text(
          myChatsDummyData[widget.index].profileName,
          style: Theme.of(context).textTheme.headline6,
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Theme.of(context).iconTheme.color,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings_outlined),
            color: MyAppColors.appPrimaryColor,
          ),
        ],
      ),
      // bottomNavigationBar: ,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: Get.height -
                  (Get.mediaQuery.padding.top + kToolbarHeight) -
                  (57),
              child: Stack(children: [
                ListView.builder(
                  itemCount: singleUserChatDummy.length,
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Container(
                      width: double.infinity,
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, top: 5, bottom: 5),
                      child: singleUserChatDummy[index].messageType ==
                              "receiver"
                          ? receiverMessages(
                              messageContents:
                                  singleUserChatDummy[index].messageContent,
                              receiverProfileImagePath:
                                  myChatsDummyData[widget.index]
                                      .profileImagePath,
                              context: context)
                          : senderMessage(
                              messageContents:
                                  singleUserChatDummy[index].messageContent,
                              imagePath: myChatsDummyData[4].profileImagePath,
                              context: context),
                    );
                  },
                ),
              ]),
            ),
            Align(
                alignment: Alignment.bottomCenter, child: bottomMenus(context)),
          ],
        ),
      ),
    );
  }
}

Widget receiverMessages(
    {required String receiverProfileImagePath,
    required String messageContents,
    required BuildContext context}) {
  var themeNotifier = Provider.of<MyThemeModel>(context);
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      SizedBox(
        height: 35,
        width: 35,
        child: CircleAvatar(
          // ignore: sort_child_properties_last
          child: ClipOval(
            child: Image.asset(receiverProfileImagePath,
                fit: BoxFit.cover, width: 35.0, height: 35.0),
          ),
          radius: 60,
        ),
      ),
      const SizedBox(width: 5),
      Container(
        // height: 40,
        decoration: BoxDecoration(
            border: Border.all(color: MyAppColors.appPrimaryColor),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
              bottomRight: Radius.circular(12),
            ),
            color: themeNotifier.isDark ? Colors.grey : Colors.black12),
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
            child: Text(
              messageContents,
              style: const TextStyle(fontSize: 15, color: Colors.black),
            ),
          ),
        ),
      ),
    ],
  );
}

Widget senderMessage(
    {required String messageContents,
    required String imagePath,
    required BuildContext context}) {
  var themeNotifier = Provider.of<MyThemeModel>(context);
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      Container(
        // height: 40,
        width: Get.width * .8,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
                bottomLeft: Radius.circular(12)),
            color: themeNotifier.isDark
                ? MyAppColors.appPrimaryColor
                : MyAppColors.appPrimaryColor.withOpacity(0.8)),
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
            child: Text(
              messageContents,
              style: const TextStyle(fontSize: 15, color: Colors.white),
            ),
          ),
        ),
      ),
      const SizedBox(width: 5),
      SizedBox(
        height: 35,
        width: 35,
        child: CircleAvatar(
          child: ClipOval(
            child: Image.asset(imagePath,
                fit: BoxFit.cover, width: 35.0, height: 35.0),
          ),
          radius: 60,
        ),
      )
    ],
  );
}

Widget bottomMenus(context) {
  return Container(
    decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
        border: Border(
            top: BorderSide(
                color: MyAppColors.appPrimaryColor.withOpacity(0.3)))),
    // height: Get.height * .07,
    width: double.infinity,
    // color: Colors.red,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.camera_alt, color: MyAppColors.appPrimaryColor),
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 4),
            // padding: const EdgeInsets.only(bottom: 4),
            child: TextFormField(
              // expands: true,
              maxLines: 4,
              minLines: 1,

              decoration: InputDecoration(
                  // enabledBorder:InputBorder(),
                  contentPadding: EdgeInsets.all(Get.height * .01),
                  filled: true,
                  fillColor: Colors.grey.shade200,
                  enabled: true,
                  hintText: "Start typing...",
                  hintStyle: TextStyle(fontSize: 13, color: Colors.black54),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      width: 2,
                      // color: Colors.amberAccent,
                      // style: BorderStyle.solid,
                    ),
                  )),
              style: const TextStyle(color: Colors.black),
            ),
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.send, color: MyAppColors.appPrimaryColor, size: 28),
        ),
      ],
    ),
  );
}
