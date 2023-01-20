import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyMap extends StatelessWidget {
  const MyMap({Key? key, required this.searchCtrl}) : super(key: key);
  final TextEditingController searchCtrl;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.width * 0.9,
      width: MediaQuery.of(context).size.width * 0.8,
      child: Stack(children: [
        Image.asset(
          "assets/map.png",
          fit: BoxFit.cover,
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Row(
              // mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                    minimumSize:
                        Size(MediaQuery.of(context).size.width * 0.35, 5),
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
                    "Select",
                    textScaleFactor: 1.2,
                    style: TextStyle(
                      // fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    elevation: 0,
                    backgroundColor: const Color.fromRGBO(0, 175, 239, 1),
                    shape: const CircleBorder(),
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  ),
                  onPressed: () {},
                  child: const Icon(
                    Icons.my_location,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            margin: const EdgeInsets.only(top: 10),
            width: MediaQuery.of(context).size.width * 0.7,
            child: Material(
              elevation: 5,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)),
              child: TextFormField(
                controller: searchCtrl,
                validator: (val) {},
                decoration: InputDecoration(
                  filled: true,
                  isDense: true,
                  focusColor: const Color.fromRGBO(234, 247, 255, 1),
                  hoverColor: const Color.fromRGBO(234, 247, 255, 1),
                  fillColor: Colors.white,
                  suffix: Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.close),
                      iconSize: 18,
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                    ),
                  ),
                  prefix: Padding(
                    padding: const EdgeInsets.only(right: 5.0),
                    child: IconButton(
                      onPressed: () {},
                      icon: const ImageIcon(
                        AssetImage("assets/location.png"),
                      ),
                      iconSize: 20,
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      width: 1,
                      color: Colors.red,
                    ),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  hintStyle:
                      const TextStyle(color: Color.fromRGBO(54, 105, 166, 1)),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      width: 1,
                      color: Colors.red,
                    ),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  labelStyle: const TextStyle(
                    color: Color.fromRGBO(79, 124, 177, 1),
                  ),
                  floatingLabelStyle: const TextStyle(
                      color: Color.fromRGBO(79, 124, 177, 1), fontSize: 10),
                  hintText: "Search your location",
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      width: 1,
                      color: Color.fromRGBO(0, 175, 239, 1),
                    ),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      width: 1,
                      color: Color.fromRGBO(0, 175, 239, 1),
                    ),
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
          ),
        )
      ]),
    );
  }
}
