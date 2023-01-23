import 'package:decksly/common/design/fonts.dart';
import 'package:decksly/common/dev/asset_loader.dart';
import 'package:decksly/navigation/navigation_config.dart';
import 'package:decksly/reusable_ui/backgrounds/hs_deck_creator_background.dart';
import 'package:decksly/reusable_ui/backgrounds/hs_wood_horizontal_border.dart';
import 'package:decksly/reusable_ui/button/hs_button.dart';
import 'package:decksly/reusable_ui/button/hs_toggle_button.dart';
import 'package:decksly/reusable_ui/text_field/hs_text_field.dart';
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

          Column(
            children: [
              _getAppBar(),
              Container(
                margin: EdgeInsets.only(top: 5.h, left: 25.w, right: 25.w, bottom: 50.h),
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
            ],
          ),
        ],
      ),
    );
  }

  Widget _getAppBar() {
    return Container(
      height: 70.h,
      padding: EdgeInsets.only(top: 15.h, bottom: 5.h, right: 5.w),
      width: 1.sw,
      child: Row(
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.only(right: 40.w),
              child: Stack(
                children: [
                  const HSWoodHorizontalBorder(),
                  Container(
                    margin: EdgeInsets.only(left: 12.5.w, right: 12.5.w),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                              child: HSTextField(onChange: (change){}, theme: TextFieldTheme.none, hint: "Paste a deck code here",)),
                        ),

                        Container(
                          child: HSButton(width: 50.w, isDisabled: false, label: "Import", onTap: (){},),),
                      ],
                    ),
                  ),


                ],
              ),
            ),),

          Container(
            width: 70.w,
            child: Stack(
              children: [
                const HSWoodHorizontalBorder(),
                Container(
                    margin: EdgeInsets.only(left: 12.5.w, right: 12.5.w),
                    child: HSButton(width: 70.w, isDisabled: false, label: "Close", onTap: (){      CardGalleryRoute.open(context);}, icon: Image.asset(assetPath(SUBFOLDER_MISC, "close")),)),
              ],
            ),),
        ],
      ),
    );
  }

  Widget _getModeSelector() {
    return SizedBox();
  }

  Widget _getCreatedDecks() {
    return SizedBox();
  }

  Widget _getClassSelector() {
    return SizedBox();
  }
}
