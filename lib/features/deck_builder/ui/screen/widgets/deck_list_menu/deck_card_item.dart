import 'package:auto_size_text/auto_size_text.dart';
import 'package:decksly/common/design/colors.dart';
import 'package:decksly/common/design/fonts.dart';
import 'package:decksly/common/dev/asset_loader.dart';
import 'package:decksly/features/deck_builder/domain/model/deck_card.dart';
import 'package:decksly/reusable_ui/backgrounds/hs_deck_card_item_background.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DeckCardItem extends StatelessWidget {
  const DeckCardItem({
    super.key,
    required this.index,
    required this.deckCard,
    required this.onTap,
    required this.onLongPress,
  }) : super();

  final int index;
  final DeckCard deckCard;

  final Function(int, DeckCard) onTap;
  final Function(DeckCard) onLongPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(index, deckCard),
      onLongPress: () => onLongPress(deckCard),
      child: Container(
        margin: EdgeInsets.only(right: 12.5.w),
        height: 25.h,
        child: Stack(
          fit: StackFit.expand,
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
                        padding: EdgeInsets.symmetric(
                            vertical: 1.75.h, horizontal: 6.w),
                        width: double.infinity,
                        child: deckCard.card.cropImage != null
                            ? Image.network(
                                deckCard.card.cropImage ?? "",
                                fit: BoxFit.cover,
                              )
                            : Image.asset(
                                assetPath(SUBFOLDER_MISC, "crop_not_found"),
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
            HSDeckCardItemBackground(
              startWidth: 30.w,
              endWidth: 25.w,
            ),
            Container(
              alignment: Alignment.center,
              child: Row(
                children: [
                  Container(
                    width: 20.w,
                    margin: EdgeInsets.only(left: 5.w),
                    child: AutoSizeText(
                      deckCard.card.manaCost.toString(),
                      textAlign: TextAlign.center,
                      style: FontStyles.bold17WithShadow,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 7.5.w),
                    width: 150.w,
                    child: Text(
                      deckCard.card.name,
                      style: FontStyles.bold11WithShadow,
                      textAlign: TextAlign.start,
                    ),
                  ),
                  if (deckCard.card.rarityId == 5 && deckCard.amount == 1)
                    Expanded(
                      child: Image.asset(
                        assetPath(SUBFOLDER_MISC, "legendary_star"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  if (deckCard.card.rarityId != 5 && deckCard.amount == 2)
                    Expanded(
                      child: Text(
                        deckCard.amount.toString(),
                        style: FontStyles.bold13Gold,
                        textAlign: TextAlign.center,
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
        padding: EdgeInsets.symmetric(
          vertical: 1.75.h,
          horizontal: 2.w,
        ),
      ),
    );
  }
}
