import "package:decksly/common/design/fonts.dart";
import "package:decksly/common/dev/asset_loader.dart";
import "package:decksly/common/reusable_ui/misc/card_loading.dart";
import "package:decksly/repository/remote_source/api/dto/card_dto/card_dto.dart";
import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";

class CardItem extends StatefulWidget {
  const CardItem({
    super.key,
    required this.inDeckBuilderMode,
    required this.card,
    required this.onTap,
    required this.onLongPress,
    required this.amount,
  });

  final CardDTO card;
  final int amount;
  final bool inDeckBuilderMode;
  final Function(CardDTO) onTap;
  final Function(CardDTO) onLongPress;

  @override
  State<CardItem> createState() => _CardItemState();
}

class _CardItemState extends State<CardItem> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onTap(widget.card),
      onLongPress: () => widget.onLongPress(widget.card),
      child: Container(
        alignment: Alignment.topCenter,
        margin: EdgeInsets.all(1.w),
        child: Stack(
          fit: StackFit.expand,
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
                  widget.card.image,
                  errorBuilder: (context, object, stackTrace) => const CardLoading(),
                  loadingBuilder: (context, widget, chunk) {
                    return chunk?.cumulativeBytesLoaded == chunk?.expectedTotalBytes ? widget : const CardLoading();
                  },
                ),
              ),
            ),
            if (widget.card.rarityId == 5 && widget.amount == 1)
              Positioned(
                bottom: 0.h,
                width: 100.w,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      assetPath(kSubfolderMisc, "card_counter_locked"),
                      width: 60.w,
                      fit: BoxFit.fitWidth,
                    ),
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(left: 10.w),
                      child: Text(
                        "1/1",
                        style: FontStyles.bold17WithShadow(),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            if (widget.card.rarityId != 5 && widget.amount > 0)
              Positioned(
                bottom: 0.h,
                width: 100.w,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      assetPath(kSubfolderMisc, widget.amount == 2 ? "card_counter_locked" : "card_counter"),
                      width: 60.w,
                      fit: BoxFit.fitWidth,
                    ),
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(left: widget.amount == 2 ? 10.w : 0.w),
                      child: Text(
                        "${widget.amount}/2",
                        style: FontStyles.bold17WithShadow(),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  bool isDisabled() {
    if (widget.card.rarityId == 5 && widget.amount == 1) {
      return true;
    }
    if (widget.card.rarityId != 5 && widget.amount > 1) {
      return true;
    }
    return false;
  }
}