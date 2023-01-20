import 'dart:io';

import 'package:flutter/material.dart';

class ImagePreview extends StatelessWidget {
  const ImagePreview({Key? key, required this.photo, required this.text})
      : super(key: key);
  final File? photo;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width * 0.7,
      width: MediaQuery.of(context).size.width * 0.7,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(239, 239, 239, 1),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 2,
          color: const Color.fromRGBO(0, 175, 239, 1),
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: photo != null
          ? Image.file(
              photo!,
              fit: BoxFit.cover,
            )
          : Center(
              child: Text(
                text,
                textScaleFactor: 1.5,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color.fromRGBO(0, 106, 183, 1),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
    );
  }
}
