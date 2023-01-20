import 'package:flutter/material.dart';

class AdBannerScreen extends StatelessWidget {
  const AdBannerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 75),
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: const Color.fromRGBO(0, 106, 183, 1),
              ),
              borderRadius: BorderRadius.circular(15),
              color: const Color.fromRGBO(236, 247, 255, 1)),
          height: MediaQuery.of(context).size.height * 0.5,
          width: MediaQuery.of(context).size.width * 0.7,
          child: Material(
            color: const Color.fromRGBO(236, 247, 255, 1),
            child: Center(
              child: Column(
                // mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.35,
                          child: Image.asset("assets/logo.png")),
                      IconButton(
                        constraints: const BoxConstraints(),
                        padding: EdgeInsets.zero,
                        onPressed: () => Navigator.of(context).pop(),
                        icon: const Icon(
                          Icons.close,
                          color: Color.fromRGBO(0, 106, 183, 1),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "This is the title of Ad",
                      textScaleFactor: 1.3,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        // fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(0, 106, 183, 1),
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "This is the subtitle of Ad. this is important thing",
                      textScaleFactor: 1.1,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        // fontSize: 12,
                        // fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(0, 106, 183, 1),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Image.asset(
                      "assets/ad.png",
                      fit: BoxFit.contain,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
