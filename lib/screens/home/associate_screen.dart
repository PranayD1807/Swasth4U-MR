import 'package:demo/screens/associate/ambulances_screen.dart';
import 'package:demo/screens/associate/ayurvedic_clinics_screen.dart';
import 'package:demo/screens/associate/diagnostic_centres_screen.dart';
import 'package:demo/screens/associate/doctors_screen.dart';
import 'package:demo/screens/associate/health_wellness_screen.dart';
import 'package:demo/screens/associate/healthcare_instruments_screen.dart';
import 'package:demo/screens/associate/homeopathy_clinic_screens.dart';
import 'package:demo/screens/associate/hospitals_screen.dart';
import 'package:demo/screens/associate/nursing_homes_screen.dart';
import 'package:demo/screens/associate/pathology_screen.dart';
import 'package:demo/screens/associate/pharmacy_screen.dart';
import 'package:demo/screens/associate/physiotherapy_screen.dart';
import 'package:demo/widgets/area_filter.dart';
import 'package:demo/widgets/custom_icon_buttons.dart';
import 'package:demo/widgets/page_heading.dart';
import 'package:flutter/material.dart';

class AssociateScreen extends StatefulWidget {
  const AssociateScreen({Key? key}) : super(key: key);

  @override
  State<AssociateScreen> createState() => _AssociateScreenState();
}

class _AssociateScreenState extends State<AssociateScreen> {
  final TextEditingController searchCtrl = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    List<Map> tools = [
      {
        "path": "assets/my_profile_main.png",
        "text": "Doctors",
        "page": const DoctorsScreen()
      },
      {
        "path": "assets/transaction.png",
        "text": "Hospital",
        "page": const HospitalsScreen()
      },
      {
        "path": "assets/associate.png",
        "text": "Nursing Home",
        "page": const NursingHomesScreen()
      },
      {
        "path": "assets/medical_camps.png",
        "text": "Ayurvedic Clinic",
        "page": const AyurvedicClinicsScreen()
      },
      {
        "path": "assets/card_usage.png",
        "text": "Homeopathy Clinic",
        "page": const HomeopathyClinicsScreen()
      },
      {
        "path": "assets/ambulance.png",
        "text": "Physiotherapy",
        "page": const PhysiotherapyScreen()
      },
      {
        "path": "assets/buy_medicine.png",
        "text": "Pharmacy",
        "page": const PharmacyScreen()
      },
      {
        "path": "assets/test.png",
        "text": "Pathology",
        "page": const PathologyScreen()
      },
      {
        "path": "assets/doctor.png",
        "text": "Diagnostic Centres",
        "page": const DiagnosticCentres()
      },
      {
        "path": "assets/appointment.png",
        "text": "Ambulance",
        "page": const AmbulancesScreen()
      },
      {
        "path": "assets/complaint.png",
        "text": "Healthcare Instruments",
        "page": const HealthcareInstrumentsScreen()
      },
      {
        "path": "assets/report.png",
        "text": "Health & Wellness Centre",
        "page": const HealthWellnessCentresScreen()
      },
    ];
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showGeneralDialog(
            context: context,
            barrierColor: Colors.black12.withOpacity(0.6), // Background color
            barrierDismissible: true,
            barrierLabel: 'Dialog',
            transitionDuration: const Duration(milliseconds: 400),
            pageBuilder: (_, __, ___) {
              return const AreaFilterScreen();
            },
          );
        },
        backgroundColor: const Color.fromRGBO(0, 106, 183, 1),
        child: const ImageIcon(AssetImage("assets/filter.png")),
      ),
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
            text: "Associate",
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
            child: Form(
              key: formKey,
              child: Material(
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
                child: TextFormField(
                  controller: searchCtrl,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Enter text to search";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    filled: true,
                    focusColor: const Color.fromRGBO(234, 247, 255, 1),
                    hoverColor: const Color.fromRGBO(234, 247, 255, 1),
                    fillColor: const Color.fromRGBO(234, 247, 255, 1),
                    prefix: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 15.0),
                      child: IconButton(
                        onPressed: () {},
                        icon: const ImageIcon(
                          AssetImage("assets/search.png"),
                          color: Color.fromRGBO(0, 175, 239, 1),
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
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    labelStyle: const TextStyle(
                      color: Color.fromRGBO(79, 124, 177, 1),
                    ),
                    floatingLabelStyle: const TextStyle(
                        color: Color.fromRGBO(79, 124, 177, 1), fontSize: 10),
                    hintText: "Search...",
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
          ),
          Expanded(
            child: SingleChildScrollView(
                child: Container(
              // height: 200,
              constraints: const BoxConstraints(),
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              width: double.maxFinite,
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                  childAspectRatio: 0.8,
                ),
                itemCount: tools.length,
                itemBuilder: (context, i) {
                  return InkWell(
                    onTap: () {
                      if (tools[i]["page"] == null) {
                        return;
                      }
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => tools[i]["page"],
                        ),
                      );
                    },
                    child: CustomIconButtons(
                      path: tools[i]["path"],
                      text: tools[i]["text"],
                    ),
                  );
                },
              ),
            )),
          ),
        ],
      ),
    );
  }
}
