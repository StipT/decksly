import "package:decksly/common/design/fonts.dart";
import "package:decksly/common/dev/asset_loader.dart";
import "package:decksly/common/reusable_ui/backgrounds/hs_active_text_field_overlay.dart";
import "package:decksly/common/reusable_ui/backgrounds/hs_rectangular_golden_border.dart";
import "package:decksly/common/reusable_ui/backgrounds/hs_velvet_border.dart";
import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";

class ManaPicker extends StatefulWidget {
  const ManaPicker({
    super.key,
    required this.onChange,
  });

  final void Function(String) onChange;

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
    return Stack(
      fit: StackFit.expand,
      children: [
        const HSVelvetBorder(),
        const HSRectangularGoldenBorder(),
        if (activeItems.contains(true)) const HSActiveTextFieldOverlay(),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 5.w,
          ),
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: 11,
            itemBuilder: (BuildContext context, int index) {
              return ManaItem(
                key: Key("manaItem$index"),
                index: index,
                isActive: activeItems[index],
                onTap: () {
                  setState(() {
                    activeItems[index] = !activeItems[index];
                  });

                  String manaFilter = "";
                  for (int i = 0; i < activeItems.length; i++) {
                    if (activeItems[i] == true) {
                      manaFilter.isEmpty ? manaFilter += i.toString() : manaFilter += ",$i";
                    }
                  }
                  widget.onChange(manaFilter);
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

class ManaItem extends StatelessWidget {
  const ManaItem({
    super.key,
    required this.index,
    required this.isActive,
    required this.onTap,
  });

  final int index;
  final bool isActive;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        width: 29.w,
        alignment: Alignment.center,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              assetPath(kSubfolderMisc, "mana_inactive"),
              fit: BoxFit.contain,
            ),
            if (isActive)
              Image.asset(
                assetPath(kSubfolderMisc, "mana_active"),
                fit: BoxFit.fill,
              ),
            Center(
              child: Text(
                index.toString(),
                style: FontStyles.bold22WithShadow(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}