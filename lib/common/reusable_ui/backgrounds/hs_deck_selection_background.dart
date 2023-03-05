import "package:decksly/common/dev/asset_loader.dart";
import "package:flutter/widgets.dart";

class HSDeckSelectionBackground extends StatelessWidget {
  const HSDeckSelectionBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: double.infinity,
          child: Image.asset(
            assetPath(kSubfolderBackground, "velvet_background_center", fileExtension: kJPGExtension),
            fit: BoxFit.fill,
          ),
        ),
        SizedBox.expand(
          child: Image.asset(
            assetPath(kSubfolderBackground, "deck_creator_background"),
            fit: BoxFit.fill,
          ),
        ),
      ],
    );
  }
}
