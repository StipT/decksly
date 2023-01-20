import 'package:decksly/common/design/fonts.dart';
import 'package:decksly/common/dev/asset_loader.dart';
import 'package:decksly/navigation/navigation_config.dart';
import 'package:decksly/reusable_ui/backgrounds/hs_deck_creator_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DeckSelectorScreen extends StatefulWidget {
  const DeckSelectorScreen({super.key});

  @override
  State<DeckSelectorScreen> createState() => _DeckSelectorScreenState();
}

class _DeckSelectorScreenState extends State<DeckSelectorScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const HSDeckCreatorBackground(),
          Container(
            margin: EdgeInsets.only(top: 65.h, left: 25.w, right: 25.w, bottom: 50.h),
            child: Column(
              children: [
                Container(
                  height: 70.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          padding: EdgeInsets.only(right: 10.w),
                          child: Image.asset(assetPath(SUBFOLDER_MISC, "velvet_ornament_left"))),
                      Container(
                          child: Column(
                        children: [
                          Expanded(flex: 3, child: Image.asset(assetPath(SUBFOLDER_MISC, "deckbuilder_tab_standard"))),
                          Expanded(
                              child: Text(
                            "Standard",
                            style: FontStyles.bold15,
                          ))
                        ],
                      )),
                      Container(
                          padding: EdgeInsets.symmetric(horizontal: 15.w),
                          child: Column(
                            children: [
                              Expanded(
                                  flex: 3, child: Image.asset(assetPath(SUBFOLDER_MISC, "deckbuilder_tab_classic"))),
                              Expanded(
                                  child: Text(
                                "Classic",
                                style: FontStyles.bold15,
                              ))
                            ],
                          )),
                      Container(
                          child: Column(
                        children: [
                          Expanded(flex: 3, child: Image.asset(assetPath(SUBFOLDER_MISC, "deckbuilder_tab_wild"))),
                          Expanded(
                              child: Text(
                            "Wild",
                            style: FontStyles.bold15,
                          ))
                        ],
                      )),
                      Container(
                          padding: EdgeInsets.only(left: 10.w),
                          child: Image.asset(assetPath(SUBFOLDER_MISC, "velvet_ornament_right"))),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20.h),
                  height: 2.h,
                  width: 300.w,
                  child: Image.asset(
                    assetPath(SUBFOLDER_MISC, "velvet_divider"),
                    fit: BoxFit.fill,
                    height: 2.h,
                    width: 80.w,
                  ),
                ),

              ],
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                CardGalleryRoute.open(context);
              },
              child: Container(
                width: 50.w,
                height: 50.h,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
