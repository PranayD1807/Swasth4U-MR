import 'package:demo/screens/home/associate_onboarding_screen.dart';
import 'package:demo/screens/home/customer_onboarding_screen.dart';
import 'package:demo/widgets/popup_check_card_verification_widget.dart';
import 'package:demo/widgets/popup_delete_reason.dart';
import 'package:demo/widgets/star_clipper.dart';
import 'package:flutter/material.dart';

class CustomerListTile extends StatelessWidget {
  const CustomerListTile({Key? key, required this.verified}) : super(key: key);
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
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * 0.8,
                        ),
                        child: const FittedBox(
                          child: Text(
                            "Serial No: 01",
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
                            "Customer's Name",
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
                            "Father's Name",
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
                          maxWidth: MediaQuery.of(context).size.width * 0.8,
                        ),
                        child: const FittedBox(
                          child: Text(
                            "1234 5678 1234",
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
                          maxWidth: MediaQuery.of(context).size.width * 0.8,
                        ),
                        child: const FittedBox(
                          child: Text(
                            "1234 5678 1234",
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
                          maxWidth: MediaQuery.of(context).size.width * 0.8,
                        ),
                        child: const FittedBox(
                          child: Text(
                            "Date Created",
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
                          maxWidth: MediaQuery.of(context).size.width * 0.8,
                        ),
                        child: const FittedBox(
                          child: Text(
                            "Valid till: 05-march-2023",
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
                  const Card(
                    elevation: 3,
                    shape: CircleBorder(),
                    child: CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage("assets/person.png"),
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
                          builder: (context) =>
                              const CustomerOnboardingScreen(),
                        ),
                      );
                    },
                    child: const FittedBox(
                      child: Text(
                        "Edit Customer",
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
                          return const CheckCardVerificationWidget();
                        },
                      );
                    },
                    child: const FittedBox(
                      child: Text(
                        "View Card",
                        textScaleFactor: 1.2,
                        style: TextStyle(
                          // fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  // TextButton(
                  //   style: TextButton.styleFrom(
                  //     maximumSize:
                  //         Size(MediaQuery.of(context).size.width * 0.4, 50),
                  //     minimumSize:
                  //         Size(MediaQuery.of(context).size.width * 0.3, 5),
                  //     elevation: 0,
                  //     backgroundColor: const Color.fromRGBO(0, 175, 239, 1),
                  //     shape: RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(20),
                  //     ),
                  //     padding: const EdgeInsets.symmetric(
                  //         vertical: 5, horizontal: 20),
                  //   ),
                  //   onPressed: () {
                  //     showGeneralDialog(
                  //       context: context,
                  //       barrierColor:
                  //           Colors.black12.withOpacity(0.6), // Background color
                  //       barrierDismissible: true,
                  //       barrierLabel: 'Dialog',
                  //       transitionDuration: const Duration(milliseconds: 400),
                  //       pageBuilder: (_, __, ___) {
                  //         return const DeleteReasonPopUp(
                  //           isCustomerCard: true,
                  //         );
                  //       },
                  //     );
                  //   },
                  //   child: const FittedBox(
                  //     child: Text(
                  //       "Delete Customer",
                  //       textScaleFactor: 1.2,
                  //       style: TextStyle(
                  //         // fontWeight: FontWeight.bold,
                  //         color: Colors.white,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
