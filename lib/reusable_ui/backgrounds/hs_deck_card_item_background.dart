import 'package:decksly/common/dev/asset_loader.dart';
import 'package:flutter/material.dart';

class HSDeckCardItemBackground extends StatelessWidget {
  const HSDeckCardItemBackground({Key? key, this.isDropdownButton = false}) : super(key: key);

  final bool isDropdownButton;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [

        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: double.infinity,
              child: Image.asset(
                assetPath(SUBFOLDER_MISC, "deck_card_item_start"),
                fit: BoxFit.fill,
              ),
            ),
            Expanded(
              child: SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: Image.asset(
                  assetPath(SUBFOLDER_MISC, "deck_card_item_center"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(
              height: double.infinity,
              child: Image.asset(
                assetPath(SUBFOLDER_MISC, "deck_card_item_end"),
                fit: BoxFit.fill,
              ),
            ),

          ],
        ),
      ],
    );
  }
}