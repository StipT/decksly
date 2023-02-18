import 'package:decksly/common/design/colors.dart';
import 'package:decksly/common/design/fonts.dart';
import 'package:decksly/common/dev/asset_loader.dart';
import 'package:decksly/repository/remote_source/api/dto/card_dto/card_dto.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class CardItem extends StatelessWidget {
  const CardItem(
      {super.key,
      required this.inDeckBuilderMode,
      required this.card,
      required this.onTap,
      required this.onLongPress,
      required this.amount});

  final CardDTO card;
  final int amount;
  final bool inDeckBuilderMode;
  final Function(CardDTO) onTap;
  final Function(CardDTO) onLongPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(card),
      onLongPress: () => onLongPress(card),
      child: Container(
        alignment: Alignment.topCenter,
        margin: EdgeInsets.all(1.w),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              padding: EdgeInsets.only(bottom: 15.h),
              child: ColorFiltered(
                colorFilter: ColorFilter.mode(
                  isDisabled() ? Colors.grey : Colors.white,
                  BlendMode.modulate,
                ),
                child: Image.network(
                  // TODO deck-28 Add image not found asset
                  card.image,
                  loadingBuilder: (context, widget, chunk) {
                    return chunk?.cumulativeBytesLoaded == chunk?.expectedTotalBytes
                        ? widget
                        : Container(
                            padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 20.w),
                            child: Shimmer.fromColors(
                              baseColor: AppColors.spanishGrey,
                              highlightColor: AppColors.shimmerGrey,
                              child: Image.asset(
                                assetPath(SUBFOLDER_MISC, "card_template_grey"),
                              ),
                            ),
                          );
                  },
                ),
              ),
            ),
            if (card.rarityId == 5 && amount == 1)
              Positioned(
                bottom: 0.h,
                right: 40.w,
                width: 60.w,
                child: Stack(
                  children: [
                    Image.asset(
                      assetPath(SUBFOLDER_MISC, "card_counter_locked"),
                      fit: BoxFit.fitWidth,
                    ),
                    Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(top: 1.5.h, left: 10.w),
                        child: Text(
                          "1/1",
                          style: FontStyles.bold17WithShadow,
                          textAlign: TextAlign.center,
                        )),
                  ],
                ),
              ),
            if (card.rarityId != 5 && amount > 0)
              Positioned(
                bottom: 0.h,
                right: 42.5.w,
                width: 60.w,
                child: Stack(
                  children: [
                    Image.asset(
                      assetPath(SUBFOLDER_MISC, amount == 2 ? "card_counter_locked" : "card_counter"),
                      fit: BoxFit.fitWidth,
                    ),
                    Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(top: 1.5.h, left: amount == 2 ? 10.w : 0.w),
                        child: Text(
                          "$amount/2",
                          style: FontStyles.bold17WithShadow,
                          textAlign: TextAlign.center,
                        )),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  bool isDisabled() {
    if (card.rarityId == 5 && amount == 1) {
      return true;
    }
    if (card.rarityId != 5 && amount > 1) {
      return true;
    }
    return false;
  }
}