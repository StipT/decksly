import 'package:decksly/common/dev/asset_loader.dart';
import 'package:flutter/widgets.dart';

class HSWoodBorder extends StatelessWidget {
  const HSWoodBorder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
        //  height: double.infinity,
          child: Image.asset(
            assetPath(SUBFOLDER_SHARED, "wood_border_left_outline"),
            fit: BoxFit.fill,
          ),
        ),
        Expanded(
          child: SizedBox(
        //    height: double.infinity,
        //    width: double.infinity,
            child: Image.asset(
              assetPath(SUBFOLDER_SHARED, "wood_border_center_outline"),
              fit: BoxFit.fill,
            ),
          ),
        ),
        SizedBox(
       //   height: double.infinity,
          child: Image.asset(
            assetPath(SUBFOLDER_SHARED, "wood_border_right_outline"),
            fit: BoxFit.fill,
          ),
        ),
      ],
    );
  }
}

