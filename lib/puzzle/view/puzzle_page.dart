import 'dart:math';

import 'package:animated_styled_widget/animated_styled_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:very_good_slide_puzzle/audio_control/audio_control.dart';
import 'package:very_good_slide_puzzle/game_config/bloc/game_config_bloc.dart';
import 'package:very_good_slide_puzzle/l10n/l10n.dart';
import 'package:very_good_slide_puzzle/layout/layout.dart';
import 'package:very_good_slide_puzzle/models/models.dart';
import 'package:very_good_slide_puzzle/puzzle/puzzle.dart';
import 'package:very_good_slide_puzzle/simple/simple.dart';
import 'package:very_good_slide_puzzle/theme/theme.dart';
import 'package:very_good_slide_puzzle/timer/timer.dart';
import 'package:very_good_slide_puzzle/typography/typography.dart';
import 'package:very_good_slide_puzzle/helpers/helpers.dart';
import 'package:sticky_headers/sticky_headers.dart';

import 'package:responsive_property/responsive_property.dart';

/// {@template puzzle_page}
/// The root page of the puzzle UI.
///
/// Builds the puzzle based on the current [PuzzleTheme]
/// from [ThemeBloc].
/// {@endtemplate}
class PuzzleGamePage extends StatelessWidget {
  /// {@macro puzzle_page}
  const PuzzleGamePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final gameConfigBloc = context.select((GameConfigBloc bloc) => bloc);
    final themeBloc=context.select((ThemeBloc bloc) => bloc);
    final audioControlBloc=context.select((AudioControlBloc bloc) => bloc);

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => TimerBloc(
            ticker: const Ticker(),
          ),
        ),
        BlocProvider(
          create: (context) => PuzzleBloc(gameConfigBloc, themeBloc, audioControlBloc, random: Random())
            ..add(
              const PuzzleInitialized(
                shufflePuzzle: true,
              ),
            ),
        ),
      ],
      child: const PuzzleView(),
    );
  }
}

class PuzzleView extends StatefulWidget {
  const PuzzleView({Key? key}) : super(key: key);

  @override
  _PuzzleViewState createState() => _PuzzleViewState();
}

class _PuzzleViewState extends State<PuzzleView> {
  bool isSameTheme = false;

  @override
  Widget build(BuildContext context) {
    final theme = context.select((ThemeBloc bloc) => bloc.state.theme);

    Widget background;

    ///When switching themes, the duration is kept the same
    ///When the same theme animate periodically, the scale is multiplied additionally.
    background = BlocListener<ThemeBloc, ThemeState>(
      listenWhen: (previousState, state) {
        isSameTheme = state.theme == previousState.theme;
        return !mapEquals(state.theme.name, previousState.theme.name);
      },
      listener: (context, state) {},
      child: StreamBuilder(
          stream: Stream.periodic(
              PuzzleThemeAnimationDuration.backgroundColorChange
                  .dilate(theme.backgroundAnimationPeriodScale), (count) {
            isSameTheme = true;
          }),
          builder: (context, snapshot) => AnimatedStyledContainer(
                curve: Curves.easeInOut,
                duration: PuzzleThemeAnimationDuration.backgroundColorChange
                    .dilate((isSameTheme
                        ? theme.backgroundAnimationScale
                        : context.getTimeDilation() * 1)),
                style: (theme.backgroundStyle.resolve(context) ?? Style())
                  ..textStyle = null,
                child: Container(),
              )),
    );

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            background,
            const _Puzzle(
              key: Key('puzzle_view_puzzle'),
            )
          ],
        ),
      ),
    );
  }
}

class _Puzzle extends StatelessWidget {
  const _Puzzle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = context.select((ThemeBloc bloc) => bloc.state.theme);
    final state = context.select((PuzzleBloc bloc) => bloc.state);

    return LayoutBuilder(
      builder: (context, constraints) {
        return Stack(
          children: [
            theme.layoutDelegate.backgroundBuilder(state),
            SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: Column(
                  children: [
                    StickyHeaderBuilder(
                      builder: (context, stuckAmount) {
                        return Stack(
                          alignment: Alignment.center,
                          children: [
                            AnimatedStyledContainer(
                              duration: PuzzleThemeAnimationDuration
                                  .backgroundColorChange
                                  .dilate(context.getTimeDilation()),
                              style: (theme
                                      .appBarStyle(stuckAmount)
                                      .resolve(context) ??
                                  Style()),
                              child: SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  height: Responsive({
                                        smallScreen: 48.0,
                                        middleScreen: 50.0,
                                        largeScreen: 52.0
                                      }).resolve(context) ??
                                      52.0),
                            ),
                            const PuzzleHeader()
                          ],
                        );
                      },
                      content: const PuzzleSections(),
                    )
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

/// {@template puzzle_header}
/// Displays the header of the puzzle.
/// {@endtemplate}
@visibleForTesting
class PuzzleHeader extends StatelessWidget {
  /// {@macro puzzle_header}
  const PuzzleHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayoutBuilder(
      small: (context, child) => Stack(
        alignment: Alignment.center,
        children: [
          const Align(
            alignment: Alignment.center,
            child: PuzzleLogo(),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  SettingsControl(),
                ],
              ),
            ),
          ),
        ],
      ),
      medium: (context, child) => Stack(
        alignment: Alignment.center,
        children: [
          const Align(
            alignment: Alignment.center,
            child: PuzzleLogo(),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  SettingsControl(),
                ],
              ),
            ),
          ),
        ],
      ),
      large: (context, child) => Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            PuzzleLogo(),
            PuzzleMenu(),
          ],
        ),
      ),
    );
  }
}

