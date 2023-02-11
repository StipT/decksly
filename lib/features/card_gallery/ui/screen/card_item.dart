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
      {super.key, required this.inDeckBuilderMode, required this.card, required this.onTap, required this.onLongPress});

  final CardDTO card;
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
          children: [
            Container(
              padding: EdgeInsets.only(bottom: 2.5.h),
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
            if(card.rarityId == 5)
            Positioned(
              bottom : 0,
                right: 32.w,
                width: 60.w,
                child: Stack(
                  children: [
                    Image.asset(assetPath(SUBFOLDER_MISC, "card_counter_locked")),
                    Container(alignment: Alignment.center, padding: EdgeInsets.only(top: 3.h), child: Text("1/1", style: FontStyles.bold17WithShadow, textAlign: TextAlign.center,)),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
