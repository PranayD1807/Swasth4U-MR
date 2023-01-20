import 'dart:async';

import 'package:demo/screens/need_help_screen.dart';
import 'package:demo/screens/tab_screen.dart';
import 'package:flutter/material.dart';

import 'package:pin_code_fields/pin_code_fields.dart';

class ForgotPasswordScreen2 extends StatefulWidget {
  const ForgotPasswordScreen2({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen2> createState() => _ForgotPasswordScreen2State();
}

class _ForgotPasswordScreen2State extends State<ForgotPasswordScreen2> {
  // TextEditingController textEditingController = TextEditingController();
  // ..text = "123456";

  // StreamController<ErrorAnimationType> errorController = StreamController();

  bool hasError = false;
  String currentText = "";
  final formKey = GlobalKey<FormState>();
  bool _newPasswordObscure = true;
  bool _confirmNewPasswordObscure = true;

  final TextEditingController newPassword = TextEditingController();
  final TextEditingController otpCtrl = TextEditingController();

  final TextEditingController newPasswordConfirm = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void trySubmit() {
      bool isValid = formKey.currentState!.validate();
      if (!isValid) {
        return;
      }
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const TabsScreen(),
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
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Column(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Image.asset(
                    "assets/logo.png",
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(
                  height: 50,
                  width: double.maxFinite,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Enter OTP",
                    // textScaleFactor: 1.5,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(54, 105, 166, 1),
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
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(54, 105, 166, 1),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                  width: double.maxFinite,
                ),
                // enter pin code
                TextFormField(
                  controller: otpCtrl,
                  validator: (value) {
                    if (value == null) {
                      return "Enter OTP";
                    } else if (value.length < 3) {
                      return "Enter Complete OTP";
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    suffix: null,
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
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: 1,
                        color: Color.fromRGBO(0, 175, 239, 1),
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    hintStyle: const TextStyle(
                        color: Color.fromRGBO(79, 124, 177, 1), fontSize: 10),
                    hintText: "OTP Code",
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: 1,
                        color: Color.fromRGBO(0, 175, 239, 1),
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
                const SizedBox(height: 10),

                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Enter New Password",
                    // textScaleFactor: 1.5,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(54, 105, 166, 1),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                // New password
                TextFormField(
                  controller: newPassword,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter New Password";
                    }
                    return null;
                  },
                  obscureText: _newPasswordObscure,
                  // keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    suffix: IconButton(
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      onPressed: () {
                        setState(() {
                          _newPasswordObscure = !_newPasswordObscure;
                        });
                      },
                      iconSize: 15,
                      icon: const ImageIcon(
                        AssetImage(
                          "assets/eye.png",
                        ),
                        color: Colors.lightBlue,
                      ),
                    ),
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
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    labelStyle: const TextStyle(
                        color: Color.fromRGBO(79, 124, 177, 1), fontSize: 10),
                    floatingLabelStyle: const TextStyle(
                        color: Color.fromRGBO(79, 124, 177, 1), fontSize: 10),
                    label: const Text("New Password"),
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
                  ),
                ),
                const SizedBox(height: 20),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Re-Enter Password",
                    // textScaleFactor: 1.5,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(54, 105, 166, 1),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                // New password
                TextFormField(
                  controller: newPasswordConfirm,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter Confirm New Password";
                    }
                    if (newPassword.text != value) {
                      return "Passwords do not Match!";
                    }
                    return null;
                  },
                  obscureText: _confirmNewPasswordObscure,
                  // keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    suffix: IconButton(
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      onPressed: () {
                        setState(() {
                          _confirmNewPasswordObscure =
                              !_confirmNewPasswordObscure;
                        });
                      },
                      iconSize: 15,
                      icon: const ImageIcon(
                        AssetImage(
                          "assets/eye.png",
                        ),
                        color: Colors.lightBlue,
                      ),
                    ),
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
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    labelStyle: const TextStyle(
                        color: Color.fromRGBO(79, 124, 177, 1), fontSize: 10),
                    floatingLabelStyle: const TextStyle(
                        color: Color.fromRGBO(79, 124, 177, 1), fontSize: 10),
                    label: const Text("New Password"),
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
                  ),
                ),

                const SizedBox(height: 30),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.65,
                  child: TextButton(
                    onPressed: () {
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
                      "Login",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

                Align(
                  heightFactor: 4,
                  alignment: Alignment.bottomCenter,
                  child: TextButton(
                    child: const Text(
                      "Need help?",
                      style: TextStyle(color: Color.fromRGBO(102, 101, 101, 1)),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const NeedHelpScreen(),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
