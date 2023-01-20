import 'package:demo/widgets/page_heading.dart';
import 'package:demo/widgets/popup_new_complaint.dart';
import 'package:flutter/material.dart';

class ComplaintStatusScreen extends StatelessWidget {
  const ComplaintStatusScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> data = [
      {
        "no": "01",
        "submittedOn": "01/04/22",
      },
      {
        "no": "02",
        "submittedOn": "29/03/22",
      },
      {
        "no": "03",
        "submittedOn": "12/03/22",
      },
    ];
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
      body: Column(
        children: <Widget>[
          const PageHeading(
            text: "Complaint Status",
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 15),
                  const _RowItem(
                    first: "S.No.",
                    second: "Submitted On",
                    thirdText: "Action",
                    isHeading: true,
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: data
                        .map(
                          (element) => _RowItem(
                            first: element["no"]!,
                            second: element["submittedOn"]!,
                          ),
                        )
                        .toList(),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _RowItem extends StatelessWidget {
  const _RowItem(
      {Key? key,
      required this.first,
      required this.second,
      this.thirdText,
      this.isHeading = false})
      : super(key: key);

  final String first;
  final String second;
  final String? thirdText;

  final bool isHeading;
  @override
  Widget build(BuildContext context) {
    final rowlen = MediaQuery.of(context).size.width - 40;
    // rowlen = device width - total padding between elements
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: rowlen * 0.15,
            height: 30,
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color: const Color.fromRGBO(0, 106, 183, 1),
              ),
            ),
            child: Center(
              child: FittedBox(
                child: Text(
                  first,
                  style: const TextStyle(
                    color: Color.fromRGBO(0, 106, 183, 1),
                  ),
                ),
              ),
            ),
          ),
          Container(
            width: rowlen * 0.55,
            height: 30,
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color: const Color.fromRGBO(0, 106, 183, 1),
              ),
            ),
            child: Center(
              child: FittedBox(
                child: Text(
                  second,
                  style: const TextStyle(
                    color: Color.fromRGBO(0, 106, 183, 1),
                  ),
                ),
              ),
            ),
          ),
          isHeading
              ? Container(
                  width: rowlen * 0.3,
                  height: 30,
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color:
                        isHeading ? const Color.fromRGBO(0, 106, 183, 1) : null,
                  ),
                  child: Center(
                    child: FittedBox(
                      child: Text(
                        thirdText!,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ))
              : SizedBox(
                  width: rowlen * 0.3,
                  // height: 30,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size.zero,
                          padding: const EdgeInsets.all(5),
                          fixedSize: Size(rowlen * 0.14, 30),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          primary: const Color.fromRGBO(0, 106, 183, 1),
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
                              return const PopupNewComplaint(
                                isEditing: true,
                              );
                            },
                          );
                        },
                        child: const FittedBox(child: Text("Edit")),
                      ),
                      // const SizedBox(width: 5),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size.zero,
                          padding: const EdgeInsets.all(5),
                          fixedSize: Size(rowlen * 0.14, 30),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          primary: const Color.fromRGBO(0, 106, 183, 1),
                        ),
                        onPressed: () {},
                        child: const FittedBox(child: Text("Delete")),
                      ),
                    ],
                  ),
                ),
        ],
      ),
    );
  }
}
