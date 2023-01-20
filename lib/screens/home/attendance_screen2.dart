import 'dart:developer';
import 'dart:io';

import 'package:demo/utils/file_picker_utils.dart';
import 'package:demo/widgets/map.dart';
import 'package:demo/widgets/page_heading.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AttendanceScreen2 extends StatefulWidget {
  const AttendanceScreen2({Key? key}) : super(key: key);

  @override
  State<AttendanceScreen2> createState() => _AttendanceScreen2State();
}

class _AttendanceScreen2State extends State<AttendanceScreen2> {
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        dateBox(),
                        timeBox(),
                      ],
                    ),
                    const SizedBox(height: 15),

                    // take photo
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size.zero,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 5),
                        fixedSize:
                            Size(MediaQuery.of(context).size.width * 0.5, 35),
                        // tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        primary: const Color.fromRGBO(0, 106, 183, 1),
                      ),
                      onPressed: () async {
                        var temp = await MyFilePickerUtil().fromCamera();
                        if (temp != null) {
                          setState(() {
                            photo = temp;
                          });
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        // mainAxisSize: MainAxisSize.max,
                        children: const [
                          Text("Take Photo"),
                          SizedBox(width: 15),
                          Icon(Icons.camera_alt_outlined)
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: MyMap(searchCtrl: searchCtrl),
                    ),
                    const SizedBox(height: 15),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size.zero,
                        padding: const EdgeInsets.all(5),
                        fixedSize:
                            Size(MediaQuery.of(context).size.width * 0.8, 50),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        primary: const Color.fromRGBO(0, 106, 183, 1),
                      ),
                      onPressed: () {},
                      child: const FittedBox(
                        child: Text(
                          "Save",
                          textScaleFactor: 1.5,
                        ),
                      ),
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
