import 'package:decksly/common/dev/asset_loader.dart';
import 'package:flutter/widgets.dart';

class HSButtonOverlay extends StatelessWidget {
  const HSButtonOverlay({Key? key, this.isDropdownButton = false}) : super(key: key);

  final bool isDropdownButton;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        isDropdownButton
            ? SizedBox(
                height: double.infinity,
                child: Image.asset(
                  assetPath(kSubfolderDropdown, "dropdown_button_border_left"),
                  fit: BoxFit.fill,
                ),
              )
            : SizedBox(
                height: double.infinity,
                child: Image.asset(
                  assetPath(kSubfolderButton, "button_border_left"),
                  fit: BoxFit.fill,
                ),
              ),
        Expanded(
          child: SizedBox(
            height: double.infinity,
            width: double.infinity,
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
