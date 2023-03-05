import "package:decksly/common/dev/asset_loader.dart";
import "package:flutter/widgets.dart";

class HSVelvetBorder extends StatelessWidget {
  const HSVelvetBorder({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: double.infinity,
          child: Image.asset(
            assetPath(kSubfolderShared, "border_left_outline"),
            fit: BoxFit.fill,
          ),
        ),
        Expanded(
          child: SizedBox.expand(
            child: Image.asset(
              assetPath(kSubfolderShared, "border_center_outline"),
              fit: BoxFit.fill,
            ),
          ),
        ),
        SizedBox(
          height: double.infinity,
          child: Image.asset(
            assetPath(kSubfolderShared, "border_right_outline"),
            fit: BoxFit.fill,
          ),
        ),
      ],
    );
  }
}
