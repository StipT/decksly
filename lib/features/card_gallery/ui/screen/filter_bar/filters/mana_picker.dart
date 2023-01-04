import 'package:decksly/common/asset_loader.dart';
import 'package:decksly/common/fonts.dart';
import 'package:decksly/reusable_ui/backgrounds/hs_active_text_field_overlay.dart';
import 'package:decksly/reusable_ui/backgrounds/hs_rectangular_golden_border.dart';
import 'package:decksly/reusable_ui/backgrounds/hs_rectangular_outline.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ManaPicker extends StatefulWidget {
  final void Function(String) onChange;

  const ManaPicker({
    Key? key,
    required this.onChange,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ManaPickerState();
}

class _ManaPickerState extends State<ManaPicker> {
  final List<bool> activeItems = List.filled(11, false);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          const HSRectangularOutline(),
          const HSRectangularGoldenBorder(),
          if (activeItems.contains(true)) const HSActiveTextFieldOverlay(),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 0.0085.sw,
              vertical: 0.01.sh,
            ),
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: 11,
              itemBuilder: (BuildContext context, int index) {
                return ManaItem(
                  index: index,
                  isActive: activeItems[index],
                  onTap: () {
                    setState(() {
                      activeItems[index] = !activeItems[index];
                    });

                    String manaFilter = "";
                    for (int i = 0; i < activeItems.length; i++) {
                      if (activeItems[i] == true) {
                        manaFilter.isEmpty ? manaFilter += i.toString() : manaFilter += ",${i.toString()}";
                      }
                    }
                    widget.onChange(manaFilter);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ManaItem extends StatelessWidget {
  final int index;
  final bool isActive;
  final VoidCallback onTap;

  const ManaItem({
    Key? key,
    required this.index,
    required this.isActive,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        width: 14.5.w,
        alignment: Alignment.center,
        child: Stack(
          children: [
            Container(
              alignment: Alignment.center,
              child: Image.asset(
                assetPath("misc", "mana_inactive"),
                fit: BoxFit.fill,
              ),
            ),
            if (isActive)
              Container(
                alignment: Alignment.center,
                child: Image.asset(
                  assetPath("misc", "mana_active"),
                  fit: BoxFit.fill,
                ),
              ),
            Center(
              child: Text(
                index.toString(),
                style: FontStyles.bold22Shadow,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
