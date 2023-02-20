import 'package:decksly/common/design/fonts.dart';
import 'package:decksly/common/dev/asset_loader.dart';
import 'package:decksly/l10n/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NoResultsWidget extends StatelessWidget {
  const NoResultsWidget({Key? key, required this.onTap}) : super(key: key);
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      child: Column(
        children: [
          SizedBox(
            height: 90.h,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Positioned(
                  top: 70.h,
                  child: Container(
                    child: Image.asset(
                      assetPath(SUBFOLDER_MISC, "divider"),

                    ),
                  ),
                ),
                Positioned(
                    top: 0,
                    child: SizedBox(
                        height: 90.h,
                        child: Image.asset(
                          assetPath(SUBFOLDER_MISC, "no_cards_found"),
                          height: 90.h,
                        ))),
              ],
            ),
          ),
          Container(
            child: Text(
              LocaleKeys.noCardsFound.tr(),
              style: FontStyles.bold25VanDykeBrown,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 2.5.h),
            child: Text(
              LocaleKeys.tryRemovingSearchItems.tr(),
              style: FontStyles.regular17VanDykeBrown,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 2.5.h),
            child: Image.asset(
              assetPath(SUBFOLDER_MISC, "line"),

            ),
          ),
        ],
      ),
    );
  }
}
