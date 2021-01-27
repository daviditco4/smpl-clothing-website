import 'package:flutter/material.dart';

class ArrowButton extends StatelessWidget {
  const ArrowButton({
    @required this.onPressed,
    @required this.direction,
    this.arrowLength = 20.0,
    this.brightness,
    this.label,
  })  : assert(onPressed == null || brightness != null),
        assert(direction != null),
        assert(arrowLength != null);

  final void Function() onPressed;
  final AxisDirection direction;
  final double arrowLength;
  final Brightness brightness;
  final String label;

  String get _directionValue {
    switch (direction) {
      case AxisDirection.right:
        return 'right';
      case AxisDirection.up:
        return 'up';
      case AxisDirection.left:
        return 'left';
      case AxisDirection.down:
        return 'down';
      default:
        return 'unknown';
    }
  }

  @override
  Widget build(BuildContext context) {
    final isVertical =
        direction == AxisDirection.up || direction == AxisDirection.down
            ? true
            : false;
    final theme = Theme.of(context);
    final labelColor = onPressed == null
        ? theme.disabledColor
        : brightness == Brightness.light
            ? theme.shadowColor
            : theme.primaryColor;
    final color = onPressed == null
        ? 'disabled'
        : brightness == Brightness.light
            ? 'black'
            : 'yellow';

    var children = [
      if (label != null)
        Text(
          label,
          style: TextStyle(
            fontStyle: FontStyle.italic,
            fontSize: 13.0,
            letterSpacing: 1.8,
            color: labelColor,
          ),
        ),
      if (label != null) const SizedBox(width: 16.0, height: 16.0),
      Image.asset(
        'web/images/arrows/${_directionValue}_arrow_$color.png',
        width: isVertical ? null : arrowLength,
        height: isVertical ? arrowLength : null,
        fit: isVertical ? BoxFit.fitHeight : BoxFit.fitWidth,
      ),
    ];
    children =
        direction == AxisDirection.right || direction == AxisDirection.down
            ? children
            : children.reversed.toList();

    return InkWell(
      onTap: onPressed,
      child: isVertical
          ? Column(children: children, mainAxisSize: MainAxisSize.min)
          : Row(children: children, mainAxisSize: MainAxisSize.min),
    );
  }
}
