import 'package:flutter/widgets.dart';

class HSRectangularGoldenBorder extends StatelessWidget {
  const HSRectangularGoldenBorder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: double.infinity,
          child: Image.asset(
            "assets/search/search_border_left.png",
            fit: BoxFit.fill,
          ),
        ),
        Expanded(
          child: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Image.asset(
              "assets/search/search_border_center.png",
              fit: BoxFit.fill,
            ),
          ),
        ),
        SizedBox(
          height: double.infinity,
          child: Image.asset(
            "assets/search/search_border_right.png",
            fit: BoxFit.fill,
          ),
        ),
      ],
    );
  }
}