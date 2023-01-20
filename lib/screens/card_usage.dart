import 'package:demo/utils/custom_size.dart';
import 'package:demo/widgets/card_usage_widget.dart';
import 'package:demo/widgets/date_filter.dart';
import 'package:demo/widgets/page_heading.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CardUsageScreen extends StatelessWidget {
  CardUsageScreen({Key? key, this.fromTabScreen = false}) : super(key: key);
  var scaffoldKey = GlobalKey<ScaffoldState>();
  final bool fromTabScreen;
  @override
  Widget build(BuildContext context) {
    CustomSize customSize = CustomSize();
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
              return const DateFilterScreen();
            },
          );
        },
        backgroundColor: const Color.fromRGBO(0, 106, 183, 1),
        child: const ImageIcon(AssetImage("assets/filter.png")),
      ),
      appBar: !fromTabScreen
          ? AppBar(
              elevation: 0,
              foregroundColor: Colors.blue,
              backgroundColor: Colors.transparent,
              title: Align(
                  alignment: Alignment.centerRight,
                  child: SizedBox(
                      height: 35, child: Image.asset("assets/logo.png"))),
              // centerTitle: true,
              automaticallyImplyLeading: true,
              leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.keyboard_arrow_left_outlined),
              ),
            )
          : null,
      body: Builder(builder: (context) {
        return SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            children: <Widget>[
              const PageHeading(
                text: "Card Usage",
              ),
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: fromTabScreen
                      ? customSize.getHeightForHomePage(context)
                      : MediaQuery.of(context).size.height * 0.85,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 8,
                        itemBuilder: (context, index) => const CardUsageTile(),
                      ),
                      const SizedBox(height: 20)
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
