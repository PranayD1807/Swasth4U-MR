import 'package:demo/widgets/page_heading.dart';
import 'package:demo/widgets/popup_new_expense.dart';
import 'package:flutter/material.dart';

class ExpensesStatusScreen extends StatelessWidget {
  const ExpensesStatusScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> data = [
      {
        "no": "01",
        "title": "Rs 1000 for fuel",
        "submittedOn": "01/04/22",
      },
      {
        "no": "02",
        "title": "Rs 500 for dinner",
        "submittedOn": "29/03/22",
      },
      {
        "no": "03",
        "title": "Rs 200 for clothes",
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
            text: "Expense Status",
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 15),
                  const _RowItem(
                    first: "S.No.",
                    second: "Title",
                    third: "Submitted On",
                    fourthText: "Action",
                    isHeading: true,
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: data
                        .map(
                          (element) => _RowItem(
                            first: element["no"]!,
                            second: element["title"]!,
                            third: element["submittedOn"]!,
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
      required this.third,
      this.fourthText,
      this.isHeading = false})
      : super(key: key);

  final String first;
  final String second;
  final String third;
  final String? fourthText;

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
            width: rowlen * 0.1,
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
            width: rowlen * 0.4,
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
          Container(
            width: rowlen * 0.25,
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
                  third,
                  style: const TextStyle(
                    color: Color.fromRGBO(0, 106, 183, 1),
                  ),
                ),
              ),
            ),
          ),
          isHeading
              ? Container(
                  width: rowlen * 0.25,
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
                        fourthText!,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ))
              : SizedBox(
                  width: rowlen * 0.25,
                  // height: 30,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size.zero,
                          padding: const EdgeInsets.all(5),
                          fixedSize: Size(rowlen * 0.12, 30),
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
                              return const PopupNewExpense(
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
                          fixedSize: Size(rowlen * 0.12, 30),
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
