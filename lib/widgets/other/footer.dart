import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class Footer extends StatelessWidget {
  const Footer(this.brightness);
  final Brightness brightness;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = brightness == Brightness.dark;
    var textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    if (!isDark) {
      textTheme = textTheme.apply(
        displayColor: Colors.black,
        bodyColor: Colors.black,
      );
    }

    return Container(
      height: 90.0,
      color: isDark ? colorScheme.surface : colorScheme.onSurface,
      padding: const EdgeInsets.only(
        top: 15.0,
        left: 15.0,
        bottom: 10.0,
      ),
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('CONTACTANOS', style: textTheme.subtitle1),
                  const SizedBox(height: 7.5),
                  Text(
                    'contacto.sample.ar@gmail.com',
                    style: textTheme.bodyText2,
                  ),
                ],
              ),
              const SizedBox(width: 25.0),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('REDES SOCIALES', style: textTheme.subtitle1),
                  const SizedBox(height: 4.0),
                  Icon(
                    LineAwesomeIcons.instagram,
                    size: 16.0,
                    color: isDark ? colorScheme.primary : colorScheme.onPrimary,
                  ),
                ],
              ),
            ],
          ),
          Text(
            'copyright SAMPLE - 2021 - todos los derechos reservados',
            style: textTheme.caption,
          ),
        ],
      ),
    );
  }
}
