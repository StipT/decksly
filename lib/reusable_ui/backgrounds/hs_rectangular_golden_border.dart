import 'package:decksly/common/dev/asset_loader.dart';
import 'package:flutter/widgets.dart';

class HSRectangularGoldenBorder extends StatelessWidget {
  const HSRectangularGoldenBorder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: double.infinity,
          child: Image.asset(
            assetPath(SUBFOLDER_TEXT_FIELD, "text_field_border_left"),
            fit: BoxFit.fill,
          ),
        ),
        Expanded(
          child: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Image.asset(
              assetPath(SUBFOLDER_TEXT_FIELD, "text_field_border_center"),
              fit: BoxFit.fill,
            ),
          ),
        ),
        SizedBox(
          height: double.infinity,
          child: Image.asset(
            assetPath(SUBFOLDER_TEXT_FIELD, "text_field_border_right"),
            fit: BoxFit.fill,
          ),
        ),
      ],
    );
  }
}