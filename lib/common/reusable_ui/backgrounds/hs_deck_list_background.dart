import "package:decksly/common/dev/asset_loader.dart";
import "package:flutter/widgets.dart";

class HSDeckListBackground extends StatelessWidget {
  const HSDeckListBackground({
    super.key,
    required this.headerHeight,
    required this.footerHeight,
  });

  final double headerHeight;
  final double footerHeight;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: headerHeight,
          width: double.infinity,
          child: Image.asset(
            assetPath(kSubfolderBackground, "deck_list_top"),
            fit: BoxFit.fill,
          ),
        ),
        Expanded(
          child: SizedBox(
            child: Image.asset(
              assetPath(kSubfolderBackground, "deck_list_center"),
              fit: BoxFit.fill,
            ),
          ),
        ),
        SizedBox(
          height: footerHeight,
          width: double.infinity,
          child: Image.asset(
            assetPath(kSubfolderBackground, "deck_list_bottom"),
            fit: BoxFit.fill,
          ),
        ),
      ],
    );
  }
}
