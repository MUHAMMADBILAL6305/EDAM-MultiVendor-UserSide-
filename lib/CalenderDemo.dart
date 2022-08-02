// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:syncfusion_flutter_calendar/calendar.dart';
//
// class CalenderDemo extends StatelessWidget {
//
//   const CalenderDemo({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text('CalenderDemo'),
//         ),
//         body: Column(
//           children: [
//             IconButton(
//               onPressed: () {
//                 showModalBottomSheet(
//                     isScrollControlled: true,
//                     enableDrag: true,
//                     elevation: 0,
//                     backgroundColor: Colors.transparent,
//                     context: context,
//                     builder: (context) {
//                       return const CalenderBottomSheet();
//                     });
//               },
//               icon: const Icon(Icons.calendar_today_rounded),
//               // ElevatedButton(
//               //   onPressed: () {
//               //
//               //     myCalender();
//               //   },
//               //   child: const Text("CalenderShow"),
//               // ),
//             )
//           ],
//         ));
//   }
// }
//
// Widget myCalender() {
//   return SfCalendar(
//     view: CalendarView.month,
//
//     timeZone: 'Japanese(jp)',
//     dragAndDropSettings: const DragAndDropSettings(
//       allowNavigation: true,
//     ),
//     // allowDragAndDrop: true,
//     // allowViewNavigation: true,
//     // onTap: (calendarTapDetails) {
//     //   _calendarController.displayDate ==
//     //       calendarTapDetails.targetElement;
//     // },
//     showNavigationArrow: true,
//     // showDatePickerButton: true,
//     cellBorderColor: Colors.transparent,
//     todayHighlightColor: Colors.teal,
//
//     viewHeaderHeight: 50,
//     // headerHeight: 40,
//     // cellEndPadding: 50,
//     // selectionDecoration: ,
//     headerDateFormat: 'MMM yyyy',
//     monthViewSettings: const MonthViewSettings(
//         // agendaStyle: AgendaStyle(
//         //     dayTextStyle: TextStyle(
//         //         color: Colors.black, fontWeight: FontWeight.bold)),
//         monthCellStyle: MonthCellStyle(
//             textStyle: TextStyle(
//                 // height: 3,
//                 fontWeight: FontWeight.w400,
//                 color: Colors.black)),
//         // showAgenda: true,
//         dayFormat: "E",
//
//         // numberOfWeeksInView: 5,
//         showTrailingAndLeadingDates: false,
//         agendaViewHeight: 5),
//     firstDayOfWeek: 1,
//
//     selectionDecoration: BoxDecoration(
//       shape: BoxShape.circle,
//       // borderRadius: BorderRadius.all(Radius.circular(12)),
//       border: Border.all(
//         color: Colors.teal,
//       ),
//     ),
//     controller: CalendarController(),
//   );
// }
//
// class CalenderBottomSheet extends StatefulWidget {
//   const CalenderBottomSheet({Key? key}) : super(key: key);
//
//   @override
//   _CalenderBottomSheetState createState() => _CalenderBottomSheetState();
// }
//
// class _CalenderBottomSheetState extends State<CalenderBottomSheet> {
//   @override
//   Widget build(BuildContext context) {
//     // var themeNotifier = Provider.of<ThemeModel>(context);
//     return Container(
//       color: Colors.transparent,
//       child: Container(
//         margin: EdgeInsets.only(
//             left: Get.height * .015,
//             right: Get.height * .015,
//             top: Get.height * .3,
//             bottom: Get.height * .149),
//         padding: EdgeInsets.all(Get.height * .02),
//         decoration: BoxDecoration(
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.grey.withOpacity(0.5),
//                 spreadRadius: 5,
//                 blurRadius: 7,
//                 offset: const Offset(0, 3), // changes position of shadow
//               ),
//             ],
//             color: Colors.white,
//             //,Theme.of(context).bottomSheetTheme.backgroundColor,
//             borderRadius: BorderRadius.circular(12)),
//         child: Column(
//           children: [
//             myCalender(),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * .05,
//             ),
//             Align(
//               alignment: Alignment.topRight,
//               child: TextButton(
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//                 child: const Text(
//                   "Eingeben",
//                   style: TextStyle(
//                     color: Colors.teal,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
