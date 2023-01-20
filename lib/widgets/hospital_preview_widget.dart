import 'package:demo/screens/associate/hospital_detail_screen.dart';
import 'package:demo/widgets/star_clipper.dart';
import 'package:flutter/material.dart';

class HospitalPreviewTile extends StatelessWidget {
  const HospitalPreviewTile({Key? key, required this.discount})
      : super(key: key);
  final bool discount;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: discount ? const EdgeInsets.only(top: 20) : EdgeInsets.zero,
      padding: const EdgeInsets.all(10),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => HospitalDetailScreen(
                    hosppitalName: "Hospital XYZ",
                    discount: discount,
                  ),
                ),
              );
            },
            child: Card(
              elevation: 5,
              child: Container(
                // height: 200,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(236, 247, 255, 1),
                  borderRadius: BorderRadius.circular(5),
                  border:
                      Border.all(color: const Color.fromRGBO(17, 136, 222, 1)),
                ),

                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                child: Column(
                  // mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: const Text(
                        "Hospital XYZ",
                        textAlign: TextAlign.center,
                        textScaleFactor: 1.3,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Color.fromRGBO(0, 106, 183, 1),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.55,
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
                              SizedBox(height: 10),
                              Text(
                                "MBBD (PMCH)",
                                style: TextStyle(
                                  color: Color.fromRGBO(0, 106, 183, 1),
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                "Address :- XXXXXXXX",
                                textScaleFactor: 1.2,
                                style: TextStyle(
                                  // fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(0, 106, 183, 1),
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                "Time : 10AM to 6PM",
                                textScaleFactor: 1.2,
                                style: TextStyle(
                                  // fontWeight: FontWeight.bold,
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
                  ],
                ),
              ),
            ),
          ),
          if (discount)
            Positioned(
              top: -30,
              left: -5,
              child: SizedBox(
                height: 75,
                width: 75,
                child: ClipPath(
                  clipper: StarClipper(15),
                  child: Container(
                    height: 150,
                    color: const Color.fromRGBO(255, 114, 119, 1),
                    padding: const EdgeInsets.all(10),
                    child: const Center(
                      child: Text(
                        "Get Upto 60% Discount",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 10, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
