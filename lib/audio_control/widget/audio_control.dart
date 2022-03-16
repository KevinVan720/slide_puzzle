import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:very_good_slide_puzzle/audio_control/audio_control.dart';
import 'package:very_good_slide_puzzle/layout/layout.dart';
import 'package:very_good_slide_puzzle/theme/theme.dart';
import 'package:decorated_icon/decorated_icon.dart';
import 'package:very_good_slide_puzzle/helpers/helpers.dart';

/// {@template audio_control}
/// Displays and allows to update the current audio status of the puzzle.
/// {@endtemplate}
class AudioControl extends StatelessWidget {
  /// {@macro audio_control}
  const AudioControl({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = context.select((ThemeBloc bloc) => bloc.state.theme);
    final audioMuted =
        context.select((AudioControlBloc bloc) => bloc.state.muted);

    List<Shadow>? _iconShadow = audioMuted
        ? theme.menuInactiveStyle.shadows
        : theme.menuActiveStyle.shadows;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => context.read<AudioControlBloc>().add(AudioToggled()),
        child: AnimatedSwitcher(
          duration: PuzzleThemeAnimationDuration.backgroundColorChange
              .dilate(context.getTimeDilation()),
          child: ResponsiveLayoutBuilder(
            small: (_, __) => DecoratedIcon(
              audioMuted ? Icons.volume_off : Icons.volume_up,
              size: 16,
              color: audioMuted
                  ? theme.menuInactiveStyle.color
                  : theme.menuActiveStyle.color,
              shadows: _iconShadow
                  ?.map((e) => Shadow(
                      color: e.color,
                      offset: e.offset,
                      blurRadius: e.blurRadius))
                  .toList(),
            ),
            medium: (_, __) => DecoratedIcon(
              audioMuted ? Icons.volume_off : Icons.volume_up,
              size: 16,
              color: audioMuted
                  ? theme.menuInactiveStyle.color
                  : theme.menuActiveStyle.color,
              shadows: _iconShadow
                  ?.map((e) => Shadow(
                      color: e.color,
                      offset: e.offset,
                      blurRadius: e.blurRadius))
                  .toList(),
            ),
            large: (_, __) => DecoratedIcon(
              audioMuted ? Icons.volume_off : Icons.volume_up,
              size: 16,
              color: audioMuted
                  ? theme.menuInactiveStyle.color
                  : theme.menuActiveStyle.color,
              shadows: _iconShadow
                  ?.map((e) => Shadow(
                      color: e.color,
                      offset: e.offset,
                      blurRadius: e.blurRadius))
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}
