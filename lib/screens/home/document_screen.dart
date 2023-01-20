import 'package:demo/widgets/page_heading.dart';
import 'package:flutter/material.dart';

class DocumentScreen extends StatelessWidget {
  const DocumentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> data = [
      {
        "no": "01",
        "documentName": "Aadhar Card",
        "date": "DD/MM/YYYY",
      },
      {
        "no": "02",
        "documentName": "Aadhar Card",
        "date": "DD/MM/YYYY",
      },
      {
        "no": "03",
        "documentName": "Aadhar Card",
        "date": "DD/MM/YYYY",
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
            text: "Documents",
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 15),
                  const Text(
                    "Your Documents will be shown here.",
                    style: TextStyle(
                      color: Color.fromRGBO(0, 106, 183, 1),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 15),
                  const _RowItem(
                    first: "S.No.",
                    second: "Document Name",
                    third: "Date",
                    isHeading: true,
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: data
                        .map(
                          (element) => _RowItem(
                            first: element["no"]!,
                            second: element["documentName"]!,
                            third: element["date"]!,
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
      this.isHeading = false})
      : super(key: key);

  final String first;
  final String second;
  final String third;

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
                color: isHeading ? const Color.fromRGBO(0, 106, 183, 1) : null),
            child: Center(
              child: FittedBox(
                child: Text(
                  first,
                  style: TextStyle(
                    color: isHeading
                        ? Colors.white
                        : const Color.fromRGBO(0, 106, 183, 1),
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
                color: isHeading ? const Color.fromRGBO(0, 106, 183, 1) : null),
            child: Center(
              child: FittedBox(
                child: Text(
                  second,
                  style: TextStyle(
                    color: isHeading
                        ? Colors.white
                        : const Color.fromRGBO(0, 106, 183, 1),
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
              color: isHeading ? const Color.fromRGBO(0, 106, 183, 1) : null,
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color: const Color.fromRGBO(0, 106, 183, 1),
              ),
            ),
            child: Center(
              child: FittedBox(
                child: Text(
                  third,
                  style: TextStyle(
                    color: isHeading
                        ? Colors.white
                        : const Color.fromRGBO(0, 106, 183, 1),
                  ),
                ),
              ),
            ),
          ),
          isHeading
              ? SizedBox(
                  width: rowlen * 0.2,
                  height: 30,
                )
              : SizedBox(
                  width: rowlen * 0.2,
                  // height: 30,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size.zero,
                      padding: const EdgeInsets.all(5),
                      fixedSize: Size(rowlen * 0.2, 30),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      primary: const Color.fromRGBO(0, 106, 183, 1),
                    ),
                    onPressed: () {},
                    child: const FittedBox(child: Text("Download")),
                  ),
                ),
        ],
      ),
    );
  }
}
