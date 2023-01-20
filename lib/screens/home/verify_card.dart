import 'package:demo/widgets/popup_check_card_verification_widget.dart';
import 'package:demo/widgets/page_heading.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class VerifyCardScreen extends StatefulWidget {
  const VerifyCardScreen({Key? key}) : super(key: key);

  @override
  State<VerifyCardScreen> createState() => _VerifyCardScreenState();
}

class _VerifyCardScreenState extends State<VerifyCardScreen> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController aadharNumberCtrler = TextEditingController();
  final TextEditingController phoneNumberCtrler = TextEditingController();
  final TextEditingController cardNumberCtrler = TextEditingController();

  var mobileMaskFormatter = MaskTextInputFormatter(
    mask: '+91 ##### #####',
    type: MaskAutoCompletionType.lazy,
  );
  var aadharMaskFormatter = MaskTextInputFormatter(
    mask: '#### #### ####',
    type: MaskAutoCompletionType.lazy,
  );
  var cardMaskFormatter = MaskTextInputFormatter(
    mask: '#### #### #### ####',
    type: MaskAutoCompletionType.lazy,
  );
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
      body: Form(
        key: formKey,
        child: Column(
          children: <Widget>[
            const PageHeading(
              text: "Verify Card",
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 50),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.0),
                        child: Text(
                          "Enter Details to verify Card",
                          textScaleFactor: 1.3,
                          textAlign: TextAlign.left,
                        ),
                      ),
                      // aadhar
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.0),
                        child: Text(
                          "Aadhar Number",
                          textAlign: TextAlign.left,
                        ),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        inputFormatters: [aadharMaskFormatter],
                        controller: aadharNumberCtrler,
                        decoration: inputDecoration,
                      ),
                      // Phone Number
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.0),
                        child: Text(
                          "Phone Number",
                          textAlign: TextAlign.left,
                        ),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        inputFormatters: [mobileMaskFormatter],
                        controller: phoneNumberCtrler,
                        decoration: inputDecoration,
                      ),
                      const Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: EdgeInsets.only(top: 20.0),
                          child: Text(
                            "Or",
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                      // Card Number
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.0),
                        child: Text(
                          "Card Number",
                          textAlign: TextAlign.left,
                        ),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        inputFormatters: [cardMaskFormatter],
                        controller: cardNumberCtrler,
                        decoration: inputDecoration,
                      ),
                      const SizedBox(height: 50),

                      Align(
                        alignment: Alignment.center,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            minimumSize: Size(
                                MediaQuery.of(context).size.width * 0.5, 5),
                            elevation: 0,
                            backgroundColor:
                                const Color.fromRGBO(0, 175, 239, 1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                          ),
                          onPressed: () {
                            showGeneralDialog(
                              context: context,
                              barrierColor: Colors.black12
                                  .withOpacity(0.6), // Background color
                              barrierDismissible: true,
                              barrierLabel: 'Dialog',
                              transitionDuration:
                                  const Duration(milliseconds: 400),
                              pageBuilder: (_, __, ___) {
                                return const CheckCardVerificationWidget();
                              },
                            );
                          },
                          child: const Text(
                            "Verify",
                            textScaleFactor: 1.5,
                            style: TextStyle(
                              // fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
