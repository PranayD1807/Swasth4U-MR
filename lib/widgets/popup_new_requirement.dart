import 'package:demo/widgets/popup_request_submission_status.dart';
import 'package:flutter/material.dart';

class PopupNewRequirement extends StatefulWidget {
  const PopupNewRequirement({Key? key, this.isEditing = false})
      : super(key: key);
  final bool isEditing;
  @override
  State<PopupNewRequirement> createState() => _PopupNewRequirementState();
}

class _PopupNewRequirementState extends State<PopupNewRequirement> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController titleCtrl = TextEditingController();
  final TextEditingController descriptionCtrl = TextEditingController();

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
    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: const Color.fromRGBO(0, 106, 183, 1),
                ),
                borderRadius: BorderRadius.circular(15),
                color: const Color.fromRGBO(236, 247, 255, 1)),
            width: MediaQuery.of(context).size.width * 0.9,
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            child: Material(
              color: const Color.fromRGBO(236, 247, 255, 1),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        constraints: const BoxConstraints(),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(
                          Icons.close,
                          color: Color.fromRGBO(0, 106, 183, 1),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.45,
                      child: FittedBox(
                        child: Text(
                          widget.isEditing
                              ? "Edit Requirement"
                              : "Submit Requirement",
                          textScaleFactor: 1.2,
                          style: const TextStyle(
                            shadows: [
                              Shadow(
                                color: Color.fromRGBO(0, 106, 183, 1),
                                offset: Offset(0, -5),
                              )
                            ],
                            decorationThickness: 2,
                            decoration: TextDecoration.underline,
                            decorationColor: Color.fromRGBO(0, 106, 183, 1),
                            // color: Color.fromRGBO(0, 106, 183, 1),
                            color: Colors.transparent,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25.0),
                        child: Text(
                          "Enter Title",
                          textScaleFactor: 1.2,
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: TextFormField(
                        controller: titleCtrl,
                        decoration: inputDecoration,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25.0),
                        child: Text(
                          "Enter Description",
                          textScaleFactor: 1.2,
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: TextFormField(
                        maxLines: 3,
                        controller: descriptionCtrl,
                        decoration: inputDecoration,
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextButton(
                      style: TextButton.styleFrom(
                        minimumSize:
                            Size(MediaQuery.of(context).size.width * 0.4, 5),
                        elevation: 0,
                        backgroundColor: const Color.fromRGBO(0, 175, 239, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 20),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                        showGeneralDialog(
                          context: context,
                          barrierColor: Colors.black12
                              .withOpacity(0.6), // Background color
                          barrierDismissible: true,
                          barrierLabel: 'Dialog',
                          transitionDuration: const Duration(milliseconds: 400),
                          pageBuilder: (_, __, ___) {
                            return const PopUpStatusWidget();
                          },
                        );
                      },
                      child: const Text(
                        "Confirm",
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
        ],
      ),
    );
  }
}
