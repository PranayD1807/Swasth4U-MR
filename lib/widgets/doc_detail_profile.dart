import 'package:flutter/material.dart';

class DocDetailsProfileWidget extends StatefulWidget {
  const DocDetailsProfileWidget({
    Key? key,
    required this.nameCtrl,
    required this.designationCtrl,
    required this.departmentCtrl,
  }) : super(key: key);
  final TextEditingController nameCtrl;
  final TextEditingController designationCtrl;
  final TextEditingController departmentCtrl;
  @override
  State<DocDetailsProfileWidget> createState() =>
      _DocDetailsProfileWidgetState();
}

class _DocDetailsProfileWidgetState extends State<DocDetailsProfileWidget> {
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
          decoration: const BoxDecoration(
            // border: Border.all(width: 1, color: Colors.blue),
            color: Color.fromRGBO(213, 242, 253, 0.14),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const _Heading(text: "Doctors Name"),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.35,
                        child: TextFormField(
                          controller: widget.nameCtrl,
                          decoration: inputDecoration,
                          validator: (value) {
                            if (value == null || value == "") {
                              return 'Please select Doctors Name.';
                            }
                            return null;
                          },
                        ),
                      )
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const _Heading(text: "Designation"),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value == "") {
                              return 'Please select Designation.';
                            }
                            return null;
                          },
                          controller: widget.designationCtrl,
                          decoration: inputDecoration,
                        ),
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const _Heading(text: "Department"),
              const SizedBox(height: 10),
              TextFormField(
                validator: (value) {
                  if (value == null || value == "") {
                    return 'Please select Department.';
                  }
                  return null;
                },
                controller: widget.departmentCtrl,
                decoration: inputDecoration,
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
      child: ConstrainedBox(
        constraints:
            BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.3),
        child: Text(
          text,
          textScaleFactor: 1.2,
        ),
      ),
    );
  }
}
