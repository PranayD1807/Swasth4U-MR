import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

class DeleteReasonPopUp extends StatefulWidget {
  const DeleteReasonPopUp({Key? key, this.isCustomerCard = false})
      : super(key: key);
  final bool isCustomerCard;
  @override
  State<DeleteReasonPopUp> createState() => _DeleteReasonPopUpState();
}

class _DeleteReasonPopUpState extends State<DeleteReasonPopUp> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    List<String> reasons = [
      "Cancelation Reason",
      "Cancelation Reason",
      "Cancelation Reason",
      "Cancelation Reason",
      "Cancelation Reason",
      "Cancelation Reason",
      "Cancelation Reason",
    ];
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: const Color.fromRGBO(0, 106, 183, 1),
              ),
              borderRadius: BorderRadius.circular(15),
              color: const Color.fromRGBO(236, 247, 255, 1)),
          // height: MediaQuery.of(context).size.height * 0.7,
          width: MediaQuery.of(context).size.width * 0.8,
          // height: 100,
          // width: 100,
          child: reasons.isNotEmpty
              ? Material(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: const Icon(
                            Icons.close,
                            color: Color.fromRGBO(0, 106, 183, 1),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 25.0),
                          child: Text(
                            widget.isCustomerCard
                                ? "Delete Customer"
                                : "Delete Associate",
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
                      Container(
                        constraints: BoxConstraints(
                          maxHeight: MediaQuery.of(context).size.height * 0.55,
                        ),
                        padding: const EdgeInsets.all(15),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: reasons
                                .mapIndexed(
                                  (index, text) => _MyCheckBox(
                                    text: text,
                                    isSelected: selectedIndex == index,
                                    fn: (val) {
                                      setState(() {
                                        if (val == true) {
                                          selectedIndex = index;
                                        }
                                      });
                                    },
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      DefaultTextStyle(
                        style: TextStyle(
                          fontSize: 12,
                          color: Color.fromRGBO(0, 106, 183, 1),
                        ),
                        child: Text(
                          "You Have No Reasons",
                        ),
                      )
                    ],
                  ),
                ),
        ),
      ],
    );
  }
}

class _MyCheckBox extends StatelessWidget {
  const _MyCheckBox({
    Key? key,
    required this.text,
    required this.isSelected,
    required this.fn,
  }) : super(key: key);
  final String text;
  final bool isSelected;
  final Function(bool? x) fn;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Checkbox(value: isSelected, onChanged: fn),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.5,
          child: DefaultTextStyle(
            style: const TextStyle(
              fontSize: 12,
              color: Color.fromRGBO(0, 106, 183, 1),
            ),
            child: Text(
              text,
            ),
          ),
        ),
      ],
    );
  }
}
