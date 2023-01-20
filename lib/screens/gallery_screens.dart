import 'package:carousel_slider/carousel_slider.dart';
import 'package:demo/widgets/page_heading.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({Key? key}) : super(key: key);

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  // CarouselController _carouselController = CarouselController();
  int _currentImage = 0;
  int _currentVideo = 0;

  @override
  Widget build(BuildContext context) {
    // final deviceWidth = MediaQuery.of(context).size.width;
    List<Widget> videos = [
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        color: const Color.fromRGBO(244, 244, 244, 1),
        padding: const EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            Container(
              height: 150,
              width: double.maxFinite,
              color: const Color.fromRGBO(196, 196, 196, 1),
            ),
            const SizedBox(height: 15),
            const Text(
              "Multiplayer Text Adventure Engine In Node Game Engine Server Optimazing",
            )
          ],
        ),
      ),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        color: const Color.fromRGBO(244, 244, 244, 1),
        padding: const EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            Container(
              height: 150,
              width: double.maxFinite,
              color: const Color.fromRGBO(196, 196, 196, 1),
            ),
            const SizedBox(height: 15),
            const Text(
              "Multiplayer Text Adventure Engine In Node Game Engine Server Optimazing",
            )
          ],
        ),
      ),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        color: const Color.fromRGBO(244, 244, 244, 1),
        padding: const EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            Container(
              height: 150,
              width: double.maxFinite,
              color: const Color.fromRGBO(196, 196, 196, 1),
            ),
            const SizedBox(height: 15),
            const Text(
              "Multiplayer Text Adventure Engine In Node Game Engine Server Optimazing",
            )
          ],
        ),
      ),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        color: const Color.fromRGBO(244, 244, 244, 1),
        padding: const EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            Container(
              height: 150,
              width: double.maxFinite,
              color: const Color.fromRGBO(196, 196, 196, 1),
            ),
            const SizedBox(height: 15),
            const Text(
              "Multiplayer Text Adventure Engine In Node Game Engine Server Optimazing",
            )
          ],
        ),
      ),
    ];
    List<Widget> images = [
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        color: const Color.fromRGBO(196, 196, 196, 1),
      ),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        color: const Color.fromRGBO(196, 196, 196, 1),
      ),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        color: const Color.fromRGBO(196, 196, 196, 1),
      ),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        color: const Color.fromRGBO(196, 196, 196, 1),
      ),
    ];
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
            text: "Gallery",
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Column(
                  children: [
                    const SizedBox(height: 15),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Images",
                        textScaleFactor: 1.3,
                        style: TextStyle(
                          color: Color.fromRGBO(0, 106, 183, 1),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    // const SizedBox(height: 10),
                    const Divider(
                      thickness: 2,
                      color: Color.fromRGBO(0, 106, 183, 0.16),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: CarouselSlider(
                        items: images,
                        options: CarouselOptions(
                          aspectRatio: 4 / 3,
                          autoPlay: true,
                          viewportFraction: 1,
                          enlargeStrategy: CenterPageEnlargeStrategy.height,
                          enlargeCenterPage: true,
                          onPageChanged: (index, reason) {
                            setState(() {
                              _currentImage = index;
                            });
                          },
                        ),
                      ),
                    ),
                    DotsIndicator(
                      decorator: DotsDecorator(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.blue.shade800),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        color: Colors.white,
                      ),
                      dotsCount: images.length,
                      position: _currentImage.toDouble(),
                    ),
                    // video
                    const SizedBox(height: 15),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Videos",
                        textScaleFactor: 1.3,
                        style: TextStyle(
                          color: Color.fromRGBO(0, 106, 183, 1),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    // const SizedBox(height: 10),
                    const Divider(
                      thickness: 2,
                      color: Color.fromRGBO(0, 106, 183, 0.16),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: CarouselSlider(
                        items: videos,
                        options: CarouselOptions(
                          aspectRatio: 4 / 4,
                          viewportFraction: 1,
                          autoPlay: true,
                          enlargeStrategy: CenterPageEnlargeStrategy.height,
                          // enlargeCenterPage: true,
                          onPageChanged: (index, reason) {
                            setState(() {
                              _currentVideo = index;
                            });
                          },
                        ),
                      ),
                    ),
                    DotsIndicator(
                      decorator: DotsDecorator(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.blue.shade800),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        color: Colors.white,
                      ),
                      dotsCount: videos.length,
                      position: _currentVideo.toDouble(),
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
