import 'package:flutter/material.dart';

class MyFilePickerButton extends StatelessWidget {
  const MyFilePickerButton({Key? key, required this.function})
      : super(key: key);

  final Function? function;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      // height: 50,
      padding: const EdgeInsets.only(left: 20, right: 10),
      // width: double.maxFinite,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 0,
            offset: Offset.fromDirection(-1, -1),
            spreadRadius: 2,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
                elevation: 5,
                backgroundColor: const Color.fromRGBO(0, 175, 239, 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 30)),
            onPressed: () async {
              await function!();
            },
            child: const Text(
              "Choose File",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
