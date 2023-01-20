import 'dart:math';

import 'package:demo/widgets/map.dart';
import 'package:demo/widgets/page_heading.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class WorkReportScreen extends StatefulWidget {
  const WorkReportScreen({Key? key}) : super(key: key);

  @override
  State<WorkReportScreen> createState() => _WorkReportScreenState();
}

class _WorkReportScreenState extends State<WorkReportScreen> {
  final formKey = GlobalKey<FormState>();
  InputDecoration inputDecoration(String hintText) => InputDecoration(
        constraints: const BoxConstraints(),
        isDense: true,
        fillColor: Colors.white,
        filled: true,
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 1,
            color: Colors.red,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        hintText: hintText,
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 1,
            color: Colors.red,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 1, color: Colors.black),
          borderRadius: BorderRadius.circular(5),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 1, color: Colors.black),
          borderRadius: BorderRadius.circular(5),
        ),
      );

  // controllers
  final TextEditingController firmNameCtrl = TextEditingController();
  final TextEditingController doctorNameCtrl = TextEditingController();
  final TextEditingController addressCtrl = TextEditingController();
  final TextEditingController responseCtrl = TextEditingController();
  final TextEditingController numberCtrl = TextEditingController();
  final TextEditingController searchCtrl = TextEditingController();

  final TextEditingController dateCtrl = TextEditingController();
  final TextEditingController timeCtrl = TextEditingController();

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
      body: Form(
        key: formKey,
        child: Column(
          children: <Widget>[
            const PageHeading(
              text: "Work Report",
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 15),
                      const _Heading(text: "Firm Name"),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value == "") {
                            return "Enter Firm Name";
                          }
                          return null;
                        },
                        controller: firmNameCtrl,
                        decoration: inputDecoration("Firm Name"),
                      ),
                      const _Heading(text: "Doctor Name"),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value == "") {
                            return "Enter Doctor Name";
                          }
                          return null;
                        },
                        controller: doctorNameCtrl,
                        decoration: inputDecoration("Doctor Name"),
                      ),
                      const _Heading(text: "Doctor Mobile Number"),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value == "") {
                            return "Enter Mobile Number";
                          }
                          return null;
                        },
                        controller: numberCtrl,
                        decoration: inputDecoration("Mobile Number"),
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          dateBox(),
                          timeBox(),
                        ],
                      ),
                      const _Heading(text: "Address"),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value == "") {
                            return "Enter Address";
                          }
                          return null;
                        },
                        controller: addressCtrl,
                        maxLines: 3,
                        decoration: inputDecoration("Address"),
                      ),
                      const _Heading(text: "Response"),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value == "") {
                            return "Enter Response";
                          }
                          return null;
                        },
                        controller: responseCtrl,
                        maxLines: 10,
                        decoration: inputDecoration("Response"),
                      ),
                      const SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        child: MyMap(searchCtrl: searchCtrl),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size.zero,
                          padding: const EdgeInsets.all(5),
                          fixedSize:
                              Size(MediaQuery.of(context).size.width * 0.8, 50),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          primary: const Color.fromRGBO(0, 106, 183, 1),
                        ),
                        onPressed: () {
                          formKey.currentState!.validate();
                        },
                        child: const FittedBox(
                          child: Text(
                            "Send",
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
                    // onPressed: () async {
                    //   TimeOfDay? time = await showTimePicker(
                    //     context: context,
                    //     initialTime: TimeOfDay.now(),
                    //   );
                    //   if (time != null) {
                    //     // ignore: use_build_context_synchronously
                    //     timeCtrl.text = time.format(context);
                    //   }
                    // },
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
                    // onPressed: () async {
                    //   DateTime? date = await showDatePicker(
                    //     context: context,
                    //     initialDate: DateTime.now(),
                    //     firstDate: DateTime.now().subtract(
                    //       const Duration(days: 365),
                    //     ),
                    //     lastDate: DateTime.now().add(
                    //       const Duration(hours: 1),
                    //     ),
                    //   );
                    //   if (date != null) {
                    //     dateCtrl.text = DateFormat("MM/dd/yy").format(date);
                    //   }
                    // },
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
