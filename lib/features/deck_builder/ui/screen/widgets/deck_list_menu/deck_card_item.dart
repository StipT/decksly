import 'package:decksly/common/design/colors.dart';
import 'package:decksly/common/design/fonts.dart';
import 'package:decksly/repository/remote_source/api/dto/card_dto/card_dto.dart';
import 'package:decksly/reusable_ui/backgrounds/hs_deck_card_item_background.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DeckCardItem extends StatelessWidget {
  const DeckCardItem({
    required this.card,
    required this.amount,
    required this.onTapPlus,
    required this.onTapMinus,
    required this.onTapInfo,
  });

  final CardDTO card;
  final String amount;
  final VoidCallback onTapPlus;
  final VoidCallback onTapMinus;
  final VoidCallback onTapInfo;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () => onTapInfo,
      child: Container(
        height: 15.h,
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 6.w),
              width: double.infinity,
              child: Image.network(
                card.cropImage ?? "",
                fit: BoxFit.cover,
              ),
            ),
            const HSDeckCardItemBackground(),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                card.rarityId == 2
                      ? const Icon(
                          Icons.star,
                          color: AppColors.gold,
                        )
                      : Text(
                          amount,
                          style: FontStyles.bold11Gold,
                        ),
                  Text(
                    card.name ?? "",
                    style: FontStyles.bold11WithShadow,
                  )
                ],
              ),
            ),
            Container(
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => onTapPlus,
                    child: Text(
                      "+",
                      style: FontStyles.bold11Gold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => onTapPlus,
                    child: Text(
                      "-",
                      style: FontStyles.bold11Gold,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        padding: EdgeInsets.symmetric(
          vertical: 1.h,
          horizontal: 2.w,
        ),
      ),
    );
  }
}
