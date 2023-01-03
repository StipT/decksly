import 'package:flutter/widgets.dart';

class HSRectangularOutline extends StatelessWidget {
  const HSRectangularOutline({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: double.infinity,
          child: Image.asset(
            "assets/shared/border_left_outline.png",
            fit: BoxFit.fill,
          ),
        ),
        Expanded(
          child: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Image.asset(
              "assets/shared/border_center_outline.png",
              fit: BoxFit.fill,
            ),
          ),
        ),
        SizedBox(
          height: double.infinity,
          child: Image.asset(
            "assets/shared/border_right_outline.png",
            fit: BoxFit.fill,
          ),
        ),
      ],
    );
  }
}
