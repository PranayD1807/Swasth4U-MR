import 'package:demo/screens/auth/forgot_password_screen2.dart';
import 'package:demo/screens/need_help_screen.dart';

import 'package:flutter/material.dart';

class ForgotPassword1 extends StatefulWidget {
  const ForgotPassword1({Key? key}) : super(key: key);

  @override
  State<ForgotPassword1> createState() => _ForgotPassword1State();
}

class _ForgotPassword1State extends State<ForgotPassword1> {
  final formKey = GlobalKey<FormState>();
  bool _isObscure = true;
  final TextEditingController phoneNumberCtrler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    sendOTP() {
      bool isValid = formKey.currentState!.validate();
      if (!isValid) {
        return;
      }
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const ForgotPasswordScreen2(),
        ),
      );
    }

    return Scaffold(
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
                    "Forgot pasword",
                    textScaleFactor: 1.5,
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
                    "Enter the email linked with your SWASTH 4U account.",
                    // textScaleFactor: 1.5,
                    style: TextStyle(
                      fontSize: 10,
                      color: Color.fromRGBO(54, 105, 166, 1),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                TextFormField(
                  controller: phoneNumberCtrler,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter Email or Number";
                    }
                    return null;
                  },
                  obscureText: _isObscure,
                  // keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    suffix: IconButton(
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      onPressed: () {
                        setState(() {
                          _isObscure = !_isObscure;
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
                    label: const Text("Enter address or phone number"),
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
                const SizedBox(
                  height: 30,
                  // width: double.maxFinite,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.65,
                  child: TextButton(
                    onPressed: () {
                      sendOTP();
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
                      "Send",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.4),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
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
                    const SizedBox(height: 10)
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
