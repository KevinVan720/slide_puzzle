import 'package:flutter/material.dart';
import 'package:very_good_slide_puzzle/layout/layout.dart';
import 'package:very_good_slide_puzzle/theme/themes/themes.dart';
import 'package:gap/gap.dart';

import 'package:flutter/foundation.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:very_good_slide_puzzle/theme/theme.dart';

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

    final theme = context.select((ThemeBloc bloc) => bloc.state.theme);

    return ShaderMask(
        shaderCallback: (Rect bounds) {
      return LinearGradient(
        colors: [
          theme.menuUnderlineColor,
          theme.menuUnderlineColor
        ],
      ).createShader(bounds);
    },
    child: AnimatedSwitcher(
      duration: PuzzleThemeAnimationDuration.logoChange,
      child: height != null
          ? Image.asset(
              assetName,
              height: height,
            )
          : ResponsiveLayoutBuilder(
              key: Key(assetName),
              small: (_, __) => Image.asset(
                assetName,
                height: 24,
              ),
              medium: (_, __) => Image.asset(
                    assetName,
                    height: 29,
                  ),
              large: (_, __) => Image.asset(
                    assetName,
                    height: 32,
                  )),
    ));
  }
}
