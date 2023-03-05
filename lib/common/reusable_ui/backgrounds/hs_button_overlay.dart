import "package:decksly/common/dev/asset_loader.dart";
import "package:flutter/widgets.dart";

class HSButtonOverlay extends StatelessWidget {
  const HSButtonOverlay({super.key, this.isDropdownButton = false});

  final bool isDropdownButton;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (isDropdownButton)
          SizedBox(
            height: double.infinity,
            child: Image.asset(
              assetPath(kSubfolderDropdown, "dropdown_button_border_left"),
              fit: BoxFit.fill,
            ),
          )
        else
          SizedBox(
            height: double.infinity,
            child: Image.asset(
              assetPath(kSubfolderButton, "button_border_left"),
              fit: BoxFit.fill,
            ),
          ),
        Expanded(
          child: SizedBox.expand(
            child: Image.asset(
              assetPath(kSubfolderButton, "button_border_center"),
              fit: BoxFit.fill,
            ),
          ),
        ),
        SizedBox(
          height: double.infinity,
          child: Image.asset(
            assetPath(kSubfolderButton, "button_border_right"),
            fit: BoxFit.fill,
          ),
        ),
      ],
    );
  }
}
