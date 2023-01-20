import 'package:demo/data/user_type.dart';
import 'package:demo/widgets/page_heading.dart';

import 'package:flutter/material.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({Key? key}) : super(key: key);

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  final formKey = GlobalKey<FormState>();
  UserDef? userDef;
  // decor
  InputDecoration inputDecoration = InputDecoration(
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
  final TextEditingController fullNameCtrl = TextEditingController();
  final TextEditingController fatherOrHusbandNameCtrl = TextEditingController();
  final TextEditingController motherName = TextEditingController();
  final TextEditingController aadharNoCtrl = TextEditingController();
  final TextEditingController panNoCtrl = TextEditingController();
  final TextEditingController pfNoCtrl = TextEditingController();

  final TextEditingController addressCtrl = TextEditingController();
  final TextEditingController stateCtrl = TextEditingController();
  final TextEditingController districtCtrl = TextEditingController();
  final TextEditingController blockCtrl = TextEditingController();
  final TextEditingController pincodeCtrl = TextEditingController();
  final TextEditingController phoneNumberCtrl = TextEditingController();
  final TextEditingController emailCtrl = TextEditingController();

  final TextEditingController dobCtrl = TextEditingController();
  final TextEditingController maritialStatusCtrl = TextEditingController();

  final TextEditingController bankNameCtrl = TextEditingController();
  final TextEditingController acNoCtrl = TextEditingController();
  final TextEditingController ifscCodeCtrl = TextEditingController();
  final TextEditingController branchCtrl = TextEditingController();

  final TextEditingController joiningDateCtrl = TextEditingController();
  final TextEditingController salaryCtrl = TextEditingController();

  Future<void> getUserType() async {
    UserDef? userType = await UserType().getUserType();
    userDef = userType;
  }

  @override
  void initState() {
    super.initState();

    fullNameCtrl.text = "Full Name";
    fatherOrHusbandNameCtrl.text = "Father's/Husband's Name";
    motherName.text = "Dr. Kamal Kishor Prasad";
    aadharNoCtrl.text = "4648 9815 9845";
    panNoCtrl.text = "ASDFGH123";
    addressCtrl.text = "Main Road, City, In front of Mall.";
    stateCtrl.text = "Bihar";
    districtCtrl.text = "Patna";
    blockCtrl.text = "Digha";
    pincodeCtrl.text = "800004";
    phoneNumberCtrl.text = "9784515265";
    emailCtrl.text = "sample@sample.com";
    dobCtrl.text = "DD/MM/YYYY";
    maritialStatusCtrl.text = "Maritial Status";
    bankNameCtrl.text = "Bank Name";
    acNoCtrl.text = "09876541324568";
    ifscCodeCtrl.text = "ASDFG1234";
    pfNoCtrl.text = "QW6516E";

    branchCtrl.text = "Patna";
    joiningDateCtrl.text = "DD/MM/YYYY";
    salaryCtrl.text = "20000/-";
  }

  @override
  Widget build(BuildContext context) {
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
      body: FutureBuilder(
          future: getUserType(),
          builder: (context, snapshot) {
            return Form(
              key: formKey,
              child: Column(
                children: <Widget>[
                  const PageHeading(
                    text: "My Profile",
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Container(
                        // height: 500,
                        width: double.maxFinite,
                        margin: const EdgeInsets.only(
                            top: 10, right: 15, left: 15, bottom: 10),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color.fromRGBO(17, 136, 222, 1),
                          ),
                          color: const Color.fromRGBO(236, 247, 255, 1),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const SizedBox(height: 20),
                              Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 5,
                                        color: const Color.fromRGBO(
                                            0, 106, 183, 1),
                                      ),
                                    ),
                                    height: MediaQuery.of(context).size.height *
                                        0.20,
                                    width: MediaQuery.of(context).size.height *
                                        0.17,
                                    child: Image.asset(
                                      "assets/user_person.png",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              ConstrainedBox(
                                constraints: BoxConstraints(
                                    maxWidth:
                                        MediaQuery.of(context).size.width *
                                            0.6),
                                child: const FittedBox(
                                  child: Text(
                                    "Employee Code: SMR0010029",
                                    textScaleFactor: 1.2,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              ConstrainedBox(
                                constraints: BoxConstraints(
                                    maxWidth:
                                        MediaQuery.of(context).size.width *
                                            0.6),
                                child: FittedBox(
                                  child: Text(
                                    userDef == UserDef.PD
                                        ? "Post: Panchayat Developer (PD)"
                                        : userDef == UserDef.MR
                                            ? "Post: Medical Representative (MR)"
                                            : "ERROR",
                                    textScaleFactor: 1.2,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              const _Heading(text: "Full Name"),
                              TextFormField(
                                controller: fullNameCtrl,
                                decoration: inputDecoration,
                              ),
                              const _Heading(text: "Father's/Husband's Name"),
                              TextFormField(
                                controller: fatherOrHusbandNameCtrl,
                                decoration: inputDecoration,
                              ),
                              const _Heading(text: "Mother's Name"),
                              TextFormField(
                                controller: motherName,
                                decoration: inputDecoration,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const _Heading(text: "Date of Birth"),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.4,
                                        child: TextFormField(
                                          controller: dobCtrl,
                                          decoration: inputDecoration,
                                        ),
                                      )
                                    ],
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const _Heading(text: "Maritial Status"),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.4,
                                        child: TextFormField(
                                          controller: maritialStatusCtrl,
                                          decoration: inputDecoration,
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              const _Heading(text: "AADHAR No"),
                              TextFormField(
                                controller: aadharNoCtrl,
                                decoration: inputDecoration,
                                keyboardType: TextInputType.number,
                              ),
                              const _Heading(text: "PAN No"),
                              TextFormField(
                                controller: panNoCtrl,
                                decoration: inputDecoration,
                                // keyboardType: TextInputType.number,
                              ),
                              const _Heading(text: "PF No"),
                              TextFormField(
                                controller: pfNoCtrl,
                                decoration: inputDecoration,
                                // keyboardType: TextInputType.number,
                              ),
                              const _Heading(text: "Address"),
                              TextFormField(
                                controller: addressCtrl,
                                maxLines: 3,
                                decoration: inputDecoration,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const _Heading(text: "State"),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.4,
                                        child: TextFormField(
                                          controller: stateCtrl,
                                          decoration: inputDecoration,
                                        ),
                                      )
                                    ],
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const _Heading(text: "District"),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.4,
                                        child: TextFormField(
                                          controller: districtCtrl,
                                          decoration: inputDecoration,
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const _Heading(text: "Block"),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.4,
                                        child: TextFormField(
                                          controller: blockCtrl,
                                          decoration: inputDecoration,
                                        ),
                                      )
                                    ],
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const _Heading(text: "Pin Code"),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.4,
                                        child: TextFormField(
                                          controller: pincodeCtrl,
                                          decoration: inputDecoration,
                                          keyboardType: TextInputType.number,
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              const _Heading(text: "Bank Name"),
                              TextFormField(
                                controller: bankNameCtrl,
                                decoration: inputDecoration,
                              ),
                              const _Heading(text: "A/C No."),
                              TextFormField(
                                controller: acNoCtrl,
                                decoration: inputDecoration,
                                keyboardType: TextInputType.number,
                              ),
                              const _Heading(text: "IFSC Name"),
                              TextFormField(
                                controller: ifscCodeCtrl,
                                decoration: inputDecoration,
                              ),
                              const _Heading(text: "Branch"),
                              TextFormField(
                                controller: branchCtrl,
                                decoration: inputDecoration,
                              ),
                              const _Heading(text: "Joining Date"),
                              TextFormField(
                                controller: joiningDateCtrl,
                                decoration: inputDecoration,
                                keyboardType: TextInputType.number,
                              ),
                              const _Heading(text: "Salary"),
                              TextFormField(
                                controller: salaryCtrl,
                                decoration: inputDecoration,
                                keyboardType: TextInputType.number,
                              ),
                              const _Heading(text: "Phone Number"),
                              TextFormField(
                                controller: phoneNumberCtrl,
                                decoration: inputDecoration,
                                keyboardType: TextInputType.number,
                              ),
                              const _Heading(text: "Email ID"),
                              TextFormField(
                                controller: emailCtrl,
                                keyboardType: TextInputType.emailAddress,
                                decoration: inputDecoration,
                              ),
                              const SizedBox(height: 20),
                              TextButton(
                                style: TextButton.styleFrom(
                                  minimumSize: Size(
                                      MediaQuery.of(context).size.width * 0.35,
                                      5),
                                  elevation: 0,
                                  backgroundColor:
                                      const Color.fromRGBO(0, 175, 239, 1),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 20),
                                ),
                                onPressed: () {},
                                child: const Text(
                                  "Update",
                                  textScaleFactor: 1.2,
                                  style: TextStyle(
                                    // fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
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
