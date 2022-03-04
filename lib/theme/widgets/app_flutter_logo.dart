import 'package:flutter/material.dart';
import 'package:very_good_slide_puzzle/layout/layout.dart';
import 'package:very_good_slide_puzzle/theme/themes/themes.dart';
import 'package:gap/gap.dart';

/// {@template app_flutter_logo}
/// Variant of Flutter logo that can be either white or colored.
/// {@endtemplate}
class AppFlutterLogo extends StatelessWidget {
  /// {@macro app_flutter_logo}
  const AppFlutterLogo({
    Key? key,
    this.isColored = true,
    this.height,
  }) : super(key: key);

  /// Whether this logo is colored.
  final bool isColored;

  /// The optional height of this logo.
  final double? height;

  @override
  Widget build(BuildContext context) {
    final assetName = isColored
        ? 'assets/images/logo_flutter_color.png'
        : 'assets/images/logo_flutter_white.png';

    return AnimatedSwitcher(
      duration: PuzzleThemeAnimationDuration.logoChange,
      child: height != null
          ? Image.asset(
              assetName,
              height: height,
            )
          : ResponsiveLayoutBuilder(
              key: Key(assetName),
              small: (_, __) => Row(
                children: [
                  Image.asset(
                    assetName,
                    height: 24,
                  ),
                  const Gap(5),
                  Image.asset(
                    'assets/images/simple_dash_small.png',
                    height: 30,
                  ),
                ],
              ),
              medium: (_, __) => Row(
                children: [
                  Image.asset(
                    assetName,
                    height: 29,
                  ),
                  const Gap(5),
                  Image.asset(
                    'assets/images/simple_dash_small.png',
                    height: 36,
                  ),
                ],
              ),
              large: (_, __) => Row(
                children: [
                  Image.asset(
                    assetName,
                    height: 32,
                  ),
                  const Gap(5),
                  Image.asset(
                    'assets/images/simple_dash_small.png',
                    height: 40,
                  ),
                ],
              ),
            ),
    );
  }
}
