import 'package:decksly/common/dev/asset_loader.dart';
import 'package:flutter/widgets.dart';

class HSDeckListBackground extends StatelessWidget {
  const HSDeckListBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          //  height: double.infinity,
          child: Image.asset(
            assetPath(SUBFOLDER_BACKGROUND, "deck_list_top"),
            fit: BoxFit.fill,
          ),
        ),
        Expanded(
          child: SizedBox(
            //    height: double.infinity,
            //    width: double.infinity,
            child: Image.asset(
              assetPath(SUBFOLDER_BACKGROUND, "deck_list_center"),
              fit: BoxFit.fill,
            ),
          ),
        ),
        SizedBox(
          //   height: double.infinity,
          child: Image.asset(
            assetPath(SUBFOLDER_BACKGROUND, "deck_list_bottom"),
            fit: BoxFit.fill,
          ),
        ),
      ],
    );
  }
}

