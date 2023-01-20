import 'package:flutter/material.dart';

class CustomIconButtons extends StatelessWidget {
  const CustomIconButtons({Key? key, required this.path, required this.text})
      : super(key: key);
  final String path;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Card(
          elevation: 3,
          shape: const CircleBorder(),
          child: CircleAvatar(
            radius: MediaQuery.of(context).size.width * 0.1,
            backgroundColor: const Color.fromRGBO(0, 106, 183, 1),
            child: Image.asset(
              path,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: Text(
            text,
            maxLines: 2,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 12,
              color: Color.fromRGBO(0, 106, 183, 1),
            ),
          ),
        )
      ],
    );
  }
}
