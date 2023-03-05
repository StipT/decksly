import "package:decksly/common/dev/asset_loader.dart";
import "package:flutter/widgets.dart";

class HSWoodBorder extends StatelessWidget {
  const HSWoodBorder({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          child: Image.asset(
            assetPath(kSubfolderShared, "wood_border_left_outline"),
            fit: BoxFit.fill,
          ),
        ),
        Expanded(
          child: SizedBox(
            child: Image.asset(
              assetPath(kSubfolderShared, "wood_border_center_outline"),
              fit: BoxFit.fill,
            ),
          ),
        ),
        SizedBox(
          child: Image.asset(
            assetPath(kSubfolderShared, "wood_border_right_outline"),
            fit: BoxFit.fill,
          ),
        ),
      ],
    );
  }
}
