import 'package:flutter/material.dart';

class PopUpMedicalFormConfirmationStatus extends StatelessWidget {
  const PopUpMedicalFormConfirmationStatus({Key? key}) : super(key: key);

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
          width: MediaQuery.of(context).size.width * 0.9,
          // height: MediaQuery.of(context).size.width * 0.8,
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
          child: Material(
            color: const Color.fromRGBO(236, 247, 255, 1),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "Congratulations!",
                    textScaleFactor: 1.2,
                    style: TextStyle(
                      color: Color.fromRGBO(54, 105, 166, 1),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    "Booking Confirmed!",
                    textScaleFactor: 1.5,
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      color: Color.fromRGBO(54, 105, 166, 1),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Align(
                    alignment: Alignment.center,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        minimumSize:
                            Size(MediaQuery.of(context).size.width * 0.5, 5),
                        elevation: 0,
                        backgroundColor: const Color.fromRGBO(0, 175, 239, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text(
                        "Close",
                        textScaleFactor: 1.5,
                        style: TextStyle(
                          // fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
