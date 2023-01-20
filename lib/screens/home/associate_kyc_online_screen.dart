import 'dart:developer';
import 'dart:io';

import 'package:demo/widgets/popup_request_submission_status.dart';
import 'package:demo/utils/file_picker_utils.dart';
import 'package:demo/widgets/doc_details_widget.dart';
import 'package:demo/widgets/file_picker.dart';
import 'package:demo/widgets/image_preview.dart';
import 'package:demo/widgets/page_heading.dart';

import 'package:flutter/material.dart';

class AssociateKYCOnlineScreen extends StatefulWidget {
  const AssociateKYCOnlineScreen({Key? key}) : super(key: key);

  @override
  State<AssociateKYCOnlineScreen> createState() =>
      _AssociateKYCOnlineScreenState();
}

class _AssociateKYCOnlineScreenState extends State<AssociateKYCOnlineScreen> {
  File? firmOrAssociatePhoto;
  File? certificateOrLicense;
  File? agreementLetter;
  final formKey = GlobalKey<FormState>();

  List<Map<String, TextEditingController>> doctorDetailCtrlers = [];

  List<DocDetailsWidget> docs = [];

  void addDocWidget() {
    setState(() {
      doctorDetailCtrlers.add({
        "docNameCtrl": TextEditingController(),
        "designation": TextEditingController(),
      });
      docs.add(
        DocDetailsWidget(
          designationCtrl: doctorDetailCtrlers[doctorDetailCtrlers.length - 1]
              ["designation"]!,
          nameCtrl: doctorDetailCtrlers[doctorDetailCtrlers.length - 1]
              ["docNameCtrl"]!,
        ),
      );
    });
  }

  @override
  void initState() {
    super.initState();
    addDocWidget();
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
      body: Form(
        key: formKey,
        child: Column(
          children: <Widget>[
            const PageHeading(
              text: "Associate KYC Online",
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 15),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: docs,
                      ),
                      IconButton(
                        onPressed: () => addDocWidget(),
                        icon: const Icon(
                          Icons.add_circle_outline,
                          size: 50,
                          color: Color.fromRGBO(26, 84, 153, 1),
                        ),
                      ),
                      const SizedBox(height: 40),
                      ImagePreview(
                        photo: firmOrAssociatePhoto,
                        text: "Firm Photo\nor\nAssociate Photo",
                      ),
                      const SizedBox(height: 20),
                      const _Heading(text: "Firm Photo/Associate Photo"),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: MyFilePickerButton(
                          function: () async {
                            var temp = await MyFilePickerUtil().fromGallery();
                            if (temp != null) {
                              setState(() {
                                firmOrAssociatePhoto = temp;
                              });
                            }
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      ImagePreview(
                        photo: certificateOrLicense,
                        text: "Certificate\nor\nLicense Photo",
                      ),
                      const SizedBox(height: 20),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Upload Certificate/License",
                          textScaleFactor: 1.2,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: MyFilePickerButton(
                          function: () async {
                            var temp = await MyFilePickerUtil().fromGallery();
                            if (temp != null) {
                              setState(() {
                                certificateOrLicense = temp;
                              });
                            }
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      ImagePreview(
                        photo: agreementLetter,
                        text: "Agreement Letter\nor\nLetter Pad",
                      ),
                      const SizedBox(height: 20),
                      const _Heading(text: "Agreement Letter/Letter Pad"),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: MyFilePickerButton(
                          function: () async {
                            var temp = await MyFilePickerUtil().fromGallery();
                            if (temp != null) {
                              setState(() {
                                agreementLetter = temp;
                              });
                            }
                          },
                        ),
                      ),
                      const SizedBox(height: 40),
                      TextButton(
                        style: TextButton.styleFrom(
                          minimumSize:
                              Size(MediaQuery.of(context).size.width * 0.5, 5),
                          elevation: 0,
                          backgroundColor: const Color.fromRGBO(0, 175, 239, 1),
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
                              return const PopUpStatusWidget();
                            },
                          );
                        },
                        child: const Text(
                          "Save",
                          textScaleFactor: 1.5,
                          style: TextStyle(
                            // fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),
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

class _Heading extends StatelessWidget {
  const _Heading({Key? key, required this.text}) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text,
            textScaleFactor: 1.2,
          ),
          const Text(
            "*",
            style: TextStyle(color: Colors.red),
            textScaleFactor: 1.5,
          ),
        ],
      ),
    );
  }
}
