import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:very_good_slide_puzzle/audio_control/audio_control.dart';
import 'package:very_good_slide_puzzle/layout/layout.dart';
import 'package:very_good_slide_puzzle/theme/theme.dart';

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
    final audioAsset =
        audioMuted ? theme.audioControlOffAsset : theme.audioControlOnAsset;


    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => context.read<AudioControlBloc>().add(AudioToggled()),
        child: AnimatedSwitcher(
          duration: PuzzleThemeAnimationDuration.backgroundColorChange,
          child: ResponsiveLayoutBuilder(
            key: Key(audioAsset),
            small: (_, __) => Icon(audioMuted ? Icons.volume_off : Icons.volume_up,size: 24,
                color: audioMuted ? theme.menuInactiveStyle.color : theme.menuActiveStyle.color ,),
            medium: (_, __) => Icon(audioMuted ? Icons.volume_off : Icons.volume_up,size: 33,
              color: audioMuted ? theme.menuInactiveStyle.color : theme.menuActiveStyle.color ,),
            large: (_, __) => Icon(audioMuted ? Icons.volume_off : Icons.volume_up,size: 33,
              color: audioMuted ? theme.menuInactiveStyle.color : theme.menuActiveStyle.color ,),
          ),
        ),
      ),
    );
  }
}
