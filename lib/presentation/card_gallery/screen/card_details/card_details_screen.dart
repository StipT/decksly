import "package:decksly/common/design/fonts.dart";
import "package:decksly/common/dev/asset_loader.dart";
import "package:decksly/common/reusable_ui/misc/card_loading.dart";
import "package:decksly/l10n/locale_keys.g.dart";
import "package:decksly/repository/remote_source/api/dto/card_dto/card_dto.dart";
import "package:easy_localization/easy_localization.dart";
import "package:flip_card/flip_card.dart";
import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:foil/foil.dart";
import "package:xl/xl.dart";

class CardDetailsScreen extends StatelessWidget {
  const CardDetailsScreen(this.card, {super.key});

  final CardDTO card;

  Widget _buildCard() {
    return Foil(
      key: const Key("detailsCard"),
      opacity: 0.2,
      child: Center(
        child: Image.network(
          card.image,
          fit: BoxFit.fill,
          errorBuilder: (context, object, stackTrace) => const CardLoading(),
        ),
      ),
    );
  }

  Widget _buildCardBack() {
    final hasGoldenEdition = card.imageGold.isNotEmpty;
    return Foil(
      opacity: hasGoldenEdition ? 0.4 : 0.2,
      child: Center(
        child: Image.network(
          hasGoldenEdition ? card.imageGold : card.image,
          fit: BoxFit.fill,
          errorBuilder: (context, object, stackTrace) => const CardLoading(),
        ),
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
                key: const Key("closeDetails"),
                onTap: () => Navigator.pop(context),
                child: Image.asset(
                  assetPath(kSubfolderMisc, "close"),
                  fit: BoxFit.fill,
                  width: 40.w,
                ),
              ),
            ),
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
                          ),
                        ),
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
                            card.name,
                            style: FontStyles.bold28(),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 17.5.h,
                            ),
                            child: Text(
                              card.flavorText ?? "",
                              style: FontStyles.regular17Grey(),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 8.75.h,
                            ),
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: LocaleKeys.artist.tr(),
                                    style: FontStyles.regular17NavajoWhite(),
                                  ),
                                  TextSpan(text: card.artistName, style: FontStyles.regular17()),
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
