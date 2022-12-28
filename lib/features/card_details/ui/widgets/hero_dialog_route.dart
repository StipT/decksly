import 'package:decksly/common/colors.dart';
import 'package:flutter/widgets.dart';

class HeroDialogRoute<T> extends PageRoute<T> {
  HeroDialogRoute({required this.builder}) : super();

  final WidgetBuilder builder;

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => true;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 100);

  @override
  bool get maintainState => true;

  @override
  Color get barrierColor => AppColors.black90Transparent;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
    return builder(context);
  }

  @override
  String? get barrierLabel => "throw UnimplementedError()";
}
