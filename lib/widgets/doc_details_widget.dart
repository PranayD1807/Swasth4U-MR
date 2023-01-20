import 'dart:io';

import 'package:demo/utils/file_picker_utils.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class DocDetailsWidget extends StatefulWidget {
  const DocDetailsWidget({
    Key? key,
    required this.nameCtrl,
    required this.designationCtrl,
  }) : super(key: key);

  final TextEditingController nameCtrl;
  final TextEditingController designationCtrl;

  @override
  State<DocDetailsWidget> createState() => _DocDetailsWidgetState();
}

class _DocDetailsWidgetState extends State<DocDetailsWidget> {
  File? photo;

  String? selectedCategory;
  final List<String> categories = [
    'category',
    'Other',
  ];

  @override
  Widget build(BuildContext context) {
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

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Card(
        elevation: 2,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          // height: 300,
          width: double.maxFinite,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.blue),
            color: const Color.fromRGBO(215, 238, 255, 1),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const _Heading(text: "Name"),
                        TextFormField(
                          controller: widget.nameCtrl,
                          decoration: inputDecoration,
                        ),
                        const _Heading(text: "Designation"),
                        TextFormField(
                          decoration: inputDecoration,
                          controller: widget.designationCtrl,
                        ),
                        const _Heading(text: "Category"),
                        DropdownButtonFormField2(
                          isExpanded: true,
                          dropdownElevation: 3,
                          icon: const Icon(Icons.keyboard_arrow_down_outlined),
                          // icon: const ImageIcon(AssetImage(
                          //     "assets/entypo_select-arrows.png")),
                          iconSize: 20,
                          buttonHeight: 20,
                          buttonPadding:
                              const EdgeInsets.only(left: 5, right: 5),
                          dropdownDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          items: categories
                              .map((item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: const TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ))
                              .toList(),
                          validator: (value) {
                            if (value == null) {
                              return 'Please select Category.';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            //Do something when changing the item if you want.
                          },
                          onSaved: (value) {
                            selectedCategory = value.toString();
                          },
                          decoration: inputDecoration,
                        )
                      ],
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            width: 1,
                            color: const Color.fromRGBO(0, 106, 183, 1),
                          ),
                        ),
                        height: 140,
                        width: 120,
                        clipBehavior: Clip.antiAlias,
                        child: photo != null
                            ? Image.file(
                                photo!,
                                fit: BoxFit.cover,
                              )
                            : Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Image.asset(
                                        "assets/upload.png",
                                        fit: BoxFit.contain,
                                      ),
                                      const FittedBox(
                                        child: Text(
                                          "Upload Photo",
                                          textScaleFactor: 1.2,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color:
                                                Color.fromRGBO(0, 106, 183, 1),
                                            fontWeight: FontWeight.bold,
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
                ],
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  style: TextButton.styleFrom(
                    minimumSize: const Size(120, 10),
                    elevation: 0,
                    backgroundColor: const Color.fromRGBO(0, 175, 239, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                  ),
                  onPressed: () async {
                    var temp = await MyFilePickerUtil().fromGallery();
                    if (temp != null) {
                      setState(() {
                        photo = temp;
                      });
                    }
                  },
                  child: const Text(
                    "Choose File",

                    // textScaleFactor: 1.2,
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
