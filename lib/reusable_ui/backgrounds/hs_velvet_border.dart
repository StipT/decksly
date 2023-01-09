import 'package:decksly/common/dev/asset_loader.dart';
import 'package:flutter/widgets.dart';

class HSVelvetBorder extends StatelessWidget {
  const HSVelvetBorder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: double.infinity,
          child: Image.asset(
            assetPath(SUBFOLDER_SHARED, "border_left_outline"),
            fit: BoxFit.fill,
          ),
        ),
        Expanded(
          child: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Image.asset(
              assetPath(SUBFOLDER_SHARED, "border_center_outline"),
              fit: BoxFit.fill,
            ),
          ),
        ),
        SizedBox(
          height: double.infinity,
          child: Image.asset(
            assetPath(SUBFOLDER_SHARED, "border_right_outline"),
            fit: BoxFit.fill,
          ),
        ),
      ],
    );
  }
}
