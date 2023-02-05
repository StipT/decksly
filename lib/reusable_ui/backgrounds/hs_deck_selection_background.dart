import 'package:decksly/common/dev/asset_loader.dart';
import 'package:flutter/widgets.dart';

class HSDeckSelectionBackground extends StatelessWidget {
  const HSDeckSelectionBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: double.infinity,
          child: Image.asset(
            assetPath(SUBFOLDER_BACKGROUND, "velvet_background_center", fileExtension: JPG_EXTENSION),
            fit: BoxFit.fill,
          ),
        ),
        SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Image.asset(
            assetPath(SUBFOLDER_BACKGROUND, "deck_creator_background"),
            fit: BoxFit.fill,
          ),
        ),


      ],
    );
  }
}