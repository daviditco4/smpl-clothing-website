import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class NavBar extends StatelessWidget implements PreferredSizeWidget {
  const NavBar(this.brightness, {this.scrollToShirtsOverview});
  final Brightness brightness;
  final Future<void> Function() scrollToShirtsOverview;
  @override
  Size get preferredSize => const Size.fromHeight(32.0); // previous: 92.0

  void _popUntilHomeAndRefresh(
    NavigatorState navigator, {
    bool shouldGoToShirtsOverview = false,
  }) {
    navigator.popUntil(ModalRoute.withName('/'));
    navigator.pushReplacementNamed('/', arguments: shouldGoToShirtsOverview);
  }

  @override
  Widget build(BuildContext context) {
    final isDark = brightness == Brightness.dark;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final actualTextTheme = isDark
        ? theme.textTheme
        : theme.textTheme.apply(bodyColor: Colors.black);
    final nav = Navigator.of(context);
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
            onPressed: () => _popUntilHomeAndRefresh(nav),
            child: Text('HOME', style: button),
          ),
          Spacer(),
          TextButton(
            onPressed: () {
              if (scrollToShirtsOverview == null) {
                _popUntilHomeAndRefresh(nav, shouldGoToShirtsOverview: true);
              } else {
                scrollToShirtsOverview();
              }
            },
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
