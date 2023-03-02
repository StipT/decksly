import 'package:decksly/common/dev/asset_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HSAppBarOverlay extends StatelessWidget {
  const HSAppBarOverlay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            child: Image.asset(
              assetPath(
                kSubfolderBackground,
                "velvet_background_center",
                fileExtension: kJPGExtension,
              ),
              fit: BoxFit.fill,
            ),
          ),
          Container(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  assetPath(kSubfolderBackground, "velvet_background_top"),
                  width: double.infinity,
                  height: 17.5.h,
                  fit: BoxFit.fill,
                ),
                const Expanded(child: SizedBox()),
                Image.asset(
                  assetPath(kSubfolderBackground, "velvet_background_bottom"),
                  width: double.infinity,
                  height: 17.5.h,
                  fit: BoxFit.fill,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
