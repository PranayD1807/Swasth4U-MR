import 'dart:developer';
import 'dart:io';

import 'package:demo/screens/home/attendance_screen2.dart';
import 'package:demo/utils/file_picker_utils.dart';
import 'package:demo/widgets/map.dart';
import 'package:demo/widgets/page_heading.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({Key? key}) : super(key: key);

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  final TextEditingController dateCtrl = TextEditingController();
  final TextEditingController timeCtrl = TextEditingController();

  File? photo;
  TextEditingController searchCtrl = TextEditingController();

  List<DateTime> presentDates = [
    DateTime(2022, 6, 25),
    DateTime(2022, 6, 10),
    DateTime(2022, 6, 20),
    DateTime(2022, 6, 15),
    DateTime(2022, 6, 18),
    DateTime(2022, 6, 22),
  ];
  List<DateTime> absentDates = [
    DateTime(2022, 6, 24),
    DateTime(2022, 6, 16),
    DateTime(2022, 6, 17),
    DateTime(2022, 6, 19),
  ];
  List<DateTime> holidayDates = [
    DateTime(2022, 6, 11),
    DateTime(2022, 6, 13),
    DateTime(2022, 6, 21),
  ];
  DateTime current = DateTime.now();

  Widget calendar(BuildContext context) {
    Stream<DateTime> timer = Stream.periodic(const Duration(seconds: 1), (i) {
      // current = current.add(const Duration(seconds: 50));
      final now = DateTime.now();
      return now;
    });

    String date = DateFormat("dd MMMM yyyy").format(current);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 25),
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color.fromRGBO(0, 106, 183, 1),
          width: 1.5,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            width: double.maxFinite,
            color: const Color.fromRGBO(0, 106, 183, 1),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Today Date  :-  $date",
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                StreamBuilder<DateTime>(
                    stream: timer,
                    builder: (context, AsyncSnapshot<DateTime> snapshot) {
                      return Text(
                        snapshot.connectionState != ConnectionState.waiting
                            ? "Current Time :- ${TimeOfDay.fromDateTime(snapshot.data!).format(context)}"
                            : "Current Time :- ${TimeOfDay.fromDateTime(DateTime.now()).format(context)}",
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    }),
              ],
            ),
          ),
          SfCalendar(
            monthViewSettings: const MonthViewSettings(
              dayFormat: DateFormat.ABBR_WEEKDAY,
            ),
            onSelectionChanged: null,
            selectionDecoration: const BoxDecoration(),
            minDate: DateTime(DateTime.now().year),
            showNavigationArrow: true,
            backgroundColor: const Color.fromRGBO(236, 247, 255, 1),
            viewHeaderStyle: const ViewHeaderStyle(
                dayTextStyle: TextStyle(color: Color.fromRGBO(0, 106, 183, 1)),
                dateTextStyle:
                    TextStyle(color: Color.fromRGBO(0, 106, 183, 1))),
            headerStyle: const CalendarHeaderStyle(
              // backgroundColor: Color.fromRGBO(0, 106, 183, 1),
              backgroundColor: Colors.white,
              textAlign: TextAlign.center,
              textStyle: TextStyle(
                // color: Colors.white,
                color: Color.fromRGBO(0, 106, 183, 1),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            monthCellBuilder:
                (BuildContext buildContext, MonthCellDetails details) {
              DateTime today = DateTime.now();
              bool isPresent = presentDates.contains(details.date);
              bool isAbsent = absentDates.contains(details.date);
              bool isHoliday = holidayDates.contains(details.date);
              bool isToday =
                  DateTime(today.year, today.month, today.day) == details.date;
              return Padding(
                padding: const EdgeInsets.all(2.0),
                child: CircleAvatar(
                  backgroundColor: isPresent
                      ? Colors.green
                      : isAbsent
                          ? Colors.red
                          : isHoliday
                              ? Colors.yellow
                              : isToday
                                  ? Colors.blue
                                  : Colors.transparent,
                  child: Center(
                    child: Text(
                      details.date.day.toString(),
                      style: TextStyle(
                        color: isToday || isAbsent || isPresent
                            ? Colors.white
                            : const Color.fromRGBO(0, 106, 183, 1),
                      ),
                    ),
                  ),
                ),
              );
            },
            todayHighlightColor: Colors.blue,
            view: CalendarView.month,
          ),
        ],
      ),
    );
  }

  Widget infobar(String text, String val, Color color) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      width: MediaQuery.of(context).size.width * 0.85,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      color: color,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            textAlign: TextAlign.justify,
            textScaleFactor: 1.3,
            style: TextStyle(
                color: color == Colors.yellow ? Colors.black : Colors.white),
          ),
          Text(
            "=",
            textAlign: TextAlign.justify,
            textScaleFactor: 1.3,
            style: TextStyle(
                color: color == Colors.yellow ? Colors.black : Colors.white),
          ),
          Text(
            val,
            textAlign: TextAlign.justify,
            textScaleFactor: 1.3,
            style: TextStyle(
                color: color == Colors.yellow ? Colors.black : Colors.white),
          ),
        ],
      ),
    );
  }

  Widget timeBox() {
    double width = MediaQuery.of(context).size.width * 0.44;
    return Card(
      elevation: 3,
      child: SizedBox(
        width: width,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              width: width,
              height: 50,
              padding: const EdgeInsets.only(left: 15),
              decoration: const BoxDecoration(
                color: Color.fromRGBO(0, 106, 183, 1),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5),
                  topRight: Radius.circular(5),
                ),
              ),
              child: const Text(
                "Enter Time",
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: width * 0.9,
              child: TextFormField(
                readOnly: true,
                controller: timeCtrl,
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return "Enter Time";
                  } else {
                    try {
                      // DateFormat('MM/dd/yy').parse(val);
                    } catch (e) {
                      return "Enter Correct Time";
                    }
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  suffix: IconButton(
                    constraints: BoxConstraints(),
                    onPressed: null,
                    icon: Icon(
                      Icons.access_time_rounded,
                      color: Color.fromRGBO(0, 106, 183, 1),
                      size: 18,
                    ),
                  ),
                  fillColor: Color.fromRGBO(33, 33, 33, 0.08),
                  filled: true,
                  labelStyle: TextStyle(
                    fontSize: 12,
                    color: Color.fromRGBO(0, 106, 183, 1),
                  ),
                  labelText: "Enter Time",
                  hintText: "HH:MM",
                  contentPadding: EdgeInsets.only(left: 10, top: 5, bottom: 5),
                ),
                keyboardType: TextInputType.datetime,
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget dateBox() {
    double width = MediaQuery.of(context).size.width * 0.44;
    return Card(
      elevation: 3,
      child: SizedBox(
        width: width,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              width: width,
              height: 50,
              padding: const EdgeInsets.only(left: 15),
              decoration: const BoxDecoration(
                color: Color.fromRGBO(0, 106, 183, 1),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5),
                  topRight: Radius.circular(5),
                ),
              ),
              child: const Text(
                "Enter date",
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: width * 0.9,
              child: TextFormField(
                readOnly: true,
                controller: dateCtrl,
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return "Enter Date";
                  } else {
                    try {
                      DateFormat('MM/dd/yy').parse(val);
                    } catch (e) {
                      return "Enter Correct Date";
                    }
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  suffix: IconButton(
                    constraints: BoxConstraints(),
                    onPressed: null,
                    icon: Icon(
                      Icons.calendar_today,
                      color: Color.fromRGBO(0, 106, 183, 1),
                      size: 18,
                    ),
                  ),
                  fillColor: Color.fromRGBO(33, 33, 33, 0.08),
                  filled: true,
                  labelStyle: TextStyle(
                    fontSize: 12,
                    color: Color.fromRGBO(0, 106, 183, 1),
                  ),
                  labelText: "Enter Date",
                  hintText: "mm/dd/yy",
                  contentPadding: EdgeInsets.only(left: 10, top: 5, bottom: 5),
                ),
                keyboardType: TextInputType.datetime,
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    dateCtrl.text = DateFormat("MM/dd/yy").format(now);
    timeCtrl.text = TimeOfDay.now().format(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        foregroundColor: Colors.blue,
        backgroundColor: Colors.transparent,
        title: Align(
            alignment: Alignment.centerRight,
            child: SizedBox(height: 35, child: Image.asset("assets/logo.png"))),
        // centerTitle: true,
        automaticallyImplyLeading: true,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.keyboard_arrow_left_outlined),
        ),
      ),
      body: Column(
        children: <Widget>[
          const PageHeading(
            text: "Attendance",
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 15),

                    infobar("Total Present", "20 Days", Colors.green),
                    infobar("Total Absent", "20 Days", Colors.red),
                    infobar("Holidays", "20 Days", Colors.yellow),

                    // Calender
                    calendar(context),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        dateBox(),
                        timeBox(),
                      ],
                    ),
                    const SizedBox(height: 25),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size.zero,
                            padding: const EdgeInsets.all(5),
                            fixedSize: Size(
                                MediaQuery.of(context).size.width * 0.4, 50),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            primary: const Color.fromRGBO(0, 106, 183, 1),
                          ),
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const AttendanceScreen2(),
                              ),
                            );
                          },
                          child: const FittedBox(
                            child: Text(
                              "Mark In",
                              textScaleFactor: 1.5,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size.zero,
                            padding: const EdgeInsets.all(5),
                            fixedSize: Size(
                                MediaQuery.of(context).size.width * 0.4, 50),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            primary: const Color.fromRGBO(0, 106, 183, 1),
                          ),
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const AttendanceScreen2(),
                              ),
                            );
                          },
                          child: const FittedBox(
                            child: Text(
                              "Mark Out",
                              textScaleFactor: 1.5,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Heading extends StatelessWidget {
  const _Heading({Key? key, required this.text}) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0, bottom: 10),
      child: Align(
        alignment: Alignment.centerLeft,
        child: ConstrainedBox(
          constraints:
              BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.8),
          child: Text(
            text,
            textScaleFactor: 1.2,
          ),
        ),
      ),
    );
  }
}
