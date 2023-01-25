import 'package:decksly/common/design/colors.dart';
import 'package:decksly/common/design/fonts.dart';
import 'package:decksly/presentation/resources/locale_keys.g.dart';
import 'package:decksly/repository/remote_source/api/dto/card_dto/card_dto.dart';
import 'package:easy_localization/easy_localization.dart';
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
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      body: Container(
        height: 1.sh,
        child: Stack(
          children: [
            Positioned(
                top: 25.h,
                right: 60.w,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 40.w,
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
                      padding: EdgeInsets.only(right: 90.w),
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
                              style: FontStyles.regular17Grey,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 5.h,
                            ),
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  // TODO Add localization
                                  TextSpan(
                                    text: LocaleKeys.artist.tr(),
                                    style: const TextStyle(color: AppColors.navajoWhite),
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
