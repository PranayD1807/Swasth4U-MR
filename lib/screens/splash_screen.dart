import 'package:demo/data/user_type.dart';
import 'package:demo/screens/auth/login_screen.dart';

import 'package:demo/screens/need_help_screen.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  //  Initial Selected Value
  String dropdownvalue = 'English';

  // List of items in our dropdown menu
  final items = [
    'English',
    'Hindi',
  ];

  final List userTypes = ["Medical Representative", "Panchayat Developer"];
  String? userType;
  var inputDecoration = InputDecoration(
    hintText: "Select Category....",
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
    // contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
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

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Center(
              child: Image.asset(
                "assets/login_image.png",
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                // mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SizedBox(
                    width: deviceSize.width * 0.6,
                    child: Image.asset(
                      "assets/logo.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: deviceSize.width * 0.6,
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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: DropdownButtonFormField2(
                      isExpanded: true,
                      dropdownElevation: 1,
                      icon: const Icon(Icons.arrow_drop_down_rounded),
                      buttonHeight: 20,
                      buttonPadding: const EdgeInsets.only(left: 5, right: 5),
                      validator: (value) {
                        if (value == null || value == "") {
                          return 'Please select Category.';
                        }
                        return null;
                      },
                      value: userType,
                      onChanged: (value) {
                        userType = value as String?;
                        print(userType);
                      },
                      onSaved: (value) {
                        userType = value as String?;
                      },
                      decoration: inputDecoration,
                      items: userTypes
                          .map(
                            (item) => DropdownMenuItem<String>(
                              value: item.toString(),
                              child: Text(
                                item.toString(),
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                  SizedBox(
                    width: deviceSize.width * 0.65,
                    child: TextButton(
                      onPressed: () {
                        if (userType != null) {
                          if (userType == "Medical Representative") {
                            UserType().saveUserType(UserDef.MR);
                          } else if (userType == "Panchayat Developer") {
                            UserType().saveUserType(UserDef.PD);
                          }
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ),
                          );
                        }
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
                        "Login",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          const Spacer(),
          TextButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const NeedHelpScreen(),
                ),
              );
            },
            child: const Text(
              "Need Help?",
              style: TextStyle(
                  color: Color.fromRGBO(102, 101, 101, 1),
                  fontWeight: FontWeight.w300),
            ),
          ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}
