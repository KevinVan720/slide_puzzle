import 'package:animated_styled_widget/animated_styled_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:very_good_slide_puzzle/colors/colors.dart';
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
    this.backgroundColor,
    this.textColor,
  }) : super(key: key);

  /// The background color of this button.
  /// Defaults to [PuzzleTheme.buttonColor].
  final Color? backgroundColor;

  /// The text color of this button.
  /// Defaults to [PuzzleColors.white].
  final Color? textColor;

  /// Called when this button is tapped.
  final VoidCallback? onPressed;

  /// The label of this button.
  final Widget child;

  @override
  Widget build(BuildContext context) {
    var theme = context.select((ThemeBloc bloc) => bloc.state.theme);
    //final buttonTextColor = textColor ?? PuzzleColors.white;
    Style buttonStyle = theme.buttonStyle.resolve(context)??Style()..width=null..height=null;
    Style hoverStyle = theme.hoverStyle.resolve(context)??Style()..width=null..height=null;
    Style pressedStyle = theme.pressedStyle.resolve(context)??Style()..width=null..height=null;

    return SizedBox(
      width: 160,
      height: 80,
      child: StyledButton(
        key: UniqueKey(),
        style: buttonStyle,
        hoveredStyle: hoverStyle,
        pressedStyle: pressedStyle,
        //duration: PuzzleThemeAnimationDuration.textStyle,
        onPressed: onPressed,
        child: Builder(builder: (context) {
          return AnimatedDefaultTextStyle(
            duration: PuzzleThemeAnimationDuration.textStyle,
            style: DefaultTextStyle.of(context).style.merge(PuzzleTextStyle.headline5),
            child: child,
          );
        },)
      ));
      /*
      AnimatedTextButton(
        duration: PuzzleThemeAnimationDuration.textStyle,
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          textStyle: PuzzleTextStyle.headline5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
        ).copyWith(
          backgroundColor: MaterialStateProperty.all(buttonBackgroundColor),
          foregroundColor: MaterialStateProperty.all(buttonTextColor),
        ),
        onPressed: onPressed,
        child: child,
      ),
    );*/
  }
}
