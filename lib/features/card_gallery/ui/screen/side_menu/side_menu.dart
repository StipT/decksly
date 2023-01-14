import 'package:decksly/common/design/colors.dart';
import 'package:decksly/common/design/fonts.dart';
import 'package:decksly/common/dev/asset_loader.dart';
import 'package:decksly/reusable_ui/backgrounds/hs_wood_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({Key? key, required this.onToggle}) : super(key: key);

  final void Function(bool) onToggle;

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> with TickerProviderStateMixin {
  bool isExtended = false;
  late OverlayEntry _overlayEntry;
  late AnimationController _animationController;
  late Animation<double> _rotateAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 200));
    _rotateAnimation = Tween(begin: 0.0, end: 0.5).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      left: isExtended ? 0 : -100.w,
      top: 80.h,
      curve: Curves.bounceOut,
      duration: const Duration(milliseconds: 500),
      child: GestureDetector(
        onHorizontalDragEnd: (dragDetails) {
          _toggleSideMenu();
        },
        child: Container(
          alignment: Alignment.center,
          width: 117.w,
          height: 365.h,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(
                assetPath(
                  SUBFOLDER_BACKGROUND,
                  "velvet_background_center",
                  fileExtension: JPG_EXTENSION,
                ),
                fit: BoxFit.fill,
              ),
              Image.asset(
                assetPath(SUBFOLDER_MISC, "side_bar_border"),
                fit: BoxFit.fill,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Column(
                  children: [
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            assetPath(SUBFOLDER_BACKGROUND, "splash_icon"),
                            color: AppColors.spanishGrey,
                            fit: BoxFit.fitWidth,
                            width: 20.w,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 5.w),
                            child: Text(
                              "Decksly",
                              style: FontStyles.bold25WithShadow,
                            ),
                          ),
                        ],
                      ),
                      padding: EdgeInsets.symmetric(vertical: 20.h),
                    ),
                    Container(
                      child: Image.asset(
                        assetPath(SUBFOLDER_MISC, "velvet_divider"),
                        fit: BoxFit.fitWidth,
                        width: 80.w,
                      ),
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 5.w),
                            child: Text(
                              "Card Library",
                              style: FontStyles.bold22WithShadow,
                            ),
                          ),
                        ],
                      ),
                      padding: EdgeInsets.symmetric(vertical: 20.h),
                    ),
                    Container(
                      child: Image.asset(
                        assetPath(SUBFOLDER_MISC, "velvet_divider"),
                        fit: BoxFit.fitWidth,
                        width: 80.w,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 20.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Deck Builder",
                            style: FontStyles.bold22WithShadow,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Image.asset(
                        assetPath(SUBFOLDER_MISC, "velvet_divider"),
                        fit: BoxFit.fitWidth,
                        width: 80.w,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 25.h),
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      child: Row(
                        children: [
                          Expanded(
                            child: Image.asset(
                              assetPath(SUBFOLDER_MISC, "german_flag"),
                              fit: BoxFit.fitWidth,
                              width: 30.w,
                            ),
                          ),
                          Expanded(
                            child: Image.asset(
                              assetPath(SUBFOLDER_MISC, "german_flag"),
                              fit: BoxFit.fitWidth,
                              width: 30.w,
                            ),
                          ),
                          Expanded(
                            child: Image.asset(
                              assetPath(SUBFOLDER_MISC, "german_flag"),
                              fit: BoxFit.fitWidth,
                              width: 30.w,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 103.w,
                top: 120.h,
                child: Container(
                  width: 14.w,
                  height: 85.h,
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 1.w),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      const HSWoodBorder(),
                      Container(
                        padding: EdgeInsets.only(
                          top: 2.h,
                          bottom: 2.h,
                          left: 2.w,
                        ),
                        child: RotationTransition(
                          turns: _rotateAnimation,
                          child: Image.asset(
                            assetPath(SUBFOLDER_MISC, "arrow"),
                            fit: BoxFit.fill,
                            width: 7.5.w,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _toggleSideMenu({bool close = false}) async {
    if (isExtended || close) {
      await _animationController.reverse();
      _overlayEntry.remove();
      setState(() {
        isExtended = false;
      });
    } else {
      _overlayEntry = _createOverlay();
      Overlay.of(context)?.insert(_overlayEntry);
      setState(() => isExtended = true);
      _animationController.forward();
    }

    widget.onToggle(isExtended);
  }

  OverlayEntry _createOverlay() {
    return OverlayEntry(
      // full screen GestureDetector to register when ał
      // user has clicked away from the dropdown
      builder: (context) => GestureDetector(
        onTap: () => _toggleSideMenu(close: true),
        behavior: HitTestBehavior.opaque,
        // full screen container to register taps anywhere and close drop down
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Container()
        ),
      ),
    );
  }
}
