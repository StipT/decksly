import 'package:decksly/common/colors.dart';
import 'package:decksly/data/card_class.dart';
import 'package:decksly/data/card_set.dart';
import 'package:decksly/features/card_gallery/ui/bloc/card_gallery_bloc.dart';
import 'package:decksly/features/card_gallery/ui/screen/filter_bar/filter_app_bar_extension.dart';
import 'package:decksly/features/card_gallery/ui/screen/filter_bar/filters/mana_picker.dart';
import 'package:decksly/reusable_ui/backgrounds/hs_appbar_overlay.dart';
import 'package:decksly/reusable_ui/button/hs_button.dart';
import 'package:decksly/reusable_ui/dropdown/hs_dropdown.dart';
import 'package:decksly/reusable_ui/text_field/hs_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FilterAppBar extends StatefulWidget {
  const FilterAppBar({Key? key}) : super(key: key);

  @override
  State<FilterAppBar> createState() => _FilterAppBarState();
}

class _FilterAppBarState extends State<FilterAppBar> with TickerProviderStateMixin {
  bool isExtended = false;

  late AnimationController _animationController;
  late Animation<double> _expandAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    _expandAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: isExtended ? 0.31.sh : 0.2.sh,
      child: Stack(
        children: [
          const HSAppBarOverlay(),
          Column(
            children: [
              SizedBox(
                height: 0.2.sh,
                width: double.infinity,
                child: Container(
                  padding: EdgeInsets.only(left: 0.01.sw, top: 0.06.sh, bottom: 0.02.sh),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        child: HSDropdown(
                          dropdownType: DropdownType.cardSet,
                          dropdownValues: CardSet.values,
                          width: 35.w,
                          dropdownWidth: 125.w,
                          onChange: (value) => BlocProvider.of<CardGalleryBloc>(context)
                              .add(CardSetChangedEvent(cardSetFromIndex(value).value)),
                        ),
                      ),
                      HSDropdown(
                        width: 0.2.sw,
                        dropdownWidth: 0.225.sw,
                        dropdownType: DropdownType.cardClass,
                        dropdownValues: CardClass.values,
                        onChange: (value) => BlocProvider.of<CardGalleryBloc>(context)
                            .add(CardClassChangedEvent(cardClassFromIndex(value).value)),
                      ),
                      SizedBox(
                          width: 165.w,
                          child: ManaPicker(
                            onChange: (mana) =>
                                BlocProvider.of<CardGalleryBloc>(context).add(ManaFilterChangedEvent(mana)),
                          )),
                      Expanded(
                          child: HSTextField(
                        onChange: (text) =>
                            BlocProvider.of<CardGalleryBloc>(context).add(SearchFilterChangedEvent(text)),
                      )),
                      // TODO deck-12 Add filter Dialog
                      HSButton(
                        icon: SvgPicture.asset(
                          "assets/misc/filter.svg",
                          fit: BoxFit.fill,
                          color: AppColors.buttonIconColor,
                        ),
                        onTap: () {
                          _toggleBarExtension();
                        },
                      ),
                    ],
                  ),
                ),
              ),
              //if (isExtended)
                Expanded(
                  child: SizeTransition(
                    axisAlignment: 1,
                    sizeFactor: _expandAnimation,
                    child: const FilterAppBarExtension(),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }

  void _toggleBarExtension({bool close = false}) async  {
      if (isExtended || close) {
        await _animationController.reverse();
       // this._overlayEntry.remove();
        setState(() {
          isExtended = false;
        });
      } else {
      //  this._overlayEntry = this._createOverlayEntry();
     //   Overlay.of(context)?.insert(this._overlayEntry);
        setState(() => isExtended = true);
        _animationController.forward();
      }
    }
}
