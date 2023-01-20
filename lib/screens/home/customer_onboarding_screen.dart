import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:demo/utils/file_picker_utils.dart';
import 'package:demo/widgets/file_picker.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class CustomerOnboardingScreen extends StatefulWidget {
  const CustomerOnboardingScreen({Key? key}) : super(key: key);

  @override
  State<CustomerOnboardingScreen> createState() =>
      _CustomerOnboardingScreenState();
}

class _CustomerOnboardingScreenState extends State<CustomerOnboardingScreen> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController fullNameCtrl = TextEditingController();
  final TextEditingController dobCtrl = TextEditingController();

  final TextEditingController fatherOrHusbandCtrl = TextEditingController();
  final TextEditingController motherCtrl = TextEditingController();
  final TextEditingController aadharCardCtrl = TextEditingController();
  // final TextEditingController stateCtrl = TextEditingController();
  // final TextEditingController panchayatCtrl = TextEditingController();
  // final TextEditingController districtCtrl = TextEditingController();
  // final TextEditingController blockCtrl = TextEditingController();
  final TextEditingController wardNoCtrl = TextEditingController();
  final TextEditingController villageCtrl = TextEditingController();
  final TextEditingController pinCodeCtrl = TextEditingController();
  TextEditingController otpCtrl = TextEditingController();
  TextEditingController mobileNumberCtrl = TextEditingController();

  TextEditingController emailCtrl = TextEditingController();

  // ..text = "123456";

  StreamController<ErrorAnimationType> errorController = StreamController();

  bool hasError = false;
  String currentText = "";
  final List<String> genderItems = ['Male', 'Female', 'Other'];
  final List<String> marritalItems = [
    'Married',
    'Unmarried',
    'Other',
  ];
  final List<String> state = [
    'UP',
    'Haryana',
    'Other',
  ];
  final List<String> district = [
    'District 1',
    'District 2',
    'Other',
  ];
  final List<String> block = [
    'Block 1',
    'Block 2',
    'Other',
  ];
  final List<String> panchayat = [
    'Panchayat 1',
    'Other',
  ];
  bool _acceptTerms = false;
  String? selectedGenderValue;
  String? selectedMarritalValue;
  String? selectedState;
  String? selectedDistrict;
  String? selectedBlock;
  String? selectedPanchayat;

  File? photo;
  File? addressProofFront;
  File? addressProofBack;

  bool _self = true;
  bool _isFatherName = true;

  ///  maskFormatter.getUnmaskedText(), can be used to get original aadhar value
  var aadharMaskFormatter = MaskTextInputFormatter(
    mask: '#### #### ####',
    // filter: { "#": RegExp(r'[0-9]') },
    type: MaskAutoCompletionType.lazy,
  );
  var mobileMaskFormatter = MaskTextInputFormatter(
    mask: '+91 ##### #####',
    // filter: { "#": RegExp(r'[0-9]') },
    type: MaskAutoCompletionType.lazy,
  );

  @override
  Widget build(BuildContext context) {
    trySubmit() {
      bool isValid = formKey.currentState!.validate();
      if (isValid) {
        log(
          aadharMaskFormatter.getUnmaskedText(),
        ); // Get Origianl Aadhar Number without spaces
      }
    }

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
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        labelStyle: const TextStyle(
          color: Color.fromRGBO(79, 124, 177, 1),
        ),
        floatingLabelStyle: const TextStyle(
            color: Color.fromRGBO(79, 124, 177, 1), fontSize: 10),
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

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.keyboard_arrow_left_outlined),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.blue,
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Image.asset(
                    "assets/logo.png",
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(height: 30, width: double.maxFinite),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.6,
                  ),
                  child: const FittedBox(
                    child: Text(
                      "Swasth 4U\nHealth & Wellness Card",
                      textScaleFactor: 1.3,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(26, 84, 153, 1)),
                    ),
                  ),
                ),
                const SizedBox(height: 30, width: double.maxFinite),
                Container(
                  height: MediaQuery.of(context).size.width * 0.7,
                  width: MediaQuery.of(context).size.width * 0.7,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(239, 239, 239, 1),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      width: 2,
                      color: const Color.fromRGBO(0, 175, 239, 1),
                    ),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: photo != null
                      ? Image.file(
                          photo!,
                          fit: BoxFit.cover,
                        )
                      : const Center(
                          child: Text(
                            "Passport Size\nPhoto",
                            textScaleFactor: 1.5,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color.fromRGBO(0, 106, 183, 1),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                ),
                const SizedBox(height: 10),

                _MyFilePickerButton(
                  text: "Upload Your Photo",
                  function: () async {
                    var temp = await MyFilePickerUtil().fromGallery();
                    if (temp != null) {
                      setState(() {
                        photo = temp;
                      });
                    }
                  },
                ),
                const SizedBox(height: 10),
                // Full name
                const _TextTitle(text: "Full Name"),

                TextFormField(
                  controller: fullNameCtrl,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter Full Name";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.text,
                  decoration: decoration("Full Name", null),
                ),
                const SizedBox(height: 10),
                // Husband NAme
                // const _TextTitle(text: "Father's Name / Husband's Name"),
                Align(
                  alignment: Alignment.centerLeft,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.8,
                    ),
                    child: FittedBox(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            "Father's Name",
                            style: TextStyle(
                                color: Color.fromRGBO(54, 105, 166, 1)),
                          ),
                          Checkbox(
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            value: _isFatherName,
                            onChanged: (bool? val) {
                              setState(() {
                                _isFatherName = val!;
                              });
                            },
                            side: const BorderSide(
                                color: Colors.lightBlue, width: 2),
                          ),
                          const Text(
                            "Husband's Name",
                            style: TextStyle(
                                color: Color.fromRGBO(54, 105, 166, 1)),
                          ),
                          // Parents
                          Checkbox(
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            value: !_isFatherName,
                            onChanged: (bool? val) {
                              setState(() {
                                _isFatherName = !val!;
                              });
                            },
                            side: const BorderSide(
                                color: Colors.lightBlue, width: 2),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                TextFormField(
                  controller: fatherOrHusbandCtrl,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter Father's Name / Husband Name";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.text,
                  decoration: decoration("Father's Name / Husband Name", null),
                ),
                const SizedBox(height: 10),
                // Mothers Name
                if (_isFatherName) const _TextTitle(text: "Mother's Name"),
                if (_isFatherName)
                  TextFormField(
                    key: const Key("MotherName"),
                    controller: motherCtrl,
                    validator: (value) {
                      if (_isFatherName && value!.isEmpty) {
                        return "Please Enter Mother's Name";
                      }
                      return null;
                    },
                    keyboardType: TextInputType.text,
                    decoration: decoration("Mother's Name", null),
                  ),
                if (_isFatherName) const SizedBox(height: 10),
                // DOB
                const _TextTitle(text: "DOB"),

                TextFormField(
                  controller: dobCtrl,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter Date Of Birth";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.datetime,
                  decoration: decoration(
                    "DD/MM/YYYY",
                    IconButton(
                      onPressed: () async {
                        DateTime? date = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1950),
                          lastDate:
                              DateTime.now().add(const Duration(seconds: 5)),
                        );
                        if (date != null) {
                          dobCtrl.text = DateFormat("dd/MM/yyyy").format(date);
                        }
                      },
                      icon: const ImageIcon(
                        AssetImage("assets/calender.png"),
                        color: Colors.blue,
                      ),
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      iconSize: 15,
                    ),
                  ),
                ),
                // Marital Status
                const SizedBox(height: 10),

                const _TextTitle(text: "Marritial Status"),

                DropdownButtonFormField2(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.zero,
                    hintText: 'Enter Your Marital Status.',
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
                    'Select Your Marital Status',
                    style: TextStyle(fontSize: 14),
                  ),
                  icon: const ImageIcon(
                      AssetImage("assets/entypo_select-arrows.png")),
                  iconSize: 30,
                  buttonHeight: 50,
                  buttonPadding: const EdgeInsets.only(left: 20, right: 10),
                  dropdownDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  items: marritalItems
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
                      return 'Please select Marital Status.';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    //Do something when changing the item if you want.
                  },
                  onSaved: (value) {
                    selectedMarritalValue = value.toString();
                  },
                ),
                // Gender
                const SizedBox(height: 10),

                const _TextTitle(text: "Gender"),

                DropdownButtonFormField2(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.zero,
                    hintText: 'Enter Your Full Name.',
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
                    'Select Your Gender',
                    style: TextStyle(fontSize: 14),
                  ),
                  icon: const ImageIcon(
                      AssetImage("assets/entypo_select-arrows.png")),
                  iconSize: 30,
                  buttonHeight: 50,
                  buttonPadding: const EdgeInsets.only(left: 20, right: 10),
                  dropdownDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  items: genderItems
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
                    selectedGenderValue = value.toString();
                  },
                ),
                const SizedBox(height: 10),

                // Aadhar Card
                Row(
                  children: [
                    ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * 0.4,
                        ),
                        child: const FittedBox(
                            child: _TextTitle(text: "Aadhar Card Number"))),
                    const Spacer(),
                    //  Self
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width * 0.35,
                      ),
                      child: FittedBox(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text(
                              "Self",
                              style: TextStyle(
                                  color: Color.fromRGBO(54, 105, 166, 1)),
                            ),
                            Checkbox(
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              value: _self,
                              onChanged: (bool? val) {
                                setState(() {
                                  _self = val!;
                                });
                              },
                              side: const BorderSide(
                                  color: Colors.lightBlue, width: 2),
                            ),
                            const Text(
                              "Parents",
                              style: TextStyle(
                                  color: Color.fromRGBO(54, 105, 166, 1)),
                            ),
                            // Parents
                            Checkbox(
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              value: !_self,
                              onChanged: (bool? val) {
                                setState(() {
                                  _self = !val!;
                                });
                              },
                              side: const BorderSide(
                                  color: Colors.lightBlue, width: 2),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                TextFormField(
                  inputFormatters: [aadharMaskFormatter],
                  controller: aadharCardCtrl,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter Aadhar Card Number";
                    }
                    if (value.length != 12) {
                      return "Enter Correct Aadhar Number";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.number,
                  decoration: decoration("1234 5678 9101", null),
                ),
                const SizedBox(height: 10),
                // State
                const _TextTitle(text: "State"),

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
                    'Select your State',
                    style: TextStyle(fontSize: 14),
                  ),
                  icon: const ImageIcon(
                      AssetImage("assets/entypo_select-arrows.png")),
                  iconSize: 30,
                  buttonHeight: 50,
                  buttonPadding: const EdgeInsets.only(left: 20, right: 10),
                  dropdownDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  items: state
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
                      return 'Please select state.';
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

                const SizedBox(height: 10),
                // district
                const _TextTitle(text: "District"),

                DropdownButtonFormField2(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.zero,
                    hintText: 'Enter Your District.',
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
                    'Select your District',
                    style: TextStyle(fontSize: 14),
                  ),
                  icon: const ImageIcon(
                      AssetImage("assets/entypo_select-arrows.png")),
                  iconSize: 30,
                  buttonHeight: 50,
                  buttonPadding: const EdgeInsets.only(left: 20, right: 10),
                  dropdownDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  items: district
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
                    selectedDistrict = value.toString();
                  },
                ),

                // block
                const SizedBox(height: 10),

                const _TextTitle(text: "Block"),

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
                    'Select your Block',
                    style: TextStyle(fontSize: 14),
                  ),
                  icon: const ImageIcon(
                      AssetImage("assets/entypo_select-arrows.png")),
                  iconSize: 30,
                  buttonHeight: 50,
                  buttonPadding: const EdgeInsets.only(left: 20, right: 10),
                  dropdownDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  items: block
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
                    selectedBlock = value.toString();
                  },
                ),

                // panchayat
                const SizedBox(height: 10),

                const _TextTitle(text: "Panchayat"),

                DropdownButtonFormField2(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.zero,
                    hintText: 'Enter Your Panchayat.',
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
                    'Select your Panchayat',
                    style: TextStyle(fontSize: 14),
                  ),
                  icon: const ImageIcon(
                      AssetImage("assets/entypo_select-arrows.png")),
                  iconSize: 30,
                  buttonHeight: 50,
                  buttonPadding: const EdgeInsets.only(left: 20, right: 10),
                  dropdownDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  items: panchayat
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
                      return 'Please select Panchayat.';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    //Do something when changing the item if you want.
                  },
                  onSaved: (value) {
                    selectedPanchayat = value.toString();
                  },
                ),

                // ward no
                const SizedBox(height: 10),
                const _TextTitle(text: "Ward No."),

                TextFormField(
                  controller: wardNoCtrl,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter Ward No.";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.number,
                  decoration: decoration("Ward No.", null),
                ),
                // Village
                const SizedBox(height: 10),

                const _TextTitle(text: "Village"),

                TextFormField(
                  controller: villageCtrl,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter Village";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.text,
                  decoration: decoration("Village", null),
                ),
                // pin code
                const SizedBox(height: 10),

                const _TextTitle(text: "Pin Code"),
                TextFormField(
                  controller: pinCodeCtrl,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter Pin Code";
                    }
                    if (value.length != 6) {
                      return "Enter valid Pin code";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.number,
                  decoration: decoration("Pin Code", null),
                ),
                // Email
                const SizedBox(height: 10),

                const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: Text(
                      "Email",
                      style: TextStyle(
                        color: Color.fromRGBO(54, 105, 166, 1),
                      ),
                    ),
                  ),
                ),
                TextFormField(
                  controller: emailCtrl,
                  validator: (value) {},
                  // keyboardType: TextInputType.number,
                  decoration: decoration("Email", null),
                ),
                const SizedBox(height: 30),
                _MyFilePickerButton(
                  text: "Address Proof Front",
                  function: () async {
                    var temp = await MyFilePickerUtil().fromGallery();
                    if (temp != null) {
                      setState(() {
                        addressProofFront = temp;
                      });
                    }
                  },
                ),
                const SizedBox(height: 15),
                Container(
                  height: MediaQuery.of(context).size.width * 0.5,
                  width: MediaQuery.of(context).size.width * 0.8,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(239, 239, 239, 1),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      width: 2,
                      color: const Color.fromRGBO(0, 175, 239, 1),
                    ),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: addressProofFront != null
                      ? Image.file(
                          addressProofFront!,
                          fit: BoxFit.cover,
                        )
                      : Center(
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.2,
                            child: const FittedBox(
                              child: Text(
                                "Address\nProof\nFRONT",
                                textScaleFactor: 1.5,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color.fromRGBO(0, 106, 183, 1),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                ),
                const SizedBox(height: 15),
                _MyFilePickerButton(
                  text: "Address Proof Back",
                  function: () async {
                    var temp = await MyFilePickerUtil().fromGallery();
                    if (temp != null) {
                      setState(() {
                        addressProofBack = temp;
                      });
                    }
                  },
                ),
                const SizedBox(height: 10),
                Container(
                  height: MediaQuery.of(context).size.width * 0.5,
                  width: MediaQuery.of(context).size.width * 0.8,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(239, 239, 239, 1),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      width: 2,
                      color: const Color.fromRGBO(0, 175, 239, 1),
                    ),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: addressProofBack != null
                      ? Image.file(
                          addressProofBack!,
                          fit: BoxFit.cover,
                        )
                      : Center(
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.2,
                            child: const FittedBox(
                              child: Text(
                                "Address\nProof\nBACK",
                                textScaleFactor: 1.5,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color.fromRGBO(0, 106, 183, 1),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                ),
                const SizedBox(height: 30),
                const Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Mobile Verification",
                    textScaleFactor: 1.5,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(54, 105, 166, 1),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // Mobile Number
                TextFormField(
                  inputFormatters: [mobileMaskFormatter],
                  controller: mobileNumberCtrl,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter Mobile Number";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    // suffix: suffix,
                    errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: 1,
                        color: Colors.red,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    hintStyle: const TextStyle(
                        color: Color.fromRGBO(196, 196, 196, 1)),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: 1,
                        color: Colors.red,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    labelStyle: const TextStyle(
                      color: Color.fromRGBO(79, 124, 177, 1),
                    ),
                    floatingLabelStyle: const TextStyle(
                        color: Color.fromRGBO(79, 124, 177, 1), fontSize: 10),
                    hintText: "+91 09807 54321",
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: 1,
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: 1,
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // Get OTP
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.65,
                  child: TextButton(
                    onPressed: () {
                      // sendOTP();
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
                      "Get OTP",
                      textScaleFactor: 1.5,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40),

                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Enter OTP",
                    textScaleFactor: 1.5,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                  // width: double.maxFinite,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Enter the verification sent to phone number.",
                    // textScaleFactor: 1.5,
                    style: TextStyle(
                      // fontSize: 10,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(155, 155, 155, 1),
                    ),
                  ),
                ),

                const SizedBox(
                  height: 20,
                  width: double.maxFinite,
                ),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 15.0),
                //   child: PinCodeTextField(
                //     appContext: context,
                //     pastedTextStyle: const TextStyle(
                //       color: Colors.lightBlue,
                //       fontWeight: FontWeight.bold,
                //     ),
                //     length: 4,
                //     obscureText: false,
                //     obscuringCharacter: '*',
                //     animationType: AnimationType.fade,
                //     validator: (v) {
                //       if (v!.length < 3) {
                //         return "Enter Complete OTP";
                //       } else {
                //         return null;
                //       }
                //     },
                //     pinTheme: PinTheme(
                //       activeColor: Colors.lightBlue,
                //       inactiveColor: Colors.lightBlue,
                //       selectedColor: Colors.lightBlue,
                //       shape: PinCodeFieldShape.box,
                //       borderWidth: 1,
                //       borderRadius: BorderRadius.circular(5),
                //       fieldHeight: 40,
                //       fieldWidth: 40,
                //       activeFillColor:
                //           hasError ? Colors.orange : Colors.white,
                //     ),
                //     cursorColor: Colors.black,
                //     animationDuration: const Duration(milliseconds: 100),
                //     textStyle: const TextStyle(
                //         fontSize: 20,
                //         height: 1.6,
                //         color: Color.fromRGBO(54, 105, 166, 1)),
                //     errorAnimationController: errorController,
                //     controller: otpCtrl,
                //     keyboardType: TextInputType.number,
                //     onCompleted: (v) {
                //       // print("Completed");
                //     },
                //     onChanged: (value) {
                //       setState(() {
                //         currentText = value;
                //       });
                //     },
                //     beforeTextPaste: (text) {
                //       return true;
                //     },
                //   ),
                // ),
                TextFormField(
                  controller: otpCtrl,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter OTP Code";
                    }
                    // if (value.length != 6) {
                    //   return "Enter valid OTP";
                    // }
                    return null;
                  },
                  keyboardType: TextInputType.number,
                  decoration: decoration("OTP", null),
                ),
                const SizedBox(height: 40),

                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "TERMS & CONDITIONS",
                    textScaleFactor: 1.5,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                  // width: double.maxFinite,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "The Concept of Health & Wellness card is to provide 10% to 50% discount in Pharmaceutical, Surgical or other Medical unit obly as service provide by our service providers.\n\nThe Alternate to this card is not health insurance, but only instant discount.\n\nThe Card fee received by the application is only RS.200 which is NON-Refundable Amount.\n\nThe Validity of this card is 1 year, after which you get the right to be benefitted again for 1 year by paying the renewal charge again.",
                    // textScaleFactor: 1.5,
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      // fontSize: 10,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(155, 155, 155, 1),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width * 0.8),
                    child: FittedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Checkbox(
                            value: _acceptTerms,
                            onChanged: (bool? val) {
                              setState(() {
                                _acceptTerms = val!;
                              });
                            },
                            side: const BorderSide(
                                color: Color.fromRGBO(155, 155, 155, 1),
                                width: 2),
                          ),
                          // SizedBox(width: 5),
                          const Text(
                            "I Accept All the Terms and Conditions.",
                            style: TextStyle(
                              color: Color.fromRGBO(155, 155, 155, 1),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.65,
                  child: TextButton(
                    onPressed: () {
                      // sendOTP();
                      trySubmit();
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
                      "SUBMIT",
                      textScaleFactor: 1.5,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _TextTitle extends StatelessWidget {
  const _TextTitle({Key? key, required this.text}) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              text,
              style: const TextStyle(
                color: Color.fromRGBO(54, 105, 166, 1),
              ),
            ),
            const Text(
              "*",
              textScaleFactor: 1.5,
              style: TextStyle(
                color: Colors.red,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _MyFilePickerButton extends StatelessWidget {
  const _MyFilePickerButton(
      {Key? key, required this.text, required this.function})
      : super(key: key);
  final String text;
  final Function? function;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      // height: 50,
      padding: const EdgeInsets.only(left: 20, right: 10),
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(0, 175, 239, 1),
        borderRadius: BorderRadius.circular(30),
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.black26,
        //     blurRadius: 2,
        //     offset: Offset.fromDirection(2, 4),
        //     spreadRadius: 1,
        //   ),
        // ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.45,
            ),
            child: FittedBox(
              child: Text(
                text,
                // textScaleFactor: 1.2,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          ),
          TextButton(
            style: TextButton.styleFrom(
                elevation: 5,
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20)),
            onPressed: () async {
              await function!();
            },
            child: const Text(
              "Choose",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
