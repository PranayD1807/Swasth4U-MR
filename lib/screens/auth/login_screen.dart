import 'package:demo/screens/auth/enter_otp_screen.dart';
import 'package:demo/screens/auth/forgot_password_screen1.dart';
import 'package:demo/screens/need_help_screen.dart';

import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailOrUsernameCTRL = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final TextEditingController passwordCtrler = TextEditingController();
  bool _isObscure = true;
  bool _rememberMe = false;
  @override
  Widget build(BuildContext context) {
    void trySubmit() {
      bool isValid = _formKey.currentState!.validate();
      if (!isValid) {
        return;
      }
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const EnterOTPScreen(),
        ),
      );
    }

    void forgotPassword() {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const ForgotPassword1(),
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
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "Welcome back On!",
                      style: TextStyle(
                        color: Color.fromRGBO(80, 134, 199, 1),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                      width: double.maxFinite,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Image.asset(
                        "assets/logo.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 10.0, horizontal: 0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Login",
                          textScaleFactor: 1.5,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(54, 105, 166, 1),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                      width: double.maxFinite,
                    ),
                    // Mobile Number or AAdhar number text field
                    TextFormField(
                      controller: emailOrUsernameCTRL,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please Enter Email Id or User Name";
                        }

                        return null;
                      },
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
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
                            horizontal: 20, vertical: 15),
                        labelStyle: const TextStyle(
                            color: Color.fromRGBO(79, 124, 177, 1),
                            fontSize: 10),
                        floatingLabelStyle: const TextStyle(
                            color: Color.fromRGBO(79, 124, 177, 1),
                            fontSize: 10),
                        label: const Text("Email ID / User Name"),
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
                    //  Password
                    TextFormField(
                      controller: passwordCtrler,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter Password";
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
                            color: Color.fromRGBO(79, 124, 177, 1),
                            fontSize: 10),
                        floatingLabelStyle: const TextStyle(
                            color: Color.fromRGBO(79, 124, 177, 1),
                            fontSize: 10),
                        label: const Text("Enter Password"),
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
                    // SizedBox(height: 5),
                    // Remember Me & Forgot Password
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.3,
                          child: FittedBox(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Checkbox(
                                  value: _rememberMe,
                                  onChanged: (bool? val) {
                                    setState(() {
                                      _rememberMe = val!;
                                    });
                                  },
                                  side: const BorderSide(
                                      color: Colors.lightBlue, width: 2),
                                ),
                                // SizedBox(width: 5),
                                const Text(
                                  "Remember me",
                                  style: TextStyle(color: Colors.lightBlue),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.3,
                          child: FittedBox(
                            child: TextButton(
                              onPressed: () {
                                forgotPassword();
                              },
                              child: const Text(
                                "Forgot password?",
                                style: TextStyle(color: Colors.lightBlue),
                              ),
                            ),
                          ),
                        ),
                      ],
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
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 200.0, bottom: 20),
                  child: TextButton(
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
