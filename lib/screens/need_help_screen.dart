import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class NeedHelpScreen extends StatelessWidget {
  const NeedHelpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.keyboard_arrow_left_outlined),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.blue,
      ),
      body: Column(children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.5,
          child: Image.asset(
            "assets/logo.png",
            fit: BoxFit.contain,
          ),
        ),
        const SizedBox(
          height: 20,
          width: double.maxFinite,
        ),
        Expanded(
            child: Container(
          // height: MediaQuery.of(context).size.height * 0.4,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.4,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: const FittedBox(
                        child: Text(
                          "Let's learn how to use SWASTH 4U App",
                          // textScaleFactor: 1.1,
                          style: TextStyle(
                            color: Color.fromRGBO(0, 106, 183, 1),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  // const SizedBox(height: 10),
                  const Divider(
                    thickness: 2,
                    color: Color.fromRGBO(0, 106, 183, 0.16),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    color: const Color.fromRGBO(244, 244, 244, 1),
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: MediaQuery.of(context).size.height * 0.2,
                          width: double.maxFinite,
                          color: const Color.fromRGBO(196, 196, 196, 1),
                        ),
                        const SizedBox(height: 15),
                        const Text(
                          "Multiplayer Text Adventure Engine In Node Game Engine Server Optimazing",
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        )),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: double.maxFinite,
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            decoration: const BoxDecoration(
              color: Color.fromRGBO(137, 224, 255, 1),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
            ),
            child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
              const Text(
                "24 X 7 Helpline Number",
                textScaleFactor: 1.5,
                style: TextStyle(
                  color: Color.fromRGBO(0, 72, 99, 1),
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                "For Customers",
                style: TextStyle(color: Color.fromRGBO(0, 72, 99, 1)),
              ),
              const SizedBox(height: 10),
              const Divider(
                indent: 15,
                endIndent: 15,
                color: Color.fromRGBO(0, 72, 99, 1),
                thickness: 2,
              ),
              const SizedBox(height: 15),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.85,
                child: TextButton(
                  onPressed: null,
                  style: TextButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(0, 72, 99, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    minimumSize: const Size(double.maxFinite, 30),
                    // tapTargetSize: MaterialTapTargetSize.padded,
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                  ),
                  child: const Text(
                    "+91 94710 30085",
                    textScaleFactor: 2,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.65,
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(0, 106, 183, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    minimumSize: const Size(double.maxFinite, 30),
                    // tapTargetSize: MaterialTapTargetSize.padded,
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                  ),
                  child: const Text(
                    "Call Now",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ]),
          ),
        )
      ]),
    );
  }
}
