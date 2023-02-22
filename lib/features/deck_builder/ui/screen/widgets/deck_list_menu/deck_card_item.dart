import 'package:auto_size_text/auto_size_text.dart';
import 'package:decksly/common/design/colors.dart';
import 'package:decksly/common/design/fonts.dart';
import 'package:decksly/common/dev/asset_loader.dart';
import 'package:decksly/repository/remote_source/api/dto/card_dto/card_dto.dart';
import 'package:decksly/reusable_ui/backgrounds/hs_deck_card_item_background.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DeckCardItem extends StatelessWidget {
  const DeckCardItem({
    required this.card,
    required this.amount,
    required this.onTap,
    required this.onLongPress,
  });

  final CardDTO card;
  final int amount;

  final Function(CardDTO) onTap;
  final Function(CardDTO) onLongPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(card),
      onLongPress: () => onLongPress(card),
      child: Container(
        height: 16.h,
        child: Stack(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    color: AppColors.ebonyClay,
                  ),
                ),
                Expanded(
                  flex: 2,
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
                      Image.asset(
                        assetPath(SUBFOLDER_MISC, "deck_card_item_fill"),
                        width: double.infinity,
                        fit: BoxFit.fill,
                      ),
                    ],
                  ),
                )
              ],
            ),
            const HSDeckCardItemBackground(),
            Container(
              alignment: Alignment.center,
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 5.5.w),
                    width: 16.w,
                    child: AutoSizeText(
                      card.manaCost.toString(),
                      textAlign: TextAlign.center,
                      style: FontStyles.bold17WithShadow,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 7.5.w, right: 6.w),
                    width: 150.w,
                    child: Text(
                      card.name,
                      style: FontStyles.bold11WithShadow,
                      textAlign: TextAlign.start,
                    ),
                  ),
                  if (card.rarityId == 5 && amount == 1)
                    Expanded(
                      child: Image.asset(
                        assetPath(SUBFOLDER_MISC, "legendary_star"),
                        width: 12.5.w,
                      ),
                    ),
                  if (card.rarityId != 5 && amount == 2)
                    Expanded(
                      child: Text(
                        amount.toString(),
                        style: FontStyles.bold11Gold,
                        textAlign: TextAlign.center,
                      ),
                    ),
                ],
              ),
            ),
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