/// {@template puzzle_logo}
/// Displays the logo of the puzzle.
/// {@endtemplate}
@visibleForTesting
class PuzzleLogo extends StatelessWidget {
  /// {@macro puzzle_logo}
  const PuzzleLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppFlutterLogo(
      key: puzzleLogoKey,
    );
  }
}

/// {@template puzzle_sections}
/// Displays start and end sections of the puzzle.
/// {@endtemplate}
class PuzzleSections extends StatelessWidget {
  /// {@macro puzzle_sections}
  const PuzzleSections({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = context.select((ThemeBloc bloc) => bloc.state.theme);
    final state = context.select((PuzzleBloc bloc) => bloc.state);

    return ResponsiveLayoutBuilder(
      small: (context, child) => Column(
        children: [
          const PuzzleMenu(),
          theme.layoutDelegate.startSectionBuilder(state),
          const PuzzleBoard(),
          theme.layoutDelegate.endSectionBuilder(state),
        ],
      ),
      medium: (context, child) => Column(
        children: [
          const PuzzleMenu(),
          theme.layoutDelegate.startSectionBuilder(state),
          const PuzzleBoard(),
          theme.layoutDelegate.endSectionBuilder(state),
        ],
      ),
      large: (context, child) => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            flex: 1,
            child: theme.layoutDelegate.startSectionBuilder(state),
          ),
          const PuzzleBoard(),
          Flexible(
            flex: 1,
            child: theme.layoutDelegate.endSectionBuilder(state),
          ),
        ],
      ),
    );
  }
}

/// {@template puzzle_board}
/// Displays the board of the puzzle.
/// {@endtemplate}
@visibleForTesting
class PuzzleBoard extends StatelessWidget {
  /// {@macro puzzle_board}
  const PuzzleBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = context.select((ThemeBloc bloc) => bloc.state.theme);
    final puzzle = context.select((PuzzleBloc bloc) => bloc.state.puzzle);

    final size = puzzle.getDimension();
    if (size == const PuzzleSize(0, 0) || puzzle.tiles.isEmpty) {
      return const CircularProgressIndicator();
    }

    var board = BlocListener<PuzzleBloc, PuzzleState>(
      listener: (context, state) {
        if (theme.hasTimer && state.puzzleStatus == PuzzleStatus.complete) {
          context.read<TimerBloc>().add(const TimerStopped());
        }
      },
      child: theme.layoutDelegate.boardBuilder(
        size,
        puzzle.tiles
            .map(
              (tile) => _PuzzleTile(
                key: Key('puzzle_tile_${tile.value.toString()}'),
                tile: tile,
              ),
            )
            .toList(),
      ),
    );

    if (context.select((PuzzleBloc bloc) => bloc.state).isAutoSolving) {
      return board;
    } else {
      return PuzzleKeyboardHandler(
        child: board,
      );
    }
  }
}

class _PuzzleTile extends StatelessWidget {
  const _PuzzleTile({
    Key? key,
    required this.tile,
  }) : super(key: key);

  /// The tile to be displayed.
  final Tile tile;

  @override
  Widget build(BuildContext context) {
    final theme = context.select((ThemeBloc bloc) => bloc.state.theme);
    final state = context.select((PuzzleBloc bloc) => bloc.state);

    return tile.isWhitespace
        ? theme.layoutDelegate.whitespaceTileBuilder()
        : theme.layoutDelegate.tileBuilder(tile, state);
  }
}

/// {@template puzzle_menu}
/// Displays the menu of the puzzle.
/// {@endtemplate}
@visibleForTesting
class PuzzleMenu extends StatefulWidget {
  /// {@macro puzzle_menu}
  const PuzzleMenu({Key? key}) : super(key: key);

  @override
  State<PuzzleMenu> createState() => _PuzzleMenuState();
}

