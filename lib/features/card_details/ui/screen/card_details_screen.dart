import 'package:decksly/common/design/colors.dart';
import 'package:decksly/common/design/fonts.dart';
import 'package:decksly/repository/remote_source/api/dto/card_dto/card_dto.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foil/foil.dart';
import 'package:xl/xl.dart';

class CardDetailsScreen extends StatefulWidget {
  const CardDetailsScreen(this.card, {super.key});

  final CardDTO card;

  @override
  State<CardDetailsScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<CardDetailsScreen> {
  @override
  void initState() {
    super.initState();
  }

  Widget _buildCard({bool golden = false}) {
    final hasGoldenEdition = golden && widget.card.imageGold.isNotEmpty;
    final card = hasGoldenEdition ? widget.card.imageGold : widget.card.image;
    return Foil(
      useSensor: true,
      isUnwrapped: false,
      opacity: hasGoldenEdition ? 0.4 : 0.2,
      child: Center(
        child: Image.network(
          card,
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        height: 1.sh,
        child: Stack(
          children: [
            Positioned(
                top: 50.h,
                right: 30.w,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 20.w,
                  ),
                )),
            Row(
              children: [
                Expanded(
                  child: XL(
                    sharesPointer: false,
                    layers: [
                      XLayer(
                        xRotation: 0.9,
                        yRotation: 0.9,
                        zRotationByGyro: 0.1,
                        child: Container(
                            alignment: Alignment.center,
                            child: FlipCard(
                              front: _buildCard(),
                              back: _buildCard(golden: true),
                              flipOnTouch: true,
                            )),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      padding: EdgeInsets.only(right: 45.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Text(
                              widget.card.name ?? "",
                              style: FontStyles.bold28,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 10.h,
                            ),
                            child: Text(
                              widget.card.flavorText ?? "",
                              style: FontStyles.regular20Grey,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 10.h,
                            ),
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  // TODO Add localization
                                  const TextSpan(
                                    text: 'Artist: ',
                                    style: TextStyle(color: AppColors.navajoWhite),
                                  ),
                                  TextSpan(text: widget.card.artistName, style: FontStyles.regular17),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
