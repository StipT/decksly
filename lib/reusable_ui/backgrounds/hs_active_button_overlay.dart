import 'package:flutter/widgets.dart';

class HSActiveButtonOverlay extends StatelessWidget {
  const HSActiveButtonOverlay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: double.infinity,
          child: Image.asset(
            "assets/button/focused_button_left.png",
            fit: BoxFit.fill,
          ),
        ),
        Expanded(
          child: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Image.asset(
              "assets/button/focused_button_center.png",
              fit: BoxFit.fill,
            ),
          ),
        ),
        SizedBox(
          height: double.infinity,
          child: Image.asset(
            "assets/button/focused_button_right.png",
            fit: BoxFit.fill,
          ),
        ),
      ],
    );
  }
}