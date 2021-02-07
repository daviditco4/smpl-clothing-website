import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../alert_dialog_builder.dart';
import '../../pages/about/about_page.dart';

class NavBar extends StatelessWidget implements PreferredSizeWidget {
  const NavBar({
    @required this.brightness,
    @required this.isCollapsed,
    this.scrollToShirtsOverview,
  });

  final Brightness brightness;
  final bool isCollapsed;
  final Future<void> Function() scrollToShirtsOverview;
  @override
  Size get preferredSize => Size.fromHeight(isCollapsed ? 32.0 : 92.0);

  void _popUntilHomeAndReplace(
    NavigatorState nav,
    String routeName, {
    bool shouldGoToShirtsOverview,
  }) {
    nav.popUntil(
      (route) {
        final routName = route.settings.name;
        return routName == '/' || routName == AboutPage.routeName;
      },
    );
    nav.pushReplacementNamed(routeName, arguments: shouldGoToShirtsOverview);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = brightness == Brightness.dark;
    final colorScheme = theme.colorScheme;
    final actualTextTheme = isDark
        ? theme.textTheme
        : theme.textTheme.apply(bodyColor: Colors.black);
    var actualButton = actualTextTheme.button;
    if (!isCollapsed) actualButton = actualButton.copyWith(fontSize: 15.75);
    final nav = Navigator.of(context);
    const buttonSpacing = SizedBox(width: 36.0);

    final cartButton = TextButton(
      onPressed: () {},
      child: Icon(
        LineAwesomeIcons.shopping_cart,
        size: 20.0,
        color: isDark ? colorScheme.primary : colorScheme.onPrimary,
      ),
    );

    final mainRow = Row(
      crossAxisAlignment:
          isCollapsed ? CrossAxisAlignment.stretch : CrossAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () => _popUntilHomeAndReplace(nav, '/'),
          child: Text('HOME', style: actualButton),
        ),
        Spacer(),
        TextButton(
          onPressed: () {
            if (scrollToShirtsOverview == null) {
              _popUntilHomeAndReplace(nav, '/', shouldGoToShirtsOverview: true);
            } else {
              scrollToShirtsOverview();
            }
          },
          child: Text('DROP #1', style: actualButton),
        ),
        buttonSpacing,
        TextButton(
          onPressed: () => _popUntilHomeAndReplace(nav, AboutPage.routeName),
          child: Text('ABOUT', style: actualButton),
        ),
        if (isCollapsed) buttonSpacing,
        if (isCollapsed) cartButton,
      ],
    );

    return Container(
      height: preferredSize.height,
      color: isDark ? colorScheme.surface : theme.canvasColor,
      padding: isCollapsed
          ? const EdgeInsets.symmetric(horizontal: 48.0)
          : const EdgeInsets.symmetric(horizontal: 64.0, vertical: 8.0),
      child: isCollapsed
          ? mainRow
          : Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        showDialog<Null>(
                          context: context,
                          builder: (c) => buildNotImplFeatureDialog(c, 'Login'),
                        );
                      },
                      child: Text('LOG IN', style: actualTextTheme.overline),
                    ),
                    const SizedBox(width: 24.0),
                    cartButton,
                  ],
                ),
                mainRow,
              ],
            ),
    );
  }
}
