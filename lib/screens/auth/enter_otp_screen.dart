import 'package:demo/screens/need_help_screen.dart';
import 'package:demo/screens/tab_screen.dart';
import 'package:flutter/material.dart';

class EnterOTPScreen extends StatefulWidget {
  const EnterOTPScreen({Key? key}) : super(key: key);

  @override
  State<EnterOTPScreen> createState() => _EnterOTPScreenState();
}

class _EnterOTPScreenState extends State<EnterOTPScreen> {
  TextEditingController otpCtrl = TextEditingController();
  // ..text = "123456";

  // StreamController<ErrorAnimationType> errorController = StreamController();

  bool hasError = false;
  String currentText = "";
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    void trySubmit() {
      bool isValid = formKey.currentState!.validate();
      if (!isValid) {
        return;
      }
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => TabsScreen()),
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
                height: 20,
                width: double.maxFinite,
              ),
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
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
              // PinCodeTextField(
              //   appContext: context,
              //   pastedTextStyle: const TextStyle(
              //     color: Colors.lightBlue,
              //     fontWeight: FontWeight.bold,
              //   ),
              //   length: 6,
              //   obscureText: false,
              //   obscuringCharacter: '*',
              //   animationType: AnimationType.fade,
              //   validator: (v) {
              //     if (v!.length < 3) {
              //       return "Enter Complete OTP";
              //     } else {
              //       return null;
              //     }
              //   },
              //   pinTheme: PinTheme(
              //     activeColor: Colors.lightBlue,
              //     inactiveColor: Colors.lightBlue,
              //     selectedColor: Colors.lightBlue,
              //     shape: PinCodeFieldShape.box,
              //     borderWidth: 1,
              //     borderRadius: BorderRadius.circular(5),
              //     fieldHeight: 40,
              //     fieldWidth: 40,
              //     activeFillColor: hasError ? Colors.orange : Colors.white,
              //   ),
              //   cursorColor: Colors.black,
              //   animationDuration: const Duration(milliseconds: 100),
              //   textStyle: const TextStyle(
              //       fontSize: 20,
              //       height: 1.6,
              //       color: Color.fromRGBO(54, 105, 166, 1)),
              //   errorAnimationController: errorController,
              //   controller: textEditingController,
              //   keyboardType: TextInputType.number,
              //   onCompleted: (v) {
              //     // print("Completed");
              //   },
              //   onChanged: (value) {
              //     setState(() {
              //       currentText = value;
              //     });
              //   },
              //   beforeTextPaste: (text) {
              //     return true;
              //   },
              // ),

              const SizedBox(height: 70),
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
              Expanded(
                  child: Align(
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
              ))
            ],
          ),
        ),
      ),
    );
  }
}
