import 'package:flutter/material.dart';

class MyTile extends StatelessWidget {
  const MyTile({Key? key, required this.text, required this.val})
      : super(key: key);
  final String text;
  final String val;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.35,
          child: Text(
            text,
            textScaleFactor: 1.2,
            style: const TextStyle(
              color: Color.fromRGBO(54, 105, 166, 1),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const Text(
          ":   ",
          textScaleFactor: 1.2,
          style: TextStyle(
            color: Color.fromRGBO(54, 105, 166, 1),
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.4,
          child: Text(
            val,
            textScaleFactor: 1.2,
            style: const TextStyle(
              color: Color.fromRGBO(54, 105, 166, 1),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(width: 5),
      ],
    );
  }
}
