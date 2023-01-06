import 'package:decksly/common/asset_loader.dart';
import 'package:decksly/common/fonts.dart';
import 'package:decksly/presentation/resources/locale_keys.g.dart';
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
      child: Column(
        children: [
          Container(
            width: 1.sw,
            height: 200.h,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Positioned(
                  top: 160.h,
                  child: Container(
                      child: Image.asset(
                    assetPath("misc", "divider"),
                    width: 0.7.sw,
                  )),
                ),
                Positioned(
                    top: 0,
                    child: Container(
                        height: 200.h,
                        child: Image.asset(
                          assetPath("misc", "no_cards_found"),
                          height: 200.h,
                        ))),
              ],
            ),
          ),
          Container(
            child: Text(
              LocaleKeys.noCardsFound.tr(),
              style: FontStyles.bold24Button,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 0.02.sh),
            child: Text(
              LocaleKeys.tryRemovingSearchItems.tr(),
              style: FontStyles.regular17Brown,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 0.05.sh),
            child: Image.asset(
              assetPath("misc", "line"),
              width: 0.7.sw,
            ),
          ),
        ],
      ),
    );
  }
}
