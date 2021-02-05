import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class NavBar extends StatelessWidget implements PreferredSizeWidget {
  const NavBar(this.brightness);
  final Brightness brightness;
  @override
  Size get preferredSize => const Size.fromHeight(32.0); // previous: 92.0

  @override
  Widget build(BuildContext context) {
    final isDark = brightness == Brightness.dark;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final actualTextTheme = isDark
        ? theme.textTheme
        : theme.textTheme.apply(bodyColor: Colors.black);
    final navigator = Navigator.of(context);
    final button = actualTextTheme.button;
    const buttonSpacing = SizedBox(width: 36.0);

    return Container(
      height: preferredSize.height,
      color: isDark ? colorScheme.surface : theme.canvasColor,
      padding: const EdgeInsets.symmetric(horizontal: 48.0),
      // previous:
      // padding: const EdgeInsets.symmetric(horizontal: 64.0, vertical: 8.0),
      // child: Column(
      //   mainAxisAlignment: MainAxisAlignment.spaceAround,
      //   children: [
      //     Row(
      //       mainAxisAlignment: MainAxisAlignment.end,
      //       children: [
      //         TextButton(
      //           onPressed: () {},
      //           child: Text('LOG IN', style: actualTextTheme.overline),
      //         ),
      //         const SizedBox(width: 24.0),
      //         TextButton(
      //           onPressed: () {},
      //           child: Icon(
      //             LineAwesomeIcons.shopping_cart,
      //             color: isDark ? colorScheme.primary : colorScheme.onPrimary,
      //           ),
      //         ),
      //       ],
      //     ),
      //     Row(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextButton(
            onPressed: () {
              navigator.popUntil(ModalRoute.withName('/'));
              navigator.pushReplacementNamed('/');
            },
            child: Text('HOME', style: button),
          ),
          Spacer(),
          TextButton(
            onPressed: () {},
            child: Text('DROP #1', style: button),
          ),
          buttonSpacing,
          TextButton(onPressed: () {}, child: Text('ABOUT', style: button)),
          buttonSpacing,
          TextButton(
            onPressed: () {},
            child: Icon(
              LineAwesomeIcons.shopping_cart,
              size: 20.0,
              color: isDark ? colorScheme.primary : colorScheme.onPrimary,
            ),
          ),
        ],
      ),
      //   ],
      // ),
    );
  }
}
