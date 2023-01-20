import 'package:demo/widgets/page_heading.dart';
import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        foregroundColor: Colors.blue,
        backgroundColor: Colors.transparent,
        title: Align(
            alignment: Alignment.centerRight,
            child: SizedBox(height: 35, child: Image.asset("assets/logo.png"))),
        // centerTitle: true,
        automaticallyImplyLeading: true,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.keyboard_arrow_left_outlined),
        ),
      ),
      body: Column(
        children: <Widget>[
          const PageHeading(
            text: "About Us",
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Column(
                  children: [
                    const SizedBox(height: 15),
                    const Text(
                      "About Our Card",
                      textScaleFactor: 1.5,
                      style: TextStyle(
                        color: Color.fromRGBO(0, 106, 183, 1),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 200,
                      child: Center(
                        child: Image.asset(
                          "assets/card1.png",
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 20),
                      width: double.maxFinite,
                      child: const Text(
                        "Vivamus consectetuer hendrerit lacus. Vivamus quis mi. Nulla porta dolor. Duis arcu tortor, suscipit eget, imperdiet nec, imperdiet iaculis, ipsum. Praesent blandit laoreet.\n\nVivamus consectetuer hendrerit lacus. Vivamus quis mi. Nulla porta dolor. Duis arcu tortor, suscipit eget, imperdiet nec, imperdiet iaculis, ipsum. Praesent blandit laoreet.",
                        textScaleFactor: 1.1,
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          color: const Color.fromRGBO(193, 193, 193, 1),
                          width: MediaQuery.of(context).size.width * 0.35,
                          height: MediaQuery.of(context).size.width * 0.3,
                        ),
                        const SizedBox(width: 10),
                        const Expanded(
                          child: Text(
                            "Vivamus consectetuer hendrerit lacus. Vivamus quis mi. Nulla porta dolor. Duis arcu tortor, suscipit eget, imperdiet",
                            textScaleFactor: 1.1,
                            textAlign: TextAlign.justify,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
