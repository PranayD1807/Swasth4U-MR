import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateFilterScreen extends StatefulWidget {
  const DateFilterScreen({Key? key}) : super(key: key);

  @override
  State<DateFilterScreen> createState() => _DateFilterScreenState();
}

class _DateFilterScreenState extends State<DateFilterScreen> {
  bool fromTo = false;
  bool yearToMonth = false;
  bool year = false;
  DateTime selectedYear = DateTime(2022);
  int selectedFilterType = 0;
  final List<String> months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];
  String? selectedMonth;
  final TextEditingController searchDate = TextEditingController();

  final TextEditingController fromDate = TextEditingController();
  final TextEditingController toDate = TextEditingController();
  final TextEditingController fromYear = TextEditingController();
  final TextEditingController fromYearMonth = TextEditingController();
  final TextEditingController yearOnly = TextEditingController();

  InputDecoration decoration(String hintText, Widget? suffix) {
    return InputDecoration(
      suffix: suffix,
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          width: 1,
          color: Colors.red,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      hintStyle: const TextStyle(color: Color.fromRGBO(196, 196, 196, 1)),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          width: 1,
          color: Colors.red,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      labelStyle: const TextStyle(
        color: Color.fromRGBO(79, 124, 177, 1),
      ),
      floatingLabelStyle:
          const TextStyle(color: Color.fromRGBO(79, 124, 177, 1), fontSize: 10),
      hintText: hintText,
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          width: 1,
          color: Color.fromRGBO(0, 175, 239, 1),
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          width: 1,
          color: Color.fromRGBO(0, 175, 239, 1),
        ),
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: const Color.fromRGBO(0, 106, 183, 1),
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          // height: MediaQuery.of(context).size.height * 0.7,
          width: MediaQuery.of(context).size.width * 0.9,
          // height: 100,
          // width: 100,
          child: Material(
            color: const Color.fromRGBO(236, 247, 255, 1),
            child: Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Stack(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.0),
                          child: DefaultTextStyle(
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(0, 106, 183, 1),
                            ),
                            child: Text(
                              "Date Filter",
                              textScaleFactor: 1.5,
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: const Icon(Icons.close),
                        ),
                      )
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                    ),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: TextFormField(
                        style: const TextStyle(fontSize: 15),
                        controller: searchDate,
                        keyboardType: TextInputType.datetime,
                        decoration: InputDecoration(
                          prefix: Padding(
                            padding:
                                const EdgeInsets.only(left: 10, right: 15.0),
                            child: IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.search),
                              iconSize: 20,
                              padding: EdgeInsets.zero,
                              constraints: const BoxConstraints(),
                            ),
                          ),
                          suffix: Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child: IconButton(
                              onPressed: () async {
                                DateTime? date = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1950),
                                  lastDate: DateTime.now()
                                      .add(const Duration(seconds: 5)),
                                );
                                if (date != null) {
                                  searchDate.text =
                                      DateFormat("dd/MM/yyyy").format(date);
                                }
                              },
                              icon: const ImageIcon(
                                AssetImage("assets/calender.png"),
                                color: Colors.blue,
                              ),
                              padding: EdgeInsets.zero,
                              constraints: const BoxConstraints(),
                              iconSize: 20,
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              width: 1,
                              color: Colors.red,
                            ),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          hintStyle: const TextStyle(
                              color: Color.fromRGBO(196, 196, 196, 1)),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              width: 1,
                              color: Colors.red,
                            ),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          labelStyle: const TextStyle(
                            color: Color.fromRGBO(79, 124, 177, 1),
                          ),
                          floatingLabelStyle: const TextStyle(
                              color: Color.fromRGBO(79, 124, 177, 1),
                              fontSize: 10),
                          hintText: "Search...",
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              width: 1,
                              color: Color.fromRGBO(0, 175, 239, 1),
                            ),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              width: 1,
                              color: Color.fromRGBO(0, 175, 239, 1),
                            ),
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Checkbox(
                          value: selectedFilterType == 0,
                          onChanged: (val) {
                            setState(() {
                              selectedFilterType = 0;
                            });
                          }),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 10.0),
                              child: Text(
                                "From Date",
                                style: TextStyle(
                                  color: Color.fromRGBO(54, 105, 166, 1),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.35,
                            child: TextFormField(
                              style: const TextStyle(fontSize: 15),
                              controller: fromDate,
                              keyboardType: TextInputType.datetime,
                              decoration: decoration(
                                "DD/MM/YYYY",
                                IconButton(
                                  onPressed: () async {
                                    DateTime? date = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(1950),
                                      lastDate: DateTime.now()
                                          .add(const Duration(seconds: 5)),
                                    );
                                    if (date != null) {
                                      fromDate.text =
                                          DateFormat("dd/MM/yyyy").format(date);
                                    }
                                  },
                                  icon: const ImageIcon(
                                    AssetImage("assets/calender.png"),
                                    color: Colors.blue,
                                  ),
                                  padding: EdgeInsets.zero,
                                  constraints: const BoxConstraints(),
                                  iconSize: 13,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 10),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 10.0),
                              child: Text(
                                "To Date",
                                style: TextStyle(
                                  color: Color.fromRGBO(54, 105, 166, 1),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.35,
                            child: TextFormField(
                              style: const TextStyle(fontSize: 15),
                              controller: toDate,
                              keyboardType: TextInputType.datetime,
                              decoration: decoration(
                                "DD/MM/YYYY",
                                IconButton(
                                  onPressed: () async {
                                    DateTime? date = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(1950),
                                      lastDate: DateTime.now()
                                          .add(const Duration(seconds: 5)),
                                    );
                                    if (date != null) {
                                      toDate.text =
                                          DateFormat("dd/MM/yyyy").format(date);
                                    }
                                  },
                                  icon: const ImageIcon(
                                    AssetImage("assets/calender.png"),
                                    color: Colors.blue,
                                  ),
                                  padding: EdgeInsets.zero,
                                  constraints: const BoxConstraints(),
                                  iconSize: 13,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Checkbox(
                          value: selectedFilterType == 1,
                          onChanged: (val) {
                            setState(() {
                              selectedFilterType = 1;
                            });
                          }),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 10.0),
                              child: Text(
                                "Year",
                                style: TextStyle(
                                  color: Color.fromRGBO(54, 105, 166, 1),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.35,
                            child: TextFormField(
                              style: const TextStyle(fontSize: 15),
                              controller: fromYear,
                              keyboardType: TextInputType.datetime,
                              decoration: decoration(
                                "2022",
                                IconButton(
                                  onPressed: () async {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: const Text("Select Year"),
                                          content: SizedBox(
                                            // Need to use container to add size constraint.
                                            width: 300,
                                            height: 300,
                                            child: YearPicker(
                                              firstDate: DateTime(
                                                  DateTime.now().year - 100, 1),
                                              lastDate: DateTime(
                                                  DateTime.now().year + 100, 1),
                                              initialDate: DateTime.now(),
                                              selectedDate: DateTime.now(),
                                              onChanged: (DateTime dateTime) {
                                                fromYear.text =
                                                    DateFormat("yyyy")
                                                        .format(dateTime);
                                                Navigator.pop(context);
                                              },
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  icon: const ImageIcon(
                                    AssetImage("assets/calender.png"),
                                    color: Colors.blue,
                                  ),
                                  padding: EdgeInsets.zero,
                                  constraints: const BoxConstraints(),
                                  iconSize: 13,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 10),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 10.0),
                              child: Text(
                                "Month",
                                style: TextStyle(
                                  color: Color.fromRGBO(54, 105, 166, 1),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.35,
                            child: DropdownButtonFormField2(
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.zero,
                                hintText: 'March.',
                                hintStyle: const TextStyle(fontSize: 14),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    width: 1,
                                    color: Color.fromRGBO(0, 175, 239, 1),
                                  ),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                              isExpanded: true,
                              dropdownElevation: 3,
                              hint: const Text(
                                'March',
                                style: TextStyle(fontSize: 14),
                              ),
                              icon: const ImageIcon(
                                AssetImage("assets/calender.png"),
                                color: Colors.blue,
                              ),
                              iconSize: 30,
                              buttonHeight: 50,
                              buttonPadding:
                                  const EdgeInsets.only(left: 20, right: 10),
                              dropdownDecoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              items: months
                                  .map((item) => DropdownMenuItem<String>(
                                        value: item,
                                        child: Text(
                                          item,
                                          style: const TextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                      ))
                                  .toList(),
                              validator: (value) {
                                if (value == null) {
                                  return 'Please select gender.';
                                }
                                return null;
                              },
                              onChanged: (value) {
                                //Do something when changing the item if you want.
                              },
                              onSaved: (value) {
                                selectedMonth = value.toString();
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Checkbox(
                          value: selectedFilterType == 2,
                          onChanged: (val) {
                            setState(() {
                              selectedFilterType = 2;
                            });
                          }),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 10.0),
                              child: Text(
                                "Year",
                                style: TextStyle(
                                  color: Color.fromRGBO(54, 105, 166, 1),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.74,
                            child: TextFormField(
                              style: const TextStyle(fontSize: 15),
                              controller: yearOnly,
                              keyboardType: TextInputType.datetime,
                              decoration: decoration(
                                "2022",
                                IconButton(
                                  onPressed: () async {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: const Text("Select Year"),
                                          content: SizedBox(
                                            // Need to use container to add size constraint.
                                            width: 300,
                                            height: 300,
                                            child: YearPicker(
                                              firstDate: DateTime(
                                                  DateTime.now().year - 100, 1),
                                              lastDate: DateTime(
                                                  DateTime.now().year + 100, 1),
                                              initialDate: DateTime.now(),
                                              selectedDate: DateTime.now(),
                                              onChanged: (DateTime dateTime) {
                                                yearOnly.text =
                                                    DateFormat("yyyy")
                                                        .format(dateTime);
                                                Navigator.pop(context);
                                              },
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  icon: const ImageIcon(
                                    AssetImage("assets/calender.png"),
                                    color: Colors.blue,
                                  ),
                                  padding: EdgeInsets.zero,
                                  constraints: const BoxConstraints(),
                                  iconSize: 13,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.65,
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(0, 175, 239, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        minimumSize: const Size(double.maxFinite, 30),
                        // tapTargetSize: MaterialTapTargetSize.padded,
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 20),
                      ),
                      child: const Text(
                        "Apply",
                        textScaleFactor: 1.3,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
