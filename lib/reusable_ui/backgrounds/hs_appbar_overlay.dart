import 'package:decksly/common/dev/asset_loader.dart';
import 'package:flutter/widgets.dart';

class HSAppBarOverlay extends StatelessWidget {
  const HSAppBarOverlay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      fit: StackFit.expand,
      children: [
        Container(
          width: double.infinity,
          child: Image.asset(
            assetPath(
              SUBFOLDER_BACKGROUND,
              "velvet_background_center",
              fileExtension: JPG_EXTENSION,
            ),
            fit: BoxFit.fill,
          ),
        ),
        Container(
          alignment: Alignment.topCenter,
          width: double.infinity,
          child: Image.asset(
            assetPath(SUBFOLDER_BACKGROUND, "velvet_background_top"),
            fit: BoxFit.fitWidth,
          ),
        ),
        Container(
          alignment: Alignment.bottomCenter,
          width: double.infinity,
          child: Image.asset(
            assetPath(SUBFOLDER_BACKGROUND, "velvet_background_bottom"),
            fit: BoxFit.fill,
          ),
        ),
      ],
    );
  }
}
