// import 'package:demo/widgets/custom_icon_buttons.dart';
import 'package:demo/widgets/medical_camp_widget.dart';
import 'package:demo/widgets/page_heading.dart';
// import 'package:demo/widgets/pop_up_medical_camp.dart';
import 'package:flutter/material.dart';

class MedicalCampScreen extends StatefulWidget {
  const MedicalCampScreen({Key? key}) : super(key: key);

  @override
  State<MedicalCampScreen> createState() => _MedicalCampScreenState();
}

class _MedicalCampScreenState extends State<MedicalCampScreen> {
  final TextEditingController searchCtrl = TextEditingController();

  final formKey = GlobalKey<FormState>();

  List<MedicalCampWidget> camps = [
    const MedicalCampWidget(),
    const MedicalCampWidget(),
  ];
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
            text: "Medical Camp",
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 40),
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
                              focusColor:
                                  const Color.fromRGBO(234, 247, 255, 1),
                              hoverColor:
                                  const Color.fromRGBO(234, 247, 255, 1),
                              fillColor: const Color.fromRGBO(234, 247, 255, 1),
                              prefix: Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, right: 15.0),
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
                              hintStyle: const TextStyle(
                                  color: Color.fromRGBO(54, 105, 166, 1)),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  width: 1,
                                  color: Colors.red,
                                ),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 5),
                              labelStyle: const TextStyle(
                                color: Color.fromRGBO(79, 124, 177, 1),
                              ),
                              floatingLabelStyle: const TextStyle(
                                  color: Color.fromRGBO(79, 124, 177, 1),
                                  fontSize: 10),
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
                    // const SizedBox(height: 20),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: camps,
                    ),
                    const SizedBox(height: 20),
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
