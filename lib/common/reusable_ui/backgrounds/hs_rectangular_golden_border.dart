import "package:decksly/common/dev/asset_loader.dart";
import "package:flutter/widgets.dart";

class HSRectangularGoldenBorder extends StatelessWidget {
  const HSRectangularGoldenBorder({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: double.infinity,
          child: Image.asset(
            assetPath(kSubfolderTextField, "text_field_border_left"),
            fit: BoxFit.fill,
          ),
        ),
        Expanded(
          child: SizedBox.expand(
            child: Image.asset(
              assetPath(kSubfolderTextField, "text_field_border_center"),
              fit: BoxFit.fill,
            ),
          ),
        ),
        SizedBox(
          height: double.infinity,
          child: Image.asset(
            assetPath(kSubfolderTextField, "text_field_border_right"),
            fit: BoxFit.fill,
          ),
        ),
      ],
    );
  }
}
