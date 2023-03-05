import "package:decksly/common/dev/asset_loader.dart";
import "package:flutter/widgets.dart";

class HSActiveTextFieldOverlay extends StatelessWidget {
  const HSActiveTextFieldOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: double.infinity,
          child: Image.asset(
            assetPath(kSubfolderTextField, "focused_text_field_left"),
            fit: BoxFit.fill,
          ),
        ),
        Expanded(
          child: SizedBox.expand(
            child: Image.asset(
              assetPath(kSubfolderTextField, "focused_text_field_center"),
              fit: BoxFit.fill,
            ),
          ),
        ),
        SizedBox(
          height: double.infinity,
          child: Image.asset(
            assetPath(kSubfolderTextField, "focused_text_field_right"),
            fit: BoxFit.fill,
          ),
        ),
      ],
    );
  }
}
