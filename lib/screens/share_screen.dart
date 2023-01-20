import 'package:flutter/material.dart';

class ShareScreen extends StatelessWidget {
  const ShareScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          const SizedBox(
            height: 50,
            width: double.maxFinite,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.5,
            child: Image.asset(
              "assets/logo.png",
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: const FittedBox(
              child: Text(
                "Share to your friends, or relatives",
                style: TextStyle(
                  color: Color.fromRGBO(0, 106, 183, 1),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(height: 50),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset("assets/logos_whatsapp.png"),
                Image.asset("assets/logos_facebook.png"),
                Image.asset("assets/logos_google-gmail.png"),
              ],
            ),
          ),
          const SizedBox(height: 30),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.6,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset("assets/logo-sms.png"),
                Image.asset("assets/logo-carbon_copy-link.png"),
              ],
            ),
          )
        ],
      ),
    );
  }
}
