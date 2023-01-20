import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

class AreaFilterScreen extends StatefulWidget {
  const AreaFilterScreen({Key? key}) : super(key: key);

  @override
  State<AreaFilterScreen> createState() => _AreaFilterScreenState();
}

class _AreaFilterScreenState extends State<AreaFilterScreen> {
  final List<String> states = ["Bihar", "Other"];
  final List<String> districts = ["All Districts", "Patna", "Other"];
  final List<String> blocks = ["All Blocks", "Patna", "Other"];
  String? selectedDistrict;
  String? selectedBlock;
  String? selectedState;
  final TextEditingController searchCtrl = TextEditingController();
  final formKey = GlobalKey<FormState>();

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
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Stack(
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
                              "Area Filter",
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
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                  child: Form(
                    key: formKey,
                    child: Material(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                      child: TextFormField(
                        controller: searchCtrl,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Enter text to search";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          filled: true,
                          focusColor: const Color.fromRGBO(234, 247, 255, 1),
                          hoverColor: const Color.fromRGBO(234, 247, 255, 1),
                          fillColor: const Color.fromRGBO(234, 247, 255, 1),
                          prefix: Padding(
                            padding:
                                const EdgeInsets.only(left: 10, right: 15.0),
                            child: IconButton(
                              onPressed: () {},
                              icon: const ImageIcon(
                                AssetImage("assets/search.png"),
                                color: Color.fromRGBO(0, 175, 239, 1),
                              ),
                              iconSize: 20,
                              padding: EdgeInsets.zero,
                              constraints: const BoxConstraints(),
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
                              color: Color.fromRGBO(54, 105, 166, 1)),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              width: 1,
                              color: Colors.red,
                            ),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 5),
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
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // State
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.0),
                          child: Text(
                            "State",
                            style: TextStyle(
                              color: Color.fromRGBO(54, 105, 166, 1),
                            ),
                          ),
                        ),
                      ),
                      DropdownButtonFormField2(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.zero,
                          hintText: 'Enter Your State.',
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
                          'Select Your State',
                          style: TextStyle(fontSize: 14),
                        ),
                        icon: const ImageIcon(
                          AssetImage("assets/entypo_select-arrows.png"),
                          color: Color.fromRGBO(54, 105, 166, 1),
                        ),
                        iconSize: 30,
                        buttonHeight: 60,
                        buttonPadding:
                            const EdgeInsets.only(left: 20, right: 10),
                        dropdownDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        items: states
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
                            return 'Please select State.';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          //Do something when changing the item if you want.
                        },
                        onSaved: (value) {
                          selectedState = value.toString();
                        },
                      ),
                      //  District
                      const SizedBox(height: 10),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.0),
                          child: Text(
                            "District",
                            style: TextStyle(
                              color: Color.fromRGBO(54, 105, 166, 1),
                            ),
                          ),
                        ),
                      ),
                      DropdownButtonFormField2(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.zero,
                          hintText: 'Enter Your district.',
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
                          'Select Your district',
                          style: TextStyle(fontSize: 14),
                        ),
                        icon: const ImageIcon(
                          AssetImage("assets/entypo_select-arrows.png"),
                          color: Color.fromRGBO(54, 105, 166, 1),
                        ),
                        iconSize: 30,
                        buttonHeight: 60,
                        buttonPadding:
                            const EdgeInsets.only(left: 20, right: 10),
                        dropdownDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        items: districts
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
                            return 'Please select District.';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          //Do something when changing the item if you want.
                        },
                        onSaved: (value) {
                          selectedState = value.toString();
                        },
                      ),
                      //  Block
                      const SizedBox(height: 10),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.0),
                          child: Text(
                            "Block",
                            style: TextStyle(
                              color: Color.fromRGBO(54, 105, 166, 1),
                            ),
                          ),
                        ),
                      ),
                      DropdownButtonFormField2(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.zero,
                          hintText: 'Enter Your Block.',
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
                          'Select Your Block',
                          style: TextStyle(fontSize: 14),
                        ),
                        icon: const ImageIcon(
                          AssetImage("assets/entypo_select-arrows.png"),
                          color: Color.fromRGBO(54, 105, 166, 1),
                        ),
                        iconSize: 30,
                        buttonHeight: 60,
                        buttonPadding:
                            const EdgeInsets.only(left: 20, right: 10),
                        dropdownDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        items: blocks
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
                            return 'Please select Block.';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          //Do something when changing the item if you want.
                        },
                        onSaved: (value) {
                          selectedState = value.toString();
                        },
                      ),

                      // Apply
                      const SizedBox(height: 40),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.65,
                        child: TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          style: TextButton.styleFrom(
                            backgroundColor:
                                const Color.fromRGBO(0, 175, 239, 1),
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
              ],
            ),
          ),
        ),
      ],
    );
  }
}
