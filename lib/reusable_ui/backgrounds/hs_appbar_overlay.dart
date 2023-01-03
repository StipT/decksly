import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HSAppBarOverlay extends StatelessWidget {
  const HSAppBarOverlay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Expanded(
          child: Container(
            height: double.infinity,
            width: double.infinity,
            child: Image.asset(
              "assets/background/velvet_background_center.jpg",
              fit: BoxFit.fill,
            ),
          ),
        ),

        Container(
          alignment: Alignment.topCenter,
          width: double.infinity,
          child: Image.asset(
            "assets/background/velvet_background_top.png",
            fit: BoxFit.fitWidth,
          ),
        ),
        Container(
          alignment: Alignment.bottomCenter,
          width: double.infinity,
          child: Image.asset(
            "assets/background/velvet_background_bottom.png",
            fit: BoxFit.fill,
          ),
        ),
      ],
    );
  }
}
