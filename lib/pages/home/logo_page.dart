import 'package:flutter/material.dart';

class LogoPage extends StatelessWidget {
  const LogoPage({@required this.height});
  final double height;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      height: height,
      color: theme.colorScheme.surface,
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'web/images/brand/logo.png',
            width: 350.0,
            height: 88.2,
          ),
          const SizedBox(height: 30.0),
          Text('1ST DROP', style: theme.textTheme.subtitle2),
        ],
      ),
    );
  }
}
