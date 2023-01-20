import 'package:demo/utils/custom_size.dart';
import 'package:demo/widgets/area_filter.dart';

import 'package:demo/widgets/hospital_preview_widget.dart';
import 'package:flutter/material.dart';

import 'package:demo/widgets/page_heading.dart';

// ignore: must_be_immutable
class PhysiotherapyListScreen extends StatefulWidget {
  const PhysiotherapyListScreen({Key? key, required this.physiotherapy})
      : super(key: key);
  final String physiotherapy;
  @override
  State<PhysiotherapyListScreen> createState() =>
      _PhysiotherapyListScreenState();
}

class _PhysiotherapyListScreenState extends State<PhysiotherapyListScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController searchCtrl = TextEditingController();
  final formKey = GlobalKey<FormState>();
  CustomSize customSize = CustomSize();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     showGeneralDialog(
      //       context: context,
      //       barrierColor: Colors.black12.withOpacity(0.6), // Background color
      //       barrierDismissible: true,
      //       barrierLabel: 'Dialog',
      //       transitionDuration: const Duration(milliseconds: 400),
      //       pageBuilder: (_, __, ___) {
      //         return const AreaFilterScreen();
      //       },
      //     );
      //   },
      //   backgroundColor: const Color.fromRGBO(0, 106, 183, 1),
      //   child: const ImageIcon(AssetImage("assets/filter.png")),
      // ),
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
      body: Builder(builder: (context) {
        return SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            children: <Widget>[
              PageHeading(
                text: widget.physiotherapy,
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 40),
                child: Form(
                  key: formKey,
                  child: Material(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                    child: TextFormField(
                      controller: searchCtrl,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Enter text to search";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        filled: true,
                        focusColor: const Color.fromRGBO(234, 247, 255, 1),
                        hoverColor: const Color.fromRGBO(234, 247, 255, 1),
                        fillColor: const Color.fromRGBO(234, 247, 255, 1),
                        prefix: Padding(
                          padding: const EdgeInsets.only(left: 10, right: 15.0),
                          child: IconButton(
                            onPressed: () {},
                            icon: const ImageIcon(
                              AssetImage("assets/search.png"),
                              color: Color.fromRGBO(0, 175, 239, 1),
                            ),
                            iconSize: 20,
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 1,
                            color: Colors.red,
                          ),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        hintStyle: const TextStyle(
                            color: Color.fromRGBO(54, 105, 166, 1)),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 1,
                            color: Colors.red,
                          ),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 5),
                        labelStyle: const TextStyle(
                          color: Color.fromRGBO(79, 124, 177, 1),
                        ),
                        floatingLabelStyle: const TextStyle(
                            color: Color.fromRGBO(79, 124, 177, 1),
                            fontSize: 10),
                        hintText: "Search...",
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 1,
                            color: Color.fromRGBO(0, 175, 239, 1),
                          ),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 1,
                            color: Color.fromRGBO(0, 175, 239, 1),
                          ),
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                constraints: BoxConstraints(
                    // maxHeight: MediaQuery.of(context).size.height * 0.72,
                    maxHeight:
                        customSize.getHeightForScreenWithoutBottomNav(context) -
                            75),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: (context, index) => HospitalPreviewTile(
                    discount: index.isEven,
                  ),
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
