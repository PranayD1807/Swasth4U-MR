import 'package:demo/widgets/pop_up_medical_confirmation.dart';
import 'package:flutter/material.dart';

class MedicalCampWidget extends StatelessWidget {
  const MedicalCampWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Card(
        elevation: 5,
        child: Container(
          // height: 200,
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: const Color.fromRGBO(236, 247, 255, 1),
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: const Color.fromRGBO(17, 136, 222, 1)),
          ),
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Text(
                "Free Medical Camp - General Physician",
                textAlign: TextAlign.center,
                textScaleFactor: 1.3,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Color.fromRGBO(0, 106, 183, 1),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.45,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Dr. XYZ",
                          textScaleFactor: 1.3,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(0, 106, 183, 1),
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "MBBD (PMCH)",
                          style: TextStyle(
                            color: Color.fromRGBO(0, 106, 183, 1),
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "Date : 20-04-2022",
                          textScaleFactor: 1.2,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(0, 106, 183, 1),
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "Time : 10AM to 6PM",
                          textScaleFactor: 1.2,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(0, 106, 183, 1),
                          ),
                        ),
                      ],
                    ),
                  ),
                  CircleAvatar(
                    radius: MediaQuery.of(context).size.width * 0.14,
                    backgroundImage: const AssetImage("assets/card.png"),
                  )
                ],
              ),
              const SizedBox(height: 10),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Venue : XXXXXXXXXXXXXXXXXX",
                  textScaleFactor: 1.2,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(0, 106, 183, 1),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "PD Name",
                          textScaleFactor: 1.2,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(0, 106, 183, 1),
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "PD Name",
                          textScaleFactor: 1.2,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(0, 106, 183, 1),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.25,
                    child: const FittedBox(
                      child: Text(
                        "no. of\nBookings: 200",
                        textScaleFactor: 1.2,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(0, 106, 183, 1),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              TextButton(
                style: TextButton.styleFrom(
                  minimumSize: Size(MediaQuery.of(context).size.width * 0.5, 5),
                  elevation: 0,
                  backgroundColor: const Color.fromRGBO(0, 175, 239, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                ),
                onPressed: () {},
                child: const Text(
                  "Call Associate",
                  textScaleFactor: 1.2,
                  style: TextStyle(
                    // fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              // const SizedBox(height: ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                      minimumSize:
                          Size(MediaQuery.of(context).size.width * 0.3, 5),
                      elevation: 0,
                      backgroundColor: const Color.fromRGBO(0, 175, 239, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 20),
                    ),
                    onPressed: () {
                      showGeneralDialog(
                        context: context,
                        barrierColor:
                            Colors.black12.withOpacity(0.6), // Background color
                        barrierDismissible: true,
                        barrierLabel: 'Dialog',
                        transitionDuration: const Duration(milliseconds: 400),
                        pageBuilder: (_, __, ___) {
                          return const PopUpMedicalFormConfirmationStatus();
                        },
                      );
                    },
                    child: const Text(
                      "Confirm",
                      textScaleFactor: 1.2,
                      style: TextStyle(
                        // fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      minimumSize:
                          Size(MediaQuery.of(context).size.width * 0.3, 5),
                      elevation: 0,
                      backgroundColor: const Color.fromRGBO(0, 175, 239, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 20),
                    ),
                    onPressed: () {},
                    child: const Text(
                      "Cancel",
                      textScaleFactor: 1.2,
                      style: TextStyle(
                        // fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
