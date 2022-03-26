import 'package:flutter/material.dart';
import 'package:very_good_slide_puzzle/layout/layout.dart';
import 'package:very_good_slide_puzzle/theme/themes/themes.dart';
import 'package:gap/gap.dart';

import 'package:flutter/foundation.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:very_good_slide_puzzle/theme/theme.dart';
import 'package:very_good_slide_puzzle/helpers/helpers.dart';

/// {@template app_flutter_logo}
/// Variant of Flutter logo that can be either white or colored.
/// {@endtemplate}
class AppFlutterLogo extends StatelessWidget {
  /// {@macro app_flutter_logo}
  const AppFlutterLogo({
    Key? key,
    this.height,
  }) : super(key: key);

  /// The optional height of this logo.
  final double? height;

  @override
  Widget build(BuildContext context) {
    final assetName = 'assets/images/logo_flutter_white.png';

    final theme = context.select((ThemeBloc bloc) => bloc.state.theme);

    return ShaderMask(
        shaderCallback: (Rect bounds) {
          return LinearGradient(
            colors: [
              theme.titleTextStyle.color ?? Colors.transparent,
              theme.titleTextStyle.color ?? Colors.transparent,
            ],
          ).createShader(bounds);
        },
        child: AnimatedSwitcher(
          duration: PuzzleThemeAnimationDuration.logoChange
              .dilate(context.getTimeDilation()),
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
                        height: 26,
                      ),
                  large: (_, __) => Image.asset(
                        assetName,
                        height: 28,
                      )),
        ));
  }
}
