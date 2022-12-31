import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CustomDropdown<T> extends StatefulWidget {
  /// the child widget for the button, this will be ignored if text is supplied
  final Widget child;

  /// onChange is called when the selected option is changed.;
  /// It will pass back the value and the index of the option.
  final void Function(T, int) onChange;

  /// list of DropdownItems
  final List<DropdownItem<T>> items;
  final DropdownStyle dropdownStyle;

  /// dropdownButtonStyles passes styles to OutlineButton.styleFrom()
  final DropdownButtonStyle dropdownButtonStyle;

  /// dropdown button icon defaults to caret
  final Icon icon;
  final bool hideIcon;

  /// if true the dropdown icon will as a leading icon, default to false
  final bool leadingIcon;

  const CustomDropdown({
    Key? key,
    this.hideIcon = false,
    required this.child,
    required this.items,
    required this.dropdownStyle,
    required this.dropdownButtonStyle,
    required this.icon,
    this.leadingIcon = false,
    required this.onChange,
  }) : super(key: key);

  @override
  _CustomDropdownState<T> createState() => _CustomDropdownState<T>();
}

class _CustomDropdownState<T> extends State<CustomDropdown<T>> with TickerProviderStateMixin {
  final LayerLink _layerLink = LayerLink();
  late OverlayEntry _overlayEntry;
  bool _isOpen = false;
  int _currentIndex = -1;
  late AnimationController _animationController;
  late Animation<double> _expandAnimation;
  late Animation<double> _rotateAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 200));
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
    // link the overlay to the button
    return CompositedTransformTarget(
      link: this._layerLink,
      child: Container(
        color: Colors.transparent,
        width: style.width,
        height: style.height,
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            textStyle: style.textStyle,
            padding: style.padding,
            backgroundColor: style.backgroundColor,
            elevation: style.elevation,
            primary: style.primaryColor,
            shape: style.shape as OutlinedBorder?,
          ),
          onPressed: _toggleDropdown,
          child: Container(
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              textDirection: widget.leadingIcon ? TextDirection.rtl : TextDirection.ltr,
              mainAxisSize: MainAxisSize.max,
              children: [
                if (_currentIndex == -1) ...[
                  widget.child,
                ] else ...[
                  widget.items[_currentIndex],
                ],
                if (!widget.hideIcon)
                  RotationTransition(
                    turns: _rotateAnimation,
                    child: widget.icon,
                  ),
              ],
            ),
          ),
        ),
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
      // full screen GestureDetector to register when a
      // user has clicked away from the dropdown
      builder: (context) => GestureDetector(
        onTap: () => _toggleDropdown(close: true),
        behavior: HitTestBehavior.opaque,
        // full screen container to register taps anywhere and close drop down
        child: Container(
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
                  link: this._layerLink,
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
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                widget.dropdownStyle.dropdownBackgroundAssetPath ?? "",
                              ),
                              fit: BoxFit.fill,
                            ),
                          ),
                          child: ListView(
                            physics: const BouncingScrollPhysics(),
                            padding: widget.dropdownStyle.padding ?? EdgeInsets.zero,
                            shrinkWrap: true,
                            children: widget.items.asMap().entries.map((item) {
                              return InkWell(
                                onTap: () {
                                  setState(() => _currentIndex = item.key);
                                  widget.onChange(item.value.value, item.key);
                                  _toggleDropdown();
                                },
                                child: item.value,
                              );
                            }).toList(),
                          ),
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
      this._overlayEntry.remove();
      setState(() {
        _isOpen = false;
      });
    } else {
      this._overlayEntry = this._createOverlayEntry();
      Overlay.of(context)?.insert(this._overlayEntry);
      setState(() => _isOpen = true);
      _animationController.forward();
    }
  }
}

/// DropdownItem is just a wrapper for each child in the dropdown list.\n
/// It holds the value of the item.
class DropdownItem<T> extends StatelessWidget {
  final T value;
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
  final TextStyle textStyle;

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
    required this.textStyle,
  });
}

class DropdownStyle {
  final BorderRadius? borderRadius;
  final double? elevation;
  final Color? color;
  final EdgeInsets? padding;
  final BoxConstraints? constraints;
  final TextStyle textStyle;

  /// position of the top left of the dropdown relative to the top left of the button
  final Offset? offset;

  ///button width must be set for this to take effect
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
    required this.textStyle,
  });
}
