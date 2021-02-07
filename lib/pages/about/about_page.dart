import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart' show VideoPlayerController;

import '../../widgets/other/footer.dart';
import '../../widgets/other/nav_bar.dart';
import '../../widgets/other/video_player.dart';

class AboutPage extends StatefulWidget {
  static const routeName = '/about';
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  VideoPlayerController _videoCtrl;
  Future<void> _initializeVideoCtrlFuture;

  @override
  void initState() {
    super.initState();
    _videoCtrl = VideoPlayerController.asset('web/videos/teaser.mp4');
    _initializeVideoCtrlFuture = _videoCtrl.initialize();
  }

  @override
  void dispose() {
    _videoCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const navBar = NavBar(brightness: Brightness.dark, isCollapsed: false);
    final pageHeight = MediaQuery.of(context).size.height;
    final theme = Theme.of(context);
    const horizontalPadding = 296.0;
    final textTheme = theme.textTheme;

    const text = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
        'Fusce orci tellus, ultrices non sem mattis, laoreet placerat lorem. '
        'Cras vitae ligula a est tempus ullamcorper. Donec nec mi ante. Mauris '
        'vehicula velit non sapien faucibus, non tristique dolor tincidunt.'
        '\nPellentesque fringilla faucibus est, in cursus ex. Donec eu sodales '
        'odio. Aenean a ante sit amet orci consequat lacinia. Maecenas '
        'ultricies ante sit amet nisi rutrum, eget rutrum elit eleifend. '
        'Vestibulum a faucibus magna. Etiam mauris turpis, accumsan eget '
        'egestas nec, ultricies sed nunc. Nulla facilisi. Integer semper dui '
        'vitae ipsum tincidunt, vitae ultrices risus hendrerit. Aliquam ac '
        'molestie mi. Quisque et auctor sem, eu porttitor urna.'
        '\nSed eget ligula est. Integer tincidunt mauris eget facilisis '
        'hendrerit. Nullam quis congue dolor. Mauris ullamcorper tincidunt '
        'nulla, et dignissim nisl. Nunc volutpat nunc in iaculis aliquam. '
        'Nulla facilisi. Aliquam sodales, urna eget malesuada efficitur, velit '
        'purus interdum leo, vitae ullamcorper magna felis ac magna. Duis '
        'tempus, dolor quis porttitor suscipit, leo justo rutrum ipsum, quis '
        'egestas augue erat vel erat.';

    const captionSpacing = SizedBox(height: 20.0);
    const videoSize = 232.0;

    return Scaffold(
      appBar: navBar,
      body: ListView(
        children: [
          Container(
            height: pageHeight - navBar.preferredSize.height,
            color: theme.colorScheme.surface,
            padding: const EdgeInsets.only(
              right: horizontalPadding,
              left: horizontalPadding,
              bottom: 32.0,
            ),
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('ABOUT', style: textTheme.headline4),
                    const SizedBox(height: 32.0),
                    Container(
                      width: 368.0,
                      child: Text(
                        text,
                        textWidthBasis: TextWidthBasis.parent,
                        textAlign: TextAlign.justify,
                        softWrap: true,
                        style: textTheme.bodyText1,
                      ),
                    ),
                  ],
                ),
                Container(
                  width: videoSize,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      captionSpacing,
                      Text('drop #1 teaser', style: textTheme.caption),
                      captionSpacing,
                      FutureBuilder(
                        future: _initializeVideoCtrlFuture,
                        builder: (_, snap) {
                          return snap.connectionState == ConnectionState.done
                              ? AspectRatio(
                                  aspectRatio: 1.0,
                                  child: VideoPlayer(_videoCtrl),
                                )
                              : Container(
                                  height: videoSize,
                                  child: const Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Footer(Brightness.light),
        ],
      ),
    );
  }
}
