import 'package:animated_styled_widget/animated_styled_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:very_good_slide_puzzle/theme/theme.dart';
import 'package:very_good_slide_puzzle/typography/typography.dart';
import 'package:very_good_slide_puzzle/helpers/helpers.dart';

import 'dart:async';

import 'package:just_audio/just_audio.dart';
import 'package:very_good_slide_puzzle/audio_control/audio_control.dart';

import 'package:very_good_slide_puzzle/helpers/audio_player.dart';

/// {@template puzzle_button}
/// Displays the puzzle action button.
/// {@endtemplate}
///
class PuzzleButton extends StatefulWidget {
  const PuzzleButton({
    required this.child,
    required this.onPressed,
    Key? key,
    AudioPlayerFactory? audioPlayer,
  })  : _audioPlayerFactory = audioPlayer ?? getAudioPlayer,
        super(key: key);

  /// Called when this button is tapped.
  final VoidCallback? onPressed;

  /// The label of this button.
  final Widget child;

  final AudioPlayerFactory _audioPlayerFactory;

  @override
  _PuzzleButtonState createState() => _PuzzleButtonState();
}

class _PuzzleButtonState extends State<PuzzleButton> {
  AudioPlayer? _audioPlayer;
  late final Timer _timer;

  @override
  void initState() {
    super.initState();

    // Delay the initialization of the audio player for performance reasons,
    // to avoid dropping frames when the theme is changed.
    _timer = Timer(const Duration(milliseconds: 500), () {
      _audioPlayer = widget._audioPlayerFactory();
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _audioPlayer?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var theme = context.select((ThemeBloc bloc) => bloc.state.theme);

    ///the puzzle shuffle button gets the same style as the tiles buttons, except for the size and padding.
    Style buttonStyle = theme.buttonStyle.resolve(context) ??
        (theme.tileStyle.resolve(context) ?? Style()
          ..width = null
          ..height = null
          ..padding = const EdgeInsets.symmetric(vertical: 15, horizontal: 5));
    Style hoverStyle = theme.buttonHoverStyle.resolve(context) ??
        (theme.tileHoverStyle.resolve(context) ?? Style()
          ..width = null
          ..height = null
          ..padding = const EdgeInsets.symmetric(vertical: 15, horizontal: 5));
    Style pressedStyle = theme.buttonPressedStyle.resolve(context) ??
        (theme.tilePressedStyle.resolve(context) ?? Style()
          ..width = null
          ..height = null
          ..padding = const EdgeInsets.symmetric(vertical: 15, horizontal: 5));

    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 160),
      child: AudioControlListener(
          audioPlayer: _audioPlayer,
          child: StyledButton(
              curve: Curves.easeInOut,
              style: buttonStyle,
              hoveredStyle: hoverStyle,
              pressedStyle: pressedStyle,
              duration: PuzzleThemeAnimationDuration.puzzleTileScale
                  .dilate(context.getTimeDilation()),
              onPressed: widget.onPressed == null
                  ? null
                  : () async {
                      if (AudioPlayerExtension.isPlatformSupported) {
                        final duration = await _audioPlayer?.setAsset(
                          theme.tilePressSoundAsset,
                        );
                        unawaited(_audioPlayer?.replay());
                      }
                      widget.onPressed!();
                    },
              child: Builder(
                builder: (context) {
                  return AnimatedDefaultTextStyle(
                    duration: PuzzleThemeAnimationDuration.textStyle
                        .dilate(context.getTimeDilation()),
                    style: DefaultTextStyle.of(context)
                        .style
                        .merge(PuzzleTextStyle.headline5),
                    child: widget.child,
                  );
                },
              ))),
    );
  }
}

class PuzzleAnimatedContainer extends StatelessWidget {
  const PuzzleAnimatedContainer(
      {Key? key, required this.child, required this.style})
      : super(key: key);

  final Widget child;
  final Style style;

  @override
  Widget build(BuildContext context) {
    ///the puzzle shuffle button gets the same style as the tiles buttons, except for the size and padding.

    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 160),
      child: AnimatedStyledContainer(
          style: style,
          curve: Curves.easeInOut,
          duration: PuzzleThemeAnimationDuration.puzzleTileScale
              .dilate(context.getTimeDilation()),
          child: Builder(
            builder: (context) {
              return AnimatedDefaultTextStyle(
                duration: PuzzleThemeAnimationDuration.textStyle
                    .dilate(context.getTimeDilation()),
                style: DefaultTextStyle.of(context)
                    .style
                    .merge(PuzzleTextStyle.headline5),
                child: child,
              );
            },
          )),
    );
  }
}
