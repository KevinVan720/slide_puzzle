import 'package:animated_styled_widget/animated_styled_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:very_good_slide_puzzle/theme/theme.dart';
import 'package:very_good_slide_puzzle/typography/typography.dart';

/// {@template puzzle_button}
/// Displays the puzzle action button.
/// {@endtemplate}
class PuzzleButton extends StatelessWidget {
  /// {@macro puzzle_button}
  const PuzzleButton({
    Key? key,
    required this.child,
    required this.onPressed,
  }) : super(key: key);

  /// Called when this button is tapped.
  final VoidCallback? onPressed;

  /// The label of this button.
  final Widget child;

  @override
  Widget build(BuildContext context) {
    var theme = context.select((ThemeBloc bloc) => bloc.state.theme);

    ///the puzzle shuffle button gets the same style as the tiles buttons, except for the size.
    Style buttonStyle = theme.buttonStyle.resolve(context) ?? Style()
      ..width = null
      ..height = null
      ..padding = const EdgeInsets.symmetric(vertical: 15, horizontal: 5);
    Style hoverStyle = theme.hoverStyle.resolve(context) ?? Style()
      ..width = null
      ..height = null
      ..padding = const EdgeInsets.symmetric(vertical: 15, horizontal: 5);
    Style pressedStyle = theme.pressedStyle.resolve(context) ?? Style()
      ..width = null
      ..height = null
      ..padding = const EdgeInsets.symmetric(vertical: 15, horizontal: 5);

    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 160),
      child: StyledButton(
          key: UniqueKey(),
          curve: Curves.easeInOut,
          style: buttonStyle,
          hoveredStyle: hoverStyle,
          pressedStyle: pressedStyle,
          duration: PuzzleThemeAnimationDuration.puzzleTileScale,
          onPressed: onPressed,
          child: Builder(
            builder: (context) {
              return AnimatedDefaultTextStyle(
                duration: PuzzleThemeAnimationDuration.textStyle,
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
