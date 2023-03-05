import "package:decksly/common/dev/asset_loader.dart";
import "package:flutter/material.dart";

class HSDeckCardItemBackground extends StatelessWidget {
  const HSDeckCardItemBackground({super.key, required this.startWidth, required this.endWidth});

  final double startWidth;
  final double endWidth;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: startWidth,
              height: double.infinity,
              child: Image.asset(
                assetPath(kSubfolderMisc, "deck_card_item_start"),
                fit: BoxFit.fill,
              ),
            ),
            Expanded(
              child: SizedBox.expand(
                child: Image.asset(
                  assetPath(kSubfolderMisc, "deck_card_item_center"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(
              width: endWidth,
              height: double.infinity,
              child: Image.asset(
                assetPath(kSubfolderMisc, "deck_card_item_end"),
                fit: BoxFit.fill,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