class _PuzzleMenuState extends State<PuzzleMenu> {
  @override
  Widget build(BuildContext context) {
    final themes = context.select((ThemeBloc bloc) => bloc.state.themes);

    return ResponsiveLayoutBuilder(
        small: (context, child) => Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Wrap(
                alignment: WrapAlignment.center,
                runAlignment: WrapAlignment.center,
                children: List.generate(
                  themes.length,
                  (index) => PuzzleMenuItem(
                    theme: themes[index],
                    themeIndex: index,
                  ),
                ),
              ),
            ),
        medium: (context, child) => Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Wrap(
                alignment: WrapAlignment.center,
                runAlignment: WrapAlignment.center,
                children: [
                  ...List.generate(
                    themes.length,
                    (index) => PuzzleMenuItem(
                      theme: themes[index],
                      themeIndex: index,
                    ),
                  ),
                ],
              ),
            ),
        large: (context, child) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                  themes.length,
                  (index) => PuzzleMenuItem(
                    theme: themes[index],
                    themeIndex: index,
                  ),
                ),
                const Gap(40),
                const SettingsControl(),
                //LocaleControl(
                //  key: localeControlKey,
                //)
              ],
            ));
  }
}

/// {@template puzzle_menu_item}
/// Displays the menu item of the [PuzzleMenu].
/// {@endtemplate}
@visibleForTesting
class PuzzleMenuItem extends StatelessWidget {
  /// {@macro puzzle_menu_item}
  const PuzzleMenuItem({
    Key? key,
    required this.theme,
    required this.themeIndex,
  }) : super(key: key);

  /// The theme corresponding to this menu item.
  final PuzzleTheme theme;

  /// The index of [theme] in [ThemeState.themes].
  final int themeIndex;

  @override
  Widget build(BuildContext context) {
    final currentTheme = context.select((ThemeBloc bloc) => bloc.state.theme);
    final locale = context.select((LocaleBloc bloc) => bloc.state.locale);
    final isCurrentTheme = mapEquals(theme.name, currentTheme.name);

    return ResponsiveLayoutBuilder(
      small: (_, child) => Column(
        children: [
          Container(
            //width: MediaQuery.of(context).size.width / 3,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            height: 36,
            decoration: isCurrentTheme
                ? BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        width: 2,
                        color: currentTheme.menuUnderlineColor,
                      ),
                    ),
                  )
                : null,
            child: child,
          ),
        ],
      ),
      medium: (_, child) => Column(
        children: [
          Container(
            //width: 100,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            height: 40,
            decoration: isCurrentTheme
                ? BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        width: currentTheme.menuUnderlineColor ==
                                Colors.transparent
                            ? 0
                            : 2,
                        color: currentTheme.menuUnderlineColor,
                      ),
                    ),
                  )
                : null,
            child: child,
          ),
        ],
      ),
      large: (_, child) =>
          Padding(padding: const EdgeInsets.only(left: 24), child: child!),
      child: (currentSize) {
        return TextButton(
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
          ).copyWith(
            overlayColor: MaterialStateProperty.all(Colors.transparent),
          ),
          onPressed: () {
            // Ignore if this theme is already selected.
            if (theme == currentTheme) {
              return;
            }

            // Update the currently selected theme.
            context.read<ThemeBloc>().add(ThemeChanged(themeIndex: themeIndex));

            // Reset the timer of the currently running puzzle.
            context.read<TimerBloc>().add(const TimerReset());
          },
          child: AnimatedDefaultTextStyle(
            duration: PuzzleThemeAnimationDuration.textStyle,
            style: (isCurrentTheme
                    ? currentTheme.menuActiveStyle
                    : currentTheme.menuInactiveStyle)
                .toTextStyle(
                    screenSize: MediaQuery.of(context).size,
                    parentFontSize:
                        DefaultTextStyle.of(context).style.fontSize ?? 14.0)
                .merge(Responsive({
                  smallScreen: PuzzleTextStyle.bodyXSmall,
                  middleScreen: PuzzleTextStyle.headline5,
                  largeScreen: PuzzleTextStyle.headline5
                }).resolve(context)),
            child: Text(
              theme.name[locale] ?? "",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        );
      },
    );
  }
}

/// The global key of [PuzzleLogo].
///
/// Used to animate the transition of [PuzzleLogo] when changing a theme.
final puzzleLogoKey = GlobalKey(debugLabel: 'puzzle_logo');

/// The global key of [PuzzleName].
///
/// Used to animate the transition of [PuzzleName] when changing a theme.
final puzzleNameKey = GlobalKey(debugLabel: 'puzzle_name');

/// The global key of [PuzzleTitle].
///
/// Used to animate the transition of [PuzzleTitle] when changing a theme.
final puzzleTitleKey = GlobalKey(debugLabel: 'puzzle_title');

/// The global key of [NumberOfMovesAndTilesLeft].
///
/// Used to animate the transition of [NumberOfMovesAndTilesLeft]
/// when changing a theme.
final numberOfMovesAndTilesLeftKey =
    GlobalKey(debugLabel: 'number_of_moves_and_tiles_left');

/// The global key of [AudioControl].
///
/// Used to animate the transition of [AudioControl]
/// when changing a theme.
final audioControlKey = GlobalKey(debugLabel: 'audio_control');

/// The global key of [AudioControl].
///
/// Used to animate the transition of [AudioControl]
/// when changing a theme.
final localeControlKey = GlobalKey(debugLabel: 'locale_control');
