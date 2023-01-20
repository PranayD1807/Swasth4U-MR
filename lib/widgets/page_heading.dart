import 'package:flutter/material.dart';

class PageHeading extends StatelessWidget {
  const PageHeading({Key? key, required this.text}) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: double.maxFinite,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: const BoxDecoration(color: Color.fromRGBO(0, 106, 183, 1)),
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.8,
          ),
          child: FittedBox(
            child: Text(
              text,
              textScaleFactor: 1.1,
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
