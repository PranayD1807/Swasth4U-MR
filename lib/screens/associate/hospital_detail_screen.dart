import 'package:demo/widgets/page_heading.dart';
import 'package:demo/widgets/star_clipper.dart';
import 'package:flutter/material.dart';

class HospitalDetailScreen extends StatefulWidget {
  const HospitalDetailScreen(
      {Key? key, required this.hosppitalName, required this.discount})
      : super(key: key);
  final String hosppitalName;
  final bool discount;
  @override
  State<HospitalDetailScreen> createState() => _HospitalDetailScreenState();
}

class _HospitalDetailScreenState extends State<HospitalDetailScreen> {
  final TextEditingController searchCtrl = TextEditingController();

  final formKey = GlobalKey<FormState>();

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
          PageHeading(
            text: widget.hosppitalName,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Container(
                    // height: 500,
                    width: double.maxFinite,
                    margin: const EdgeInsets.only(
                        top: 5, right: 10, left: 10, bottom: 5),
                    decoration: const BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          color: Color.fromRGBO(17, 136, 222, 1),
                        ),
                        left: BorderSide(
                          color: Color.fromRGBO(17, 136, 222, 1),
                        ),
                        right: BorderSide(
                          color: Color.fromRGBO(17, 136, 222, 1),
                        ),
                        bottom: BorderSide(
                          color: Color.fromRGBO(17, 136, 222, 1),
                        ),
                      ),
                      color: Color.fromRGBO(236, 247, 255, 1),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 15),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(height: 20),
                          Stack(
                            alignment: Alignment.topCenter,
                            clipBehavior: Clip.none,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 5,
                                    color: const Color.fromRGBO(0, 106, 183, 1),
                                  ),
                                ),
                                height: MediaQuery.of(context).size.width * 0.5,
                                width: MediaQuery.of(context).size.width * 0.70,
                                child: Image.asset(
                                  "assets/hospitalxyz.png",
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                top: -MediaQuery.of(context).size.width * 0.12,
                                child: CircleAvatar(
                                  radius:
                                      MediaQuery.of(context).size.width * 0.12,
                                  child: CircleAvatar(
                                    radius: MediaQuery.of(context).size.width *
                                        0.11,
                                    backgroundImage: const AssetImage(
                                      "assets/doctor_image.png",
                                    ),
                                  ),
                                ),
                              ),
                              if (widget.discount)
                                Positioned(
                                  right: -10,
                                  bottom: -30,
                                  child: SizedBox(
                                    height: 75,
                                    width: 75,
                                    child: ClipPath(
                                      clipper: StarClipper(15),
                                      child: Container(
                                        height: 150,
                                        color: const Color.fromRGBO(
                                            255, 114, 119, 1),
                                        padding: const EdgeInsets.all(10),
                                        child: const Center(
                                          child: Text(
                                            "Get Upto 60% Discount",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 10,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                          const SizedBox(height: 30),
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 25.0),
                              child: Text(
                                "Hospital Name",
                                textScaleFactor: 1.5,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(0, 106, 183, 1),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 25.0),
                              child: Text(
                                "Address",
                                textScaleFactor: 1.3,
                                style: TextStyle(
                                  // fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(0, 106, 183, 1),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 25.0),
                              child: Text(
                                "Lorem, ipsum dolor sit amet consectetur adipisicinng elit. Enim reinciendis expedita laborun quaret aperiam cilpa ollum ex coliptata asoeriores dolores dolor doloribus totam obcaecati quibusdam voluptibus exercitationem sutn consewuutin sed,",
                                // textScaleFactor: 0.8,
                                style: TextStyle(
                                  // fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  color: Color.fromRGBO(0, 106, 183, 1),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 25.0),
                              child: Text(
                                "Doctors Name",
                                textScaleFactor: 1.3,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(0, 106, 183, 1),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 25.0),
                              child: Text(
                                "MBBS",
                                textScaleFactor: 1,
                                style: TextStyle(
                                  // fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(0, 106, 183, 1),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 25.0),
                              child: Text(
                                "sample@sample.com",
                                textScaleFactor: 1.3,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(0, 106, 183, 1),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 25.0),
                              child: Text(
                                "Facilities",
                                textScaleFactor: 1.3,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(0, 106, 183, 1),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 25.0,
                              vertical: 10,
                            ),
                            width: double.maxFinite,
                            child: Wrap(
                              runSpacing: 10,
                              spacing: 10,
                              alignment: WrapAlignment.start,
                              children: [
                                Container(
                                  height: 35,
                                  width: 35,
                                  color: const Color.fromRGBO(196, 196, 196, 1),
                                ),
                                Container(
                                  height: 35,
                                  width: 35,
                                  color: const Color.fromRGBO(196, 196, 196, 1),
                                ),
                                Container(
                                  height: 35,
                                  width: 35,
                                  color: const Color.fromRGBO(196, 196, 196, 1),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(height: 15),
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 25.0),
                              child: Text(
                                "Discounts",
                                textScaleFactor: 1.3,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(0, 106, 183, 1),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 25.0,
                              vertical: 10,
                            ),
                            width: double.maxFinite,
                            child: Wrap(
                              runSpacing: 10,
                              spacing: 10,
                              alignment: WrapAlignment.start,
                              children: [
                                Container(
                                  height: 35,
                                  width: 35,
                                  color: const Color.fromRGBO(196, 196, 196, 1),
                                ),
                                Container(
                                  height: 35,
                                  width: 35,
                                  color: const Color.fromRGBO(196, 196, 196, 1),
                                ),
                                Container(
                                  height: 35,
                                  width: 35,
                                  color: const Color.fromRGBO(196, 196, 196, 1),
                                ),
                                Container(
                                  height: 35,
                                  width: 35,
                                  color: const Color.fromRGBO(196, 196, 196, 1),
                                ),
                                Container(
                                  height: 35,
                                  width: 35,
                                  color: const Color.fromRGBO(196, 196, 196, 1),
                                )
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.35,
                                child: TextButton(
                                  onPressed: () {},
                                  style: TextButton.styleFrom(
                                    backgroundColor:
                                        const Color.fromRGBO(0, 106, 183, 1),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    minimumSize:
                                        const Size(double.maxFinite, 30),
                                    // tapTargetSize: MaterialTapTargetSize.padded,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 20),
                                  ),
                                  child: const FittedBox(
                                    child: Text(
                                      "Book Appointment",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.35,
                                child: TextButton(
                                  onPressed: () {},
                                  style: TextButton.styleFrom(
                                    backgroundColor:
                                        const Color.fromRGBO(0, 106, 183, 1),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    minimumSize:
                                        const Size(double.maxFinite, 30),
                                    // tapTargetSize: MaterialTapTargetSize.padded,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 20),
                                  ),
                                  child: const FittedBox(
                                    child: Text(
                                      "Get Direction",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
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
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
