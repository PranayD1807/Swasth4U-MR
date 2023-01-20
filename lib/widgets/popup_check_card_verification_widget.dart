import 'package:demo/widgets/card.dart';
import 'package:demo/widgets/star_clipper.dart';
import 'package:flutter/material.dart';

class CheckCardVerificationWidget extends StatelessWidget {
  const CheckCardVerificationWidget({Key? key}) : super(key: key);

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
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Material(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  MyCard(
                    cardWidth: MediaQuery.of(context).size.width * 0.7,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.35,
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: const <Widget>[
                            Text(
                              "Yadiki Sai Subramanyam Siddhart",
                              textScaleFactor: 1.2,
                              style: TextStyle(
                                color: Color.fromRGBO(54, 105, 166, 1),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "Father's Name",
                              textScaleFactor: 1.2,
                              style: TextStyle(
                                color: Color.fromRGBO(54, 105, 166, 1),
                                // fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "DOB",
                              textScaleFactor: 1.2,
                              style: TextStyle(
                                color: Color.fromRGBO(54, 105, 166, 1),
                                // fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "9876543210",
                              textScaleFactor: 1.2,
                              style: TextStyle(
                                color: Color.fromRGBO(54, 105, 166, 1),
                                // fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "Address",
                              textScaleFactor: 1.2,
                              style: TextStyle(
                                color: Color.fromRGBO(54, 105, 166, 1),
                                // fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 5,
                                color: const Color.fromRGBO(0, 106, 183, 1),
                              ),
                            ),
                            height: MediaQuery.of(context).size.height * 0.20,
                            width: MediaQuery.of(context).size.height * 0.17,
                            child: Image.asset(
                              "assets/user_person.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            right: 0,
                            top: -15,
                            child: SizedBox(
                              height: 45,
                              width: 45,
                              child: ClipPath(
                                clipper: StarClipper(10),
                                child: Container(
                                  height: 150,
                                  color: Colors.green,
                                  padding: const EdgeInsets.all(10),
                                  child: const Center(
                                    // child: Icon(
                                    //   Icons.check,
                                    //   size: 12,
                                    //   color: Colors.white,
                                    // ),
                                    child: ImageIcon(
                                      AssetImage("assets/check.png"),
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.55,
                    child: const FittedBox(
                      child: Text(
                        "Validity 345 Days",
                        textScaleFactor: 1.2,
                        style: TextStyle(
                          color: Color.fromRGBO(54, 105, 166, 1),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                  TextButton(
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
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
