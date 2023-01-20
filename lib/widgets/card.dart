import 'package:dots_indicator/dots_indicator.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyCard extends StatefulWidget {
  const MyCard({
    Key? key,
    required this.cardWidth,
  }) : super(key: key);

  final double cardWidth;
  @override
  State<MyCard> createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  double index = 0;
  bool isFront = true;
  final FlipCardController _controller = FlipCardController();
  // details
  DateTime validFrom = DateTime(2021, 8);
  DateTime validTo = DateTime.now().add(const Duration(days: 60));
  final String cardNumber = "2021 0000 0000 0001";
  final String cardHolderName = "Shri Ram";
  final String cardHolderFatherName = "S/O Dasrath";
  final String cardHolderImgUrl = "assets/card_holder_img.png";

  @override
  Widget build(BuildContext context) {
    double cardHeight = widget.cardWidth / 1.6;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        children: [
          GestureDetector(
            onHorizontalDragEnd: (details) {
              _controller.toggleCard();
            },
            child: FlipCard(
              flipOnTouch: false,
              onFlip: () {
                setState(() {
                  isFront = !isFront;
                });
              },
              controller: _controller,
              fill: Fill.fillBack,
              front: Stack(
                children: [
                  Container(
                    height: cardHeight,
                    width: widget.cardWidth,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blueGrey[100],
                    ),
                    child: Image.asset(
                      "assets/card_front_background.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    height: cardHeight,
                    width: widget.cardWidth,
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          // color: Colors.amber,
                          height: cardHeight * 0.65,
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                SizedBox(
                                  width: widget.cardWidth * 0.45,
                                  height: cardHeight * 0.2,
                                  child: Image.asset(
                                    "assets/logo.png",
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                SizedBox(
                                  width: widget.cardWidth * 0.45,
                                  height: cardHeight * 0.08,
                                  child: const FittedBox(
                                      child: Text(
                                    "A HEALTH & WELNESS CARD",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromRGBO(63, 64, 134, 1),
                                    ),
                                  )),
                                ),
                                SizedBox(
                                  width: widget.cardWidth * 0.6,
                                  height: cardHeight * 0.15,
                                  child: FittedBox(
                                      child: Text(
                                    cardNumber,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: cardHeight * 0.1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              SizedBox(
                                width: widget.cardWidth * 0.18,
                                height: cardHeight * 0.08,
                                child: Row(
                                  // mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    SizedBox(
                                      width: widget.cardWidth * 0.04,
                                      child: const FittedBox(
                                        child: Text(
                                          "Valid\nFrom",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: widget.cardWidth * 0.13,
                                      child: FittedBox(
                                        child: Text(
                                          DateFormat("MM/yyyy")
                                              .format(validFrom),
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: widget.cardWidth * 0.55,
                                height: cardHeight * 0.1,
                                child: FittedBox(
                                  child: Container(
                                    color:
                                        const Color.fromRGBO(247, 250, 174, 1),
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 2.0,
                                      horizontal: 4,
                                    ),
                                    child: const Text(
                                      "!!Our Major Services Provider!!",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: widget.cardWidth * 0.18,
                                height: cardHeight * 0.08,
                                child: Row(
                                  // mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    SizedBox(
                                      width: widget.cardWidth * 0.04,
                                      child: const FittedBox(
                                        child: Text(
                                          "Valid\nTill",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: widget.cardWidth * 0.13,
                                      child: FittedBox(
                                        child: Text(
                                          DateFormat("MM/yyyy").format(validTo),
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: cardHeight * 0.25,
                          child: SizedBox(
                            width: widget.cardWidth * 0.6,
                            height: cardHeight * 0.23,
                            child: FittedBox(
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 2.0,
                                  horizontal: 4,
                                ),
                                child: const Text(
                                  "Doctor | Hospital & Nursing Homes Diagnostics Centers |\npathology Labs | Physiotherapy | Pharmacy | Healthcare |\nAyurvedic Clinic | Homeopathy Clinic | Cosmetology |\nHealth & Wellness Center & Spa | Many More",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: SizedBox(
                      width: widget.cardWidth * 0.2,
                      height: cardHeight * 0.25, // empty space
                      child: Center(
                        child: SizedBox(
                          width: widget.cardWidth * 0.15,
                          height: cardHeight * 0.12,
                          child: Image.asset(
                            "assets/card_discount_card_logo.png",
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: SizedBox(
                      width: widget.cardWidth * 0.225,
                      height: cardHeight * 0.55, // empty space
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: widget.cardWidth * 0.1,
                            height: widget.cardWidth * 0.1,
                            child: Image.asset(
                              "assets/card_logo.png",
                              fit: BoxFit.contain,
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                color: Colors.black,
                                width: 1,
                              ),
                              color: Colors.grey.shade300,
                            ),
                            width: widget.cardWidth * 0.17,
                            height: widget.cardWidth * 0.17,
                            child: Image.asset(
                              cardHolderImgUrl,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    child: SizedBox(
                      width: widget.cardWidth * 0.25,
                      height: cardHeight * 0.3, // empty space
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              width: widget.cardWidth * 0.2,
                              height: cardHeight * 0.1,
                              child: FittedBox(
                                child: Text(
                                  cardHolderName,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: widget.cardWidth * 0.2,
                              height: cardHeight * 0.08,
                              child: FittedBox(
                                child: Text(
                                  cardHolderFatherName,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
              back: Container(
                height: widget.cardWidth / 1.6,
                width: widget.cardWidth,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.blueGrey[100],
                ),
                child: Image.asset(
                  "assets/card_back.png",
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          const SizedBox(height: 5),
          DotsIndicator(
            dotsCount: 2,
            position: isFront ? 0 : 1,
          ),
        ],
      ),
    );
  }
}
