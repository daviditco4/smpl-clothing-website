import 'package:flutter/material.dart';

import '../../models/utils/clothing_size.dart';

class ClothingSizeDropdownButton extends StatefulWidget {
  const ClothingSizeDropdownButton({
    @required this.onChanged,
    @required this.getter,
  });

  final void Function(ClothingSize size) onChanged;
  final ClothingSize Function() getter;

  @override
  _ClothingSizeDropdownButtonState createState() {
    return _ClothingSizeDropdownButtonState();
  }
}

class _ClothingSizeDropdownButtonState
    extends State<ClothingSizeDropdownButton> {
  var _isOpen = false;

  String _labelShort(ClothingSize size) {
    switch (size) {
      case ClothingSize.small:
        return 'S';
      case ClothingSize.medium:
        return 'M';
      case ClothingSize.large:
        return 'L';
      default:
        return 'unknown';
    }
  }

  String get _selectedSizeLabel {
    switch (widget.getter()) {
      case ClothingSize.small:
        return 'SMALL';
      case ClothingSize.medium:
        return 'MEDIUM';
      case ClothingSize.large:
        return 'LARGE';
      default:
        return 'unknown';
    }
  }

  Widget _buildContent({
    @required double height,
    @required bool isInner,
    ClothingSize size,
  }) {
    final theme = Theme.of(context);

    return Container(
      height: height,
      decoration: BoxDecoration(
        border: Border.all(color: theme.shadowColor),
        color: isInner ? null : const Color(0xFFF1F1F2),
      ),
      alignment: Alignment.center,
      child: Text(
        _isOpen
            ? isInner
                ? _labelShort(size)
                : 'select'
            : widget.getter() == null
                ? 'select'
                : _selectedSizeLabel,
        style: theme.primaryTextTheme.overline.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const contentHeight = 16.0;

    return Container(
      width: 58.0,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
            onTap: () => setState(() => _isOpen = !_isOpen),
            child: _buildContent(height: contentHeight, isInner: false),
          ),
          if (_isOpen)
            ...ClothingSize.values.map(
              (size) {
                return InkWell(
                  onTap: () {
                    setState(() {
                      _isOpen = false;
                      widget.onChanged(size);
                    });
                  },
                  child: _buildContent(
                    height: contentHeight,
                    isInner: true,
                    size: size,
                  ),
                );
              },
            )
          else
            SizedBox(height: contentHeight * ClothingSize.values.length),
        ],
      ),
    );
  }
}
