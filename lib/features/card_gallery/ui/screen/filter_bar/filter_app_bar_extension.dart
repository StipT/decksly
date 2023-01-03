import 'package:decksly/reusable_ui/backgrounds/hs_appbar_overlay.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FilterAppBarExtension extends StatelessWidget {
  const FilterAppBarExtension({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0.18.sh,
      width: double.infinity,
      child: Stack(
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [],
          ),
        ],
      ),
    );
  }
}
