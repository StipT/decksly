import 'package:decksly/common/design/fonts.dart';
import 'package:decksly/common/dev/asset_loader.dart';
import 'package:decksly/common/reusable_ui/misc/card_loading.dart';
import 'package:decksly/l10n/locale_keys.g.dart';
import 'package:decksly/repository/remote_source/api/dto/card_dto/card_dto.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
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

  Widget _buildCard() {
    return Foil(
      useSensor: true,
      isUnwrapped: false,
      opacity: 0.2,
      child: Center(
        child: Image.network(
          widget.card.image,
          fit: BoxFit.fill,
          errorBuilder: (context, object, stackTrace) => const CardLoading(),
        ),
      ),
    );
  }

  Widget _buildCardBack() {
    final hasGoldenEdition = widget.card.imageGold.isNotEmpty;
    return Foil(
      useSensor: true,
      isUnwrapped: false,
      opacity: hasGoldenEdition ? 0.4 : 0.2,
      child: Center(
        child: hasGoldenEdition
            ? Image.network(
                widget.card.imageGold,
                fit: BoxFit.fill,
                errorBuilder: (context, object, stackTrace) => const CardLoading(),
              )
            : Container(alignment: Alignment.bottomCenter, padding: EdgeInsets.only(top: 25.h, left: 10.w, right: 10.w), child: Image.asset(assetPath(kSubfolderMisc, "hs_cardback"))),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      body: SizedBox(
        height: 1.sh,
        child: Stack(
          children: [
            Positioned(
                top: 43.75.h,
                right: 60.w,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Image.asset(
                    assetPath(kSubfolderMisc, "close"),
                    fit: BoxFit.fill,
                    width: 40.w,
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
                              back: _buildCardBack(),
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
                          Text(
                            widget.card.name,
                            style: FontStyles.bold28,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 17.5.h,
                            ),
                            child: Text(
                              widget.card.flavorText ?? "",
                              style: FontStyles.regular17Grey,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 8.75.h,
                            ),
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  // TODO Add localization
                                  TextSpan(
                                    text: LocaleKeys.artist.tr(),
                                    style: FontStyles.regular17NavajoWhite,
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
