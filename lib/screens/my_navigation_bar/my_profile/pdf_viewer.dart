import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../../theme_shared_preferences/theme_provider.dart';
import '../../../utils/my_app_colors.dart';

class MyPDFViewer extends StatefulWidget {
  const MyPDFViewer({Key? key, required this.pageTitle, required this.pdfPath}) : super(key: key);

  final String pageTitle,pdfPath;
  @override
  State<MyPDFViewer> createState() => _MyPDFViewerState();
}

class _MyPDFViewerState extends State<MyPDFViewer> {
  @override
  Widget build(BuildContext context) {
    var themeNotifier = Provider.of<MyThemeModel>(context);
    return Scaffold(
      backgroundColor: themeNotifier.isDark
          ? Theme.of(context).primaryColorDark.withOpacity(0.42)
          : Colors.grey.shade200,
      appBar: AppBar(
        title: Text(
          widget.pageTitle,
          style: Theme.of(context).textTheme.headline6,
        ),
        actionsIconTheme: Theme.of(context).appBarTheme.actionsIconTheme,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Theme.of(context).iconTheme.color,
            size: 20,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: JumpingText(
              'Edam',
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: MyAppColors.appPrimaryColor),
            ),
          )
        ],
        backgroundColor: Theme.of(context).backgroundColor,
        elevation: 0,
      ),
      body: SfPdfViewer.asset(
        widget.pdfPath,
        canShowScrollHead: true,
        scrollDirection: PdfScrollDirection.vertical,
        canShowPaginationDialog: true,
        enableDoubleTapZooming: true,
        canShowScrollStatus: true,
        interactionMode: PdfInteractionMode.selection,
        pageLayoutMode: PdfPageLayoutMode.continuous,
      ),
    );
  }
}
