import 'package:flutter/widgets.dart';

class HSActiveTextFieldOverlay extends StatelessWidget {
  const HSActiveTextFieldOverlay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: double.infinity,
          child: Image.asset(
            "assets/search/focused_search_left.png",
            fit: BoxFit.fill,
          ),
        ),
        Expanded(
          child: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Image.asset(
              "assets/search/focused_search_center.png",
              fit: BoxFit.fill,
            ),
          ),
        ),
        SizedBox(
          height: double.infinity,
          child: Image.asset(
            "assets/search/focused_search_right.png",
            fit: BoxFit.fill,
          ),
        ),
      ],
    );
  }
}