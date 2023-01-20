import 'package:demo/screens/auth/login_screen.dart';
import 'package:demo/widgets/doc_detail_profile.dart';
import 'package:demo/widgets/map.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class AssociateOnboardingScreen extends StatefulWidget {
  const AssociateOnboardingScreen({Key? key, this.isEditing = false})
      : super(key: key);
  final bool isEditing;
  @override
  State<AssociateOnboardingScreen> createState() =>
      _AssociateOnboardingScreenState();
}

class _AssociateOnboardingScreenState extends State<AssociateOnboardingScreen> {
  //  Initial Selected Value
  String dropdownvalue = 'English';

  // List of items in our dropdown menu
  final items = [
    'English',
    'Hindi',
  ];

  //
  final formKey = GlobalKey<FormState>();

  // decor
  InputDecoration inputDecoration([String? prefixText]) => InputDecoration(
        prefixText: prefixText,
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
  final TextEditingController categoryOfAssociateCtrl = TextEditingController();
  final TextEditingController firmNameCtrl = TextEditingController();
  final TextEditingController ownerNameCtrl = TextEditingController();
  final TextEditingController licenseNoCtrl = TextEditingController();
  final TextEditingController addressCtrl = TextEditingController();
  final TextEditingController stateCtrl = TextEditingController();
  final TextEditingController districtCtrl = TextEditingController();
  final TextEditingController blockCtrl = TextEditingController();
  final TextEditingController pincodeCtrl = TextEditingController();
  final TextEditingController phoneNumberCtrl = TextEditingController();
  final TextEditingController emailCtrl = TextEditingController();
  //
  final TextEditingController feesDiscountCtrl = TextEditingController();
  final TextEditingController testDiscountCtrl = TextEditingController();
  final TextEditingController medicineDiscountCtrl = TextEditingController();
  final TextEditingController idpDiscountCtrl = TextEditingController();
  final TextEditingController opdDiscountCtrl = TextEditingController();
  final TextEditingController otherDiscountCtrl = TextEditingController();
  final TextEditingController discountTimeCtrl = TextEditingController();
  final TextEditingController freeCampsMonthCtrl = TextEditingController();
  //
  final TextEditingController benificiaryCtrl = TextEditingController();
  final TextEditingController bankNameCtrl = TextEditingController();
  final TextEditingController acNoCtrl = TextEditingController();
  final TextEditingController ifscCodeCtrl = TextEditingController();
  final TextEditingController branchCtrl = TextEditingController();
  final TextEditingController searchCtrl = TextEditingController();

  //
  String appointmentType = "Online";
  String consultationPaymentMethod = "Online";

  //
  // List<TextEditingController> subCategoriesCtrl = [];
  List<Widget> subCategoryWidgets = [];
  List<String?> selectedCategories = [];
  List<String> subcategoryOptions = [
    'category',
    'Skilled Nursing Facility',
    'Other',
  ];
  String? associateCategory;
  List<String> associateCategories = [
    'category 1',
    'category 2',
    'category 3',
    'Other',
  ];
  String? state;
  List<String> states = [
    'State 1',
    'State 2',
    'State 3',
    'Other',
  ];
  String? district;
  List<String> districts = [
    'District 1',
    'District 2',
    'District 3',
    'Other',
  ];
  String? block;
  List<String> blocks = [
    'Block 1',
    'Block 2',
    'Block 3',
    'Other',
  ];
  //
  List<TextEditingController> facilityCtrl = [];
  List<Widget> facilityTextFields = [];

  List<TextEditingController> specializeServiceCtrl = [];
  List<Widget> specializeServiceTextFields = [];

  // for doctor details
  List<Map<String, TextEditingController>> doctorDetailCtrlers = [];
  List<Widget> doctorDetailWidgets = [];

  //
  bool _acceptTerms = false;
  TextEditingController mobileNumberCtrl = TextEditingController();
  TextEditingController otpCtrl = TextEditingController();

  var mobileMaskFormatter = MaskTextInputFormatter(
    mask: '##### #####',
    // filter: { "#": RegExp(r'[0-9]') },
    type: MaskAutoCompletionType.lazy,
  );
  @override
  void initState() {
    super.initState();
    selectedCategories.add(null);
    subCategoryWidgets.add(
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: DropdownButtonFormField2(
          isExpanded: true,
          dropdownElevation: 3,
          icon: const Icon(Icons.keyboard_arrow_down_outlined),
          iconSize: 20,
          buttonHeight: 20,
          buttonPadding: const EdgeInsets.only(left: 5, right: 5),
          dropdownDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
          validator: (value) {
            if (value == null || value == "") {
              return 'Please select Category.';
            }
            return null;
          },
          onChanged: (value) {
            selectedCategories[selectedCategories.length - 1] =
                value.toString();
          },
          onSaved: (value) {
            selectedCategories[0] = value.toString();
          },
          value: selectedCategories[0],
          decoration: inputDecoration(),
          items: subcategoryOptions
              .map(
                (item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
    // facility
    facilityCtrl.add(TextEditingController());
    // facilityCtrl[0].text = "ECG";

    facilityTextFields.add(
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: TextFormField(
          controller: facilityCtrl[0],
          decoration: inputDecoration(),
          validator: (value) {
            if (value == null || value == "") {
              return 'Please select facility.';
            }
            return null;
          },
        ),
      ),
    );
    // facility
    specializeServiceCtrl.add(TextEditingController());
    // specializeServiceCtrl[0].text = "Cesarean";

    specializeServiceTextFields.add(
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: TextFormField(
          controller: specializeServiceCtrl[0],
          decoration: inputDecoration(),
          validator: (value) {
            if (value == null || value == "") {
              return 'Please selectSpecialize of Service.';
            }
            return null;
          },
        ),
      ),
    );
    // Doctor Ctrls
    doctorDetailCtrlers.add({
      "docNameCtrl": TextEditingController(),
      "designation": TextEditingController(),
      "department": TextEditingController(),
    });
    doctorDetailWidgets.add(
      DocDetailsProfileWidget(
        nameCtrl: doctorDetailCtrlers[0]["docNameCtrl"]!,
        designationCtrl: doctorDetailCtrlers[0]["designation"]!,
        departmentCtrl: doctorDetailCtrlers[0]["department"]!,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    trySubmit() {
      bool isValid = formKey.currentState!.validate();
      if (isValid) {
        // Get Origianl Aadhar Number without spaces
      }
    }

    bool appointmentOnline = appointmentType == "Online";
    bool consultationOnline = consultationPaymentMethod == "Online";

    void addSubCategory() {
      setState(() {
        selectedCategories.add(null);
        subCategoryWidgets.add(
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: DropdownButtonFormField2(
              isExpanded: true,
              dropdownElevation: 3,
              icon: const Icon(Icons.keyboard_arrow_down_outlined),
              iconSize: 20,
              buttonHeight: 20,
              buttonPadding: const EdgeInsets.only(left: 5, right: 5),
              dropdownDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              validator: (value) {
                if (value == null || value == "") {
                  return 'Please select Category.';
                }
                return null;
              },
              value: selectedCategories[selectedCategories.length - 1],
              onChanged: (value) {
                selectedCategories[selectedCategories.length - 1] =
                    value.toString();
              },
              onSaved: (value) {
                selectedCategories[selectedCategories.length - 1] =
                    value.toString();
              },
              decoration: inputDecoration(),
              items: subcategoryOptions
                  .map(
                    (item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        );
      });
    }

    void addDoctorDetailWidget() {
      setState(() {
        doctorDetailCtrlers.add({
          "docNameCtrl": TextEditingController(),
          "designation": TextEditingController(),
          "department": TextEditingController(),
        });
        doctorDetailWidgets.add(
          DocDetailsProfileWidget(
            nameCtrl: doctorDetailCtrlers[doctorDetailCtrlers.length - 1]
                ["docNameCtrl"]!,
            designationCtrl: doctorDetailCtrlers[doctorDetailCtrlers.length - 1]
                ["designation"]!,
            departmentCtrl: doctorDetailCtrlers[doctorDetailCtrlers.length - 1]
                ["department"]!,
          ),
        );
      });
    }

    var deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.keyboard_arrow_left_outlined),
        ),
        foregroundColor: Colors.blue,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              // elevation: ,
              icon: const Icon(
                Icons.keyboard_arrow_down,
                color: Colors.blue,
              ),
              value: dropdownvalue,
              items: items.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(
                    items,
                    style:
                        const TextStyle(color: Color.fromRGBO(0, 175, 239, 1)),
                  ),
                );
              }).toList(),
              // After selecting the desired option,it will
              // change button value to selected value
              onChanged: (String? newValue) {
                setState(() {
                  dropdownvalue = newValue!;
                });
              },
            ),
          )
        ],
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              children: <Widget>[
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Image.asset(
                    "assets/logo.png",
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(
                  height: 40,
                  width: double.maxFinite,
                ),
                SizedBox(
                  width: widget.isEditing
                      ? deviceSize.width * 0.4
                      : deviceSize.width * 0.7,
                  child: FittedBox(
                    child: Text(
                      widget.isEditing
                          ? "Edit Associate"
                          : "Associate Onboard / Registration Form",
                      // textScaleFactor: 1.5,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(54, 105, 166, 1),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                  // width: double.maxFinite,
                ),
                SizedBox(
                  width: deviceSize.width * 0.8,
                  child: const FittedBox(
                    child: Text(
                      "'*' Field is mandatory, candidate must fill all the columns in English.",
                      // textScaleFactor: 1.5,
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(54, 105, 166, 1),
                      ),
                    ),
                  ),
                ),
                const _Heading(text: "Category of Associate"),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: DropdownButtonFormField2(
                    isExpanded: true,
                    dropdownElevation: 3,
                    icon: const Icon(Icons.keyboard_arrow_down_outlined),
                    iconSize: 20,
                    buttonHeight: 20,
                    buttonPadding: const EdgeInsets.only(left: 5, right: 5),
                    dropdownDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    validator: (value) {
                      if (value == null || value == "") {
                        return 'Please select Category.';
                      }
                      return null;
                    },
                    value: associateCategory,
                    onChanged: (value) {
                      associateCategory = value.toString();
                    },
                    onSaved: (value) {
                      associateCategory = value.toString();
                    },
                    decoration: inputDecoration(),
                    items: associateCategories
                        .map(
                          (item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
                const _Heading(text: "SubCategory"),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: subCategoryWidgets,
                      ),
                    ),
                    IconButton(
                      onPressed: () => addSubCategory(),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      constraints: const BoxConstraints(),
                      icon: const Icon(
                        Icons.add_circle_outline_outlined,
                        size: 30,
                        color: Color.fromRGBO(24, 84, 153, 1),
                      ),
                    ),
                  ],
                ),
                const _HeadingImp(text: "Firm Name"),
                TextFormField(
                  controller: firmNameCtrl,
                  decoration: inputDecoration(),
                  validator: (value) {
                    if (value == null || value == "") {
                      return 'Please select Firm Name.';
                    }
                    return null;
                  },
                ),
                const _HeadingImp(text: "Owner Name"),
                TextFormField(
                  validator: (value) {
                    if (value == null || value == "") {
                      return 'Please select Owner Name.';
                    }
                    return null;
                  },
                  controller: ownerNameCtrl,
                  decoration: inputDecoration(),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: doctorDetailWidgets,
                ),
                IconButton(
                  onPressed: () => addDoctorDetailWidget(),
                  icon: const Icon(
                    Icons.add_circle_outline,
                    size: 40,
                    color: Color.fromRGBO(26, 84, 153, 1),
                  ),
                ),
                const _Heading(text: "Facility"),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: facilityTextFields,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          facilityCtrl.add(TextEditingController());
                          facilityTextFields.add(
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 4.0),
                              child: TextFormField(
                                controller:
                                    facilityCtrl[facilityCtrl.length - 1],
                                decoration: inputDecoration(),
                                validator: (value) {
                                  if (value == null || value == "") {
                                    return 'Please select facility.';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          );
                        });
                      },
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      constraints: const BoxConstraints(),
                      icon: const Icon(
                        Icons.add_circle_outline_outlined,
                        size: 30,
                        color: Color.fromRGBO(24, 84, 153, 1),
                      ),
                    ),
                  ],
                ),
                const _HeadingImp(text: "Specialize of Services"),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: specializeServiceTextFields,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          specializeServiceCtrl.add(TextEditingController());
                          specializeServiceTextFields.add(
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 4.0),
                              child: TextFormField(
                                controller: specializeServiceCtrl[
                                    specializeServiceCtrl.length - 1],
                                decoration: inputDecoration(),
                                validator: (value) {
                                  if (value == null || value == "") {
                                    return 'Please select Specialize of Service.';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          );
                        });
                      },
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      constraints: const BoxConstraints(),
                      icon: const Icon(
                        Icons.add_circle_outline_outlined,
                        size: 30,
                        color: Color.fromRGBO(24, 84, 153, 1),
                      ),
                    ),
                  ],
                ),
                const _Heading(text: "License No / Registration No"),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: licenseNoCtrl,
                  decoration: inputDecoration(),
                  validator: (value) {
                    if (value == null || value == "") {
                      return 'Please select License No / Registration No.';
                    }
                    return null;
                  },
                ),
                const _Heading(text: "Address"),
                TextFormField(
                  controller: addressCtrl,
                  maxLines: 3,
                  decoration: inputDecoration(),
                  validator: (value) {
                    if (value == null || value == "") {
                      return 'Please select Address.';
                    }
                    return null;
                  },
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const _Heading(text: "State"),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: DropdownButtonFormField2(
                            isExpanded: true,
                            dropdownElevation: 3,
                            icon:
                                const Icon(Icons.keyboard_arrow_down_outlined),
                            iconSize: 20,
                            buttonHeight: 20,
                            buttonPadding:
                                const EdgeInsets.only(left: 5, right: 5),
                            dropdownDecoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            validator: (value) {
                              if (value == null || value == "") {
                                return 'Please select State.';
                              }
                              return null;
                            },
                            value: state,
                            onChanged: (value) {
                              state = value.toString();
                            },
                            onSaved: (value) {
                              state = value.toString();
                            },
                            decoration: inputDecoration(),
                            items: states
                                .map(
                                  (item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: const TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        )
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const _Heading(text: "District"),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: DropdownButtonFormField2(
                            isExpanded: true,
                            dropdownElevation: 3,
                            icon:
                                const Icon(Icons.keyboard_arrow_down_outlined),
                            iconSize: 20,
                            buttonHeight: 20,
                            buttonPadding:
                                const EdgeInsets.only(left: 5, right: 5),
                            dropdownDecoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            validator: (value) {
                              if (value == null || value == "") {
                                return 'Please select District.';
                              }
                              return null;
                            },
                            value: district,
                            onChanged: (value) {
                              district = value.toString();
                            },
                            onSaved: (value) {
                              district = value.toString();
                            },
                            decoration: inputDecoration(),
                            items: districts
                                .map(
                                  (item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: const TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const _Heading(text: "Block"),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: DropdownButtonFormField2(
                            isExpanded: true,
                            dropdownElevation: 3,
                            icon:
                                const Icon(Icons.keyboard_arrow_down_outlined),
                            iconSize: 20,
                            buttonHeight: 20,
                            buttonPadding:
                                const EdgeInsets.only(left: 5, right: 5),
                            dropdownDecoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            validator: (value) {
                              if (value == null || value == "") {
                                return 'Please select Block.';
                              }
                              return null;
                            },
                            value: block,
                            onChanged: (value) {
                              block = value.toString();
                            },
                            onSaved: (value) {
                              block = value.toString();
                            },
                            decoration: inputDecoration(),
                            items: blocks
                                .map(
                                  (item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: const TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        )
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const _Heading(text: "Pin Code"),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            controller: pincodeCtrl,
                            decoration: inputDecoration(),
                            validator: (value) {
                              if (value == null || value == "") {
                                return 'Please select Pin Code.';
                              }
                              return null;
                            },
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                const _Heading(text: "Phone Number"),
                TextFormField(
                  inputFormatters: [mobileMaskFormatter],
                  keyboardType: TextInputType.number,
                  controller: phoneNumberCtrl,
                  decoration: inputDecoration("+91 "),
                  validator: (value) {
                    if (value == null || value == "") {
                      return 'Please select Phone Number';
                    }
                    return null;
                  },
                ),
                const _Heading(text: "Email ID"),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: emailCtrl,
                  decoration: inputDecoration(),
                  validator: (value) {
                    if (value == null || value == "") {
                      return 'Please select Email ID.';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 15),
                const _HeadingImp(
                    text: "Discount given to \"Swasth4u Card Holder\""),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const _HeadingImp(text: "Fees"),
                    const Spacer(),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        controller: feesDiscountCtrl,
                        decoration: inputDecoration(),
                        validator: (value) {
                          if (value == null || value == "") {
                            return 'Please enter a value.';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(width: 10),
                    const _Heading(text: "%")
                  ],
                ),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const _HeadingImp(text: "Test"),
                    const Spacer(),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        controller: testDiscountCtrl,
                        decoration: inputDecoration(),
                        validator: (value) {
                          if (value == null || value == "") {
                            return 'Please enter a value.';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(width: 10),
                    const _Heading(text: "%")
                  ],
                ),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const _HeadingImp(text: "Medicine"),
                    const Spacer(),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        controller: medicineDiscountCtrl,
                        decoration: inputDecoration(),
                        validator: (value) {
                          if (value == null || value == "") {
                            return 'Please enter a value.';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(width: 10),
                    const _Heading(text: "%")
                  ],
                ),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const _HeadingImp(text: "IDP"),
                    const Spacer(),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        controller: idpDiscountCtrl,
                        decoration: inputDecoration(),
                        validator: (value) {
                          if (value == null || value == "") {
                            return 'Please enter a value.';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(width: 10),
                    const _Heading(text: "%")
                  ],
                ),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const _HeadingImp(text: "OPD"),
                    const Spacer(),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        controller: opdDiscountCtrl,
                        decoration: inputDecoration(),
                        validator: (value) {
                          if (value == null || value == "") {
                            return 'Please enter a value.';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(width: 10),
                    const _Heading(text: "%")
                  ],
                ),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const _HeadingImp(text: "Others"),
                    const Spacer(),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        controller: otherDiscountCtrl,
                        decoration: inputDecoration(),
                        validator: (value) {
                          if (value == null || value == "") {
                            return 'Please enter a value.';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(width: 10),
                    const _Heading(text: "%")
                  ],
                ),
                const SizedBox(height: 15),
                const _HeadingImp(
                    text:
                        "Cardholders with “Swasth 4 U”  agreed discount time from today : Up to"),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        controller: discountTimeCtrl,
                        decoration: inputDecoration(),
                        validator: (value) {
                          if (value == null || value == "") {
                            return 'Please enter Year.';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      "Year",
                      textScaleFactor: 1.2,
                    )
                  ],
                ),
                const SizedBox(height: 15),
                const _HeadingImp(
                    text: "Free medical camps will be given by us in a month"),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        controller: freeCampsMonthCtrl,
                        decoration: inputDecoration(),
                        validator: (value) {
                          if (value == null || value == "") {
                            return 'Please enter months.';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      "Months",
                      textScaleFactor: 1.2,
                    )
                  ],
                ),
                const SizedBox(height: 15),
                const _HeadingImp(text: "Appointment Type"),
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Row(
                        children: <Widget>[
                          const Text(
                            "Offline",
                            textScaleFactor: 1.2,
                          ),
                          Radio(
                            value: "Offline",
                            groupValue: appointmentType,
                            onChanged: <String>(value) {
                              setState(() {
                                appointmentType = value!;
                              });
                            },
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Row(
                        children: <Widget>[
                          const Text(
                            "Online",
                            textScaleFactor: 1.2,
                          ),
                          Radio(
                            value: "Online",
                            groupValue: appointmentType,
                            onChanged: <String>(value) {
                              setState(() {
                                appointmentType = value!;
                              });
                            },
                          )
                        ],
                      ),
                    )
                  ],
                ),
                if (appointmentOnline)
                  const _Heading(text: "Consultation Payment Method"),
                if (appointmentOnline)
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: Row(
                          children: <Widget>[
                            const Text(
                              "Offline",
                              textScaleFactor: 1.2,
                            ),
                            Radio(
                              value: "Offline",
                              groupValue: consultationPaymentMethod,
                              onChanged: <String>(value) {
                                setState(() {
                                  consultationPaymentMethod = value!;
                                });
                              },
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: Row(
                          children: <Widget>[
                            const Text(
                              "Online",
                              textScaleFactor: 1.2,
                            ),
                            Radio(
                              value: "Online",
                              groupValue: consultationPaymentMethod,
                              onChanged: <String>(value) {
                                setState(() {
                                  consultationPaymentMethod = value!;
                                });
                              },
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                if (appointmentOnline) const SizedBox(height: 15),
                if (appointmentOnline && consultationOnline)
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const _Heading(text: "Benificiary Name"),
                      TextFormField(
                        controller: benificiaryCtrl,
                        decoration: inputDecoration(),
                        validator: (value) {
                          if (value == null || value == "") {
                            return 'Please select Name.';
                          }
                          return null;
                        },
                      ),
                      const _Heading(text: "Bank Name"),
                      TextFormField(
                        controller: bankNameCtrl,
                        decoration: inputDecoration(),
                        validator: (value) {
                          if (value == null || value == "") {
                            return 'Please select Bank Name.';
                          }
                          return null;
                        },
                      ),
                      const _Heading(text: "A/C No."),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        controller: acNoCtrl,
                        decoration: inputDecoration(),
                        validator: (value) {
                          if (value == null || value == "") {
                            return 'Please select A/C No.';
                          }
                          return null;
                        },
                      ),
                      const _Heading(text: "IFSC Name"),
                      TextFormField(
                        controller: ifscCodeCtrl,
                        decoration: inputDecoration(),
                        validator: (value) {
                          if (value == null || value == "") {
                            return 'Please select IFSC Name';
                          }
                          return null;
                        },
                      ),
                      const _Heading(text: "Branch"),
                      TextFormField(
                        controller: branchCtrl,
                        decoration: inputDecoration(),
                        validator: (value) {
                          if (value == null || value == "") {
                            return 'Please select Branch.';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                const SizedBox(height: 20),
                MyMap(
                  searchCtrl: searchCtrl,
                ),
                const SizedBox(height: 20),
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
                  // keyboardType: TextInputType.number,
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

                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: 1,
                        color: Colors.blue,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: 1,
                        color: Colors.blue,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
                const SizedBox(height: 40),

                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "DECLARATION",
                    textScaleFactor: 1.5,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                  // width: double.maxFinite,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  // mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Checkbox(
                      value: _acceptTerms,
                      onChanged: (bool? val) {
                        setState(() {
                          _acceptTerms = val!;
                        });
                      },
                      side: const BorderSide(
                          color: Color.fromRGBO(155, 155, 155, 1), width: 2),
                    ),
                    // SizedBox(width: 5),
                    const Expanded(
                      // width: deviceSize.width * 0.6,
                      child: Text(
                        " I hereby declare that all the particulars given in the Associate Application are true, complete and correct to the best of my knowledge and belief. I understand that if any information is found to be false or I do not fulfil the consent / criteria to give exemption to the Swasth 4U A Health & Wellness Card holder given by me and to organize free health camps at Panchayat level by the organization, then My Associate registration will be terminated. I have read the brochure of the organization and agree to abide by the rules, regulations and procedures, a little cooperation in social welfare by associating with Swasth 4U.",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          color: Color.fromRGBO(155, 155, 155, 1),
                        ),
                      ),
                    ),
                  ],
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

class _HeadingImp extends StatelessWidget {
  const _HeadingImp({Key? key, required this.text}) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0, bottom: 10),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.8),
              child: Text(
                text,
                textScaleFactor: 1.2,
              ),
            ),
            const Text(
              "*",
              style: TextStyle(color: Colors.red),
              textScaleFactor: 1.5,
            ),
          ],
        ),
      ),
    );
  }
}
