import 'package:demo/widgets/star_clipper.dart';
import 'package:flutter/material.dart';

class PopUpVerifyAssociate extends StatelessWidget {
  const PopUpVerifyAssociate({Key? key, this.isVerified = false})
      : super(key: key);
  final bool isVerified;
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
          width: MediaQuery.of(context).size.width * 0.8,
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Material(
            color: const Color.fromRGBO(236, 247, 255, 1),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 10),
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 8,
                            color: const Color.fromRGBO(0, 106, 183, 1),
                          ),
                        ),
                        height: MediaQuery.of(context).size.height * 0.25,
                        width: MediaQuery.of(context).size.height * 0.22,
                        child: Image.asset(
                          "assets/user_person.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        right: 0,
                        top: -15,
                        child: !isVerified
                            ? Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 4, horizontal: 4),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5)),
                                child: Column(
                                  children: const [
                                    Icon(
                                      Icons.pending_actions_sharp,
                                      size: 30,
                                      color: Color.fromRGBO(0, 106, 183, 1),
                                    ),
                                    SizedBox(
                                      height: 15,
                                      child: FittedBox(
                                        child: Text(
                                          "KYC\nPending",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color:
                                                Color.fromRGBO(0, 106, 183, 1),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            : SizedBox(
                                height: 50,
                                width: 50,
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
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: const <Widget>[
                        Text(
                          "S.No. 01",
                          textScaleFactor: 1.1,
                          style: TextStyle(
                            color: Color.fromRGBO(54, 105, 166, 1),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "Vedanta Dental Care",
                          textScaleFactor: 1.2,
                          style: TextStyle(
                            color: Color.fromRGBO(54, 105, 166, 1),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "DR. B. Choudhary",
                          textScaleFactor: 1.2,
                          style: TextStyle(
                            color: Color.fromRGBO(54, 105, 166, 1),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "District",
                          textScaleFactor: 1.2,
                          style: TextStyle(
                            color: Color.fromRGBO(54, 105, 166, 1),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "Email",
                          textScaleFactor: 1.2,
                          style: TextStyle(
                            color: Color.fromRGBO(54, 105, 166, 1),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "9876543210",
                          textScaleFactor: 1.2,
                          style: TextStyle(
                            color: Color.fromRGBO(54, 105, 166, 1),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  if (!isVerified)
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
                            vertical: 5, horizontal: 20),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text(
                        "Do KYC",
                        textScaleFactor: 1.5,
                        style: TextStyle(
                          // fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
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
                          vertical: 5, horizontal: 20),
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
