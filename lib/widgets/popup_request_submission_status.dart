import 'package:flutter/material.dart';

class PopUpStatusWidget extends StatelessWidget {
  const PopUpStatusWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
          width: MediaQuery.of(context).size.width * 0.7,
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Material(
            color: const Color.fromRGBO(236, 247, 255, 1),
            child: Center(
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
                  const SizedBox(height: 30),
                  const DefaultTextStyle(
                    style: TextStyle(
                      // fontSize: 12,
                      color: Color.fromRGBO(0, 106, 183, 1),
                      fontWeight: FontWeight.bold,
                    ),
                    child: Text(
                      "Request Submitted Successfully",
                      textScaleFactor: 1.5,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 50),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
