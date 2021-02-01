import 'package:flutter/material.dart';

import 'arrow_button.dart';

class ShirtCareInfo extends StatefulWidget {
  @override
  _ShirtCareInfoState createState() => _ShirtCareInfoState();
}

class _ShirtCareInfoState extends State<ShirtCareInfo> {
  var _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    const infoContainerHeight = 30.0;
    final overline = Theme.of(context).primaryTextTheme.overline;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (_isExpanded)
          Container(
            height: infoContainerHeight,
            alignment: Alignment.topLeft,
            child: Text(
              'Debes lavarla por lo menos luego de una vez por cada dos usos.',
              style: overline,
              softWrap: true,
              overflow: TextOverflow.fade,
            ),
          ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 6.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('cuidado de la prenda', style: overline),
              ArrowButton(
                onPressed: () => setState(() => _isExpanded = !_isExpanded),
                direction: _isExpanded ? AxisDirection.up : AxisDirection.down,
                arrowLength: 5.0,
                brightness: Brightness.light,
              ),
            ],
          ),
        ),
        if (!_isExpanded) const SizedBox(height: infoContainerHeight),
      ],
    );
  }
}
