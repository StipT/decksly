import "package:decksly/common/design/fonts.dart";
import "package:decksly/common/dev/asset_loader.dart";
import "package:decksly/l10n/locale_keys.g.dart";
import "package:easy_localization/easy_localization.dart";
import "package:flutter/material.dart";
import "package:flutter/widgets.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";

class NoConnectionWidget extends StatelessWidget {
  const NoConnectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 30.w,
        right: 30.w,
        top: 10.h,
      ),
      child: Column(
        children: [
          SizedBox(
            height: 157.5.h,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Positioned(
                  top: 115.5.h,
                  child: Image.asset(
                    assetPath(kSubfolderMisc, "divider"),
                  ),
                ),
                Positioned(
                  top: 0,
                  child: SizedBox(
                    height: 165.5.h,
                    child: Image.asset(
                      assetPath(kSubfolderMisc, "murlocs"),
                      height: 165.5.h,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Text(
            LocaleKeys.serviceNotAvailable.tr(),
            textAlign: TextAlign.center,
            style: FontStyles.bold25VanDykeBrown(),
          ),
          Container(
            margin: EdgeInsets.only(top: 4.375.h),
            child: Text(
              LocaleKeys.checkYourInternetConnectionAndTryAgain.tr(),
              textAlign: TextAlign.center,
              style: FontStyles.regular17VanDykeBrown(),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 4.375.h),
            child: Image.asset(
              assetPath(kSubfolderMisc, "line"),
            ),
          ),
        ],
      ),
    );
  }
}
