import 'package:demo/screens/associate/hospital_detail_screen.dart';
import 'package:demo/screens/home/associate_onboarding_screen.dart';
import 'package:demo/widgets/popup_delete_reason.dart';
import 'package:demo/widgets/star_clipper.dart';
import 'package:flutter/material.dart';

class AssociateListTile extends StatelessWidget {
  const AssociateListTile({Key? key, required this.verified}) : super(key: key);
  final bool verified;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.3,
                    ),
                    child: const FittedBox(
                      child: Text(
                        "S.No.01",
                        textScaleFactor: 1.2,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(0, 106, 183, 1),
                        ),
                      ),
                    ),
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.4,
                    ),
                    child: const FittedBox(
                      child: Text(
                        "Status - Pending",
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
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.5,
                    ),
                    child: const FittedBox(
                      child: Text(
                        "Vedanta Dental Care",
                        textScaleFactor: 1.2,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(0, 106, 183, 1),
                        ),
                      ),
                    ),
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.2,
                    ),
                    child: const FittedBox(
                      child: Text(
                        "12345678",
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
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * 0.6,
                        ),
                        child: const FittedBox(
                          child: Text(
                            "Dr. B. Choudhary",
                            textScaleFactor: 1.2,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(0, 106, 183, 1),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * 0.6,
                        ),
                        child: const FittedBox(
                          child: Text(
                            "District",
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
                  if (verified)
                    SizedBox(
                      height: 45,
                      width: 45,
                      child: ClipPath(
                        clipper: StarClipper(10),
                        child: Container(
                          // height: 200,
                          color: Colors.green,
                          padding: const EdgeInsets.all(10),
                          child: Center(
                            child: Stack(
                              children: const [
                                ImageIcon(
                                  AssetImage("assets/check.png"),
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  height: 8,
                                  child: FittedBox(
                                    child: Text(
                                      "KYC",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                      maximumSize:
                          Size(MediaQuery.of(context).size.width * 0.4, 50),
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
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const AssociateOnboardingScreen(
                            isEditing: true,
                          ),
                        ),
                      );
                    },
                    child: const FittedBox(
                      child: Text(
                        "Edit Associate",
                        textScaleFactor: 1.2,
                        style: TextStyle(
                          // fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      maximumSize:
                          Size(MediaQuery.of(context).size.width * 0.4, 50),
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
                          return const DeleteReasonPopUp();
                        },
                      );
                    },
                    child: const FittedBox(
                      child: Text(
                        "Delete Associate",
                        textScaleFactor: 1.2,
                        style: TextStyle(
                          // fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
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
