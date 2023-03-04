import 'package:decksly/features/card_gallery/domain/model/card_filters/card_filter_interface/card_filter_interface.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDropdown<T> extends StatefulWidget {
  final void Function(CardFilter) onChange;

  final Widget Function(CardFilter) dropdownButton;
  final DropdownItem<CardFilter> Function(CardFilter) selectedItem;

  final List<DropdownItem<CardFilter>> items;
  final DropdownStyle dropdownStyle;

  final Widget? activeDropdownButtonOverlay;
  final Widget? selectedDropdownButtonOverlay;

  final DropdownButtonStyle dropdownButtonStyle;

  final Icon icon;
  final bool hideIcon;

  const CustomDropdown({
    Key? key,
    this.hideIcon = false,
    required this.dropdownButton,
    required this.items,
    required this.selectedItem,
    required this.dropdownStyle,
    required this.dropdownButtonStyle,
    required this.icon,
    required this.onChange,
    this.activeDropdownButtonOverlay,
    this.selectedDropdownButtonOverlay,
  }) : super(key: key);

  @override
  _CustomDropdownState<T> createState() => _CustomDropdownState<T>();
}

class _CustomDropdownState<T> extends State<CustomDropdown<T>> with TickerProviderStateMixin {
  final LayerLink _layerLink = LayerLink();
  late OverlayEntry _overlayEntry;
  bool _isOpen = false;
  late CardFilter? _currentValue;
  late AnimationController _animationController;
  late Animation<double> _expandAnimation;
  late Animation<double> _rotateAnimation;

  @override
  void initState() {
    super.initState();
    _currentValue = widget.items[0].value;
    _animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 200));
    _expandAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
    _rotateAnimation = Tween(begin: 0.0, end: 0.5).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  Widget build(BuildContext context) {
    var style = widget.dropdownButtonStyle;
    return CompositedTransformTarget(
      link: _layerLink,
      child: Stack(
        children: [
          if (_isOpen) widget.activeDropdownButtonOverlay ?? const SizedBox(),
          if (_currentValue?.value != widget.items[0].value.value && !_isOpen)
            widget.selectedDropdownButtonOverlay ?? const SizedBox(),
          Container(
            color: Colors.transparent,
            width: style.width,
            height: style.height,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                foregroundColor: style.primaryColor,
                side: const BorderSide(
                  color: Colors.transparent,
                ),
                textStyle: style.textStyle,
                padding: style.padding,
                shape: style.shape as OutlinedBorder?,
              ),
              onPressed: _toggleDropdown,
              child: SizedBox(
                width: double.infinity,
                child: Row(
                  children: [
                    ...[
                      Expanded(
                        child: widget.dropdownButton(_currentValue ?? widget.items[0].value),
                      ),
                    ],
                    if (!widget.hideIcon)
                      Container(
                        padding: EdgeInsets.only(right: 10.w),
                        child: RotationTransition(
                          turns: _rotateAnimation,
                          child: widget.icon,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  OverlayEntry _createOverlayEntry() {
    // find the size and position of the current widget
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    var size = renderBox.size;

    var offset = renderBox.localToGlobal(Offset.zero);
    var topOffset = offset.dy + size.height + 5;
    return OverlayEntry(
      // full screen GestureDetector to register when ał
      // user has clicked away from the dropdown
      builder: (context) => GestureDetector(
        onTap: () => _toggleDropdown(close: true),
        behavior: HitTestBehavior.opaque,
        // full screen container to register taps anywhere and close drop down
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              Positioned(
                left: offset.dx,
                top: topOffset,
                width: widget.dropdownStyle.width ?? size.width,
                child: CompositedTransformFollower(
                  offset: widget.dropdownStyle.offset ?? Offset(0, size.height + 5),
                  link: _layerLink,
                  showWhenUnlinked: false,
                  child: Material(
                    textStyle: widget.dropdownStyle.textStyle,
                    elevation: widget.dropdownStyle.elevation ?? 0,
                    borderRadius: widget.dropdownStyle.borderRadius ?? BorderRadius.zero,
                    color: Colors.transparent,
                    child: SizeTransition(
                      axisAlignment: 1,
                      sizeFactor: _expandAnimation,
                      child: ConstrainedBox(
                        constraints: widget.dropdownStyle.constraints ??
                            BoxConstraints(
                              maxHeight: MediaQuery.of(context).size.height - topOffset - 15,
                            ),
                        child: Container(
                          padding: EdgeInsets.only(
                            top: 6.125.h,
                            bottom: 6.125.h,
                            right: 10.w,
                          ),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                widget.dropdownStyle.dropdownBackgroundAssetPath ?? "",
                              ),
                              fit: BoxFit.fill,
                            ),
                          ),
                          child: RawScrollbar(
                              thumbVisibility: false,
                              radius: Radius.circular(20.r),
                              child: ListView.builder(
                                physics: const BouncingScrollPhysics(),
                                padding: widget.dropdownStyle.padding ?? EdgeInsets.zero,
                                shrinkWrap: true,
                                itemCount: widget.items.length,
                                itemBuilder: (context, index) {
                                  final item = widget.items.asMap().entries.toList()[index];
                                  final DropdownItem<CardFilter> selectedItem = widget.selectedItem(item.value.value);

                                  if (_currentValue?.value == selectedItem.value.value) {
                                    return InkWell(
                                        onTap: () {
                                          setState(() => _currentValue = item.value.value);
                                          widget.onChange(item.value.value);
                                          _toggleDropdown();
                                        },
                                        child: selectedItem.child);
                                  } else {
                                    return InkWell(
                                      onTap: () {
                                        setState(() => _currentValue = item.value.value);
                                        widget.onChange(item.value.value);
                                        _toggleDropdown();
                                      },
                                      child: item.value,
                                    );
                                  }
                                },
                              )),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _toggleDropdown({bool close = false}) async {
    if (_isOpen || close) {
      await _animationController.reverse();
      _overlayEntry.remove();
      setState(() {
        _isOpen = false;
      });
    } else {
      _overlayEntry = _createOverlayEntry();
      Overlay.of(context).insert(_overlayEntry);
      setState(() => _isOpen = true);
      _animationController.forward();
    }
  }
}

class DropdownItem<String> extends StatelessWidget {
  final String value;
  final Widget child;

  const DropdownItem({Key? key, required this.value, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return child;
  }
}

class DropdownButtonStyle {
  final MainAxisAlignment? mainAxisAlignment;
  final ShapeBorder? shape;
  final double? elevation;
  final Color? backgroundColor;
  final EdgeInsets? padding;
  final BoxConstraints? constraints;
  final double? width;
  final double? height;
  final Color? primaryColor;
  final TextStyle? textStyle;

  const DropdownButtonStyle({
    this.mainAxisAlignment,
    this.backgroundColor,
    this.primaryColor,
    this.constraints,
    this.height,
    this.width,
    this.elevation,
    this.padding,
    this.shape,
    this.textStyle,
  });
}

class DropdownStyle {
  final BorderRadius? borderRadius;
  final double? elevation;
  final Color? color;
  final EdgeInsets? padding;
  final BoxConstraints? constraints;
  final TextStyle? textStyle;
  final Offset? offset;
  final double? width;
  final String? dropdownBackgroundAssetPath;

  const DropdownStyle({
    this.dropdownBackgroundAssetPath,
    this.constraints,
    this.offset,
    this.width,
    this.elevation,
    this.color,
    this.padding,
    this.borderRadius,
    this.textStyle,
  });
}
