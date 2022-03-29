import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:animated_styled_widget/animated_styled_widget.dart';
import 'package:decorated_icon/decorated_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:responsive_property/responsive_property.dart';
import 'package:very_good_slide_puzzle/audio_control/audio_control.dart';
import 'package:very_good_slide_puzzle/game_config/game_config.dart';
import 'package:very_good_slide_puzzle/l10n/l10n.dart';
import 'package:very_good_slide_puzzle/layout/layout.dart';
import 'package:very_good_slide_puzzle/puzzle/bloc/puzzle_bloc.dart';
import 'package:very_good_slide_puzzle/simple/simple.dart';
import 'package:very_good_slide_puzzle/theme/theme.dart';
import 'package:very_good_slide_puzzle/models/models.dart';
import 'package:very_good_slide_puzzle/helpers/helpers.dart';
import "package:flutter_linkify/flutter_linkify.dart";
import 'package:url_launcher/url_launcher.dart';

/// {@template audio_control}
/// Displays and allows to update the current locale of the puzzle.
/// {@endtemplate}
class SettingsControl extends StatefulWidget {
  /// {@macro audio_control}
  const SettingsControl({Key? key}) : super(key: key);

  @override
  State<SettingsControl> createState() => _SettingsControlState();
}

class _SettingsControlState extends State<SettingsControl> {
  @override
  Widget build(BuildContext context) {
    final theme = context.select((ThemeBloc bloc) => bloc.state.theme);

    final state = context.select((PuzzleBloc bloc) => bloc.state);

    double timeDilation = context.getTimeDilation();

    return GestureDetector(
        onTap: state.isAutoSolving ? null : () {
          showAlignedDialog(
              duration: PuzzleThemeAnimationDuration.backgroundColorChange
                  .dilate(timeDilation),
              transitionsBuilder: (BuildContext context,
                  Animation<double> animation,
                  Animation<double> secondaryAnimation,
                  Widget child) {
                return SlideTransition(
                  ///TODO: add different slide transtion for each theme
                  position: Tween<Offset>(
                    begin: Offset.zero,
                    end: Offset.zero,
                  ).animate(CurvedAnimation(
                    parent: animation,
                    curve: Curves.easeInOut,
                  )),
                  child: FadeTransition(
                    opacity: CurvedAnimation(
                      parent: animation,
                      curve: Curves.easeInOut,
                    ),
                    child: child,
                  ),
                );
              },
              context: context,
              builder: (_) {
                return MultiBlocProvider(
                    providers: [
                      BlocProvider.value(
                        value: context.read<ThemeBloc>(),
                      ),
                      BlocProvider.value(
                        value: context.read<AudioControlBloc>(),
                      ),
                      BlocProvider.value(
                        value: context.read<PuzzleBloc>(),
                      ),
                    ],
                    child: ResponsiveLayoutBuilder(
                      small: (context, _) {
                        final theme = context
                            .select((ThemeBloc bloc) => bloc.state.theme);

                        List<Shadow>? _iconShadow =
                            theme.menuActiveStyle.shadows;

                        return Stack(
                          alignment: Alignment.center,
                          children: [
                            AnimatedStyledContainer(
                              duration: PuzzleThemeAnimationDuration
                                  .backgroundColorChange
                                  .dilate(context.getTimeDilation()),
                              curve: Curves.easeInOut,
                              style: theme.backgroundStyle.resolve(context)!
                                ..childAlignment = Alignment.center,
                              child: _buildAllControls(context),
                            ),
                            Positioned(
                              top: 36,
                              right: 30,
                              child: MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: DecoratedIcon(
                                      Icons.close,
                                      size: 24,
                                      color: theme.menuActiveStyle.color,
                                      shadows: _iconShadow
                                          ?.map((e) => Shadow(
                                              color: e.color,
                                              offset: e.offset,
                                              blurRadius: e.blurRadius))
                                          .toList(),
                                    ),
                                  )),
                            )
                          ],
                        );
                      },
                      medium: (context, _) => _buildAllControls(context),
                      large: (context, _) => _buildAllControls(context),
                    ));
              },
              followerAnchor: Alignment.topRight,
              targetAnchor: Alignment.bottomCenter,
              avoidOverflow: true,
              offset: const Offset(0, 4),
              barrierColor: Colors.transparent);
        },
        child: MouseRegion(
            cursor: state.isAutoSolving ? SystemMouseCursors.forbidden : SystemMouseCursors.click,
            child: AnimatedSwitcher(
              duration: PuzzleThemeAnimationDuration.backgroundColorChange
                  .dilate(context.getTimeDilation()),
              child: DecoratedIcon(
                Icons.menu,
                size: Responsive({
                      smallScreen: 24.0,
                      middleScreen: 30.0,
                      largeScreen: 32.0,
                    }).resolve(context) ??
                    32.0,
                color: !state.isAutoSolving
                    ? theme.menuActiveStyle.color
                    : theme.menuInactiveStyle.color,
                shadows: !state.isAutoSolving
                    ? theme.menuActiveStyle.shadows
                        ?.map((e) => Shadow(
                            color: e.color,
                            offset: e.offset,
                            blurRadius: e.blurRadius))
                        .toList()
                    : theme.menuInactiveStyle.shadows
                        ?.map((e) => Shadow(
                            color: e.color,
                            offset: e.offset,
                            blurRadius: e.blurRadius))
                        .toList(),
              ),
            )),
      );
  }

  Widget _buildAudioControl(BuildContext context) {
    final theme = context.select((ThemeBloc bloc) => bloc.state.theme);

    final double volume = context.read<AudioControlBloc>().state.volume;

    return AnimatedStyledContainer(
        duration: PuzzleThemeAnimationDuration.backgroundColorChange
            .dilate(context.getTimeDilation()),
        curve: Curves.easeInOut,
        style: theme.popupMenuTileStyle.resolve(context) ?? Style(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedStyledContainer(
                duration: PuzzleThemeAnimationDuration.backgroundColorChange
                    .dilate(context.getTimeDilation()),
                curve: Curves.easeInOut,
                style: theme.popupMenuTitleStyle.resolve(context)!,
                child: Builder(
                  builder: (context) => Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(context.l10n.soundControl),
                      const Gap(10),
                      const AudioControl(),
                    ],
                  ),
                )),
            StyledSlider(
                direction: Axis.horizontal,
                value: volume,
                max: 1,
                min: 0,
                onChanged: (value) => context
                    .read<AudioControlBloc>()
                    .add(VolumeChanged(volume: value)),
                trackStyle: theme.popupMenuSliderTrackStyle.resolve(context)!,
                activeTrackStyle:
                    theme.popupMenuSliderActiveTrackStyle.resolve(context),
                thumbStyle: theme.popupMenuSliderThumbStyle.resolve(context)!,
                thumbHoveredStyle:
                    theme.popupMenuSliderThumbHoverStyle.resolve(context),
                thumbPressedStyle:
                    theme.popupMenuSliderThumbPressedStyle.resolve(context),
                isTrackContained: theme.isPopupMenuSliderThumbContained),
          ],
        ));
  }

  Widget _buildTimeDilationControl(BuildContext context) {
    final theme = context.select((ThemeBloc bloc) => bloc.state.theme);

    final double timeDilation = context.read<ThemeBloc>().state.timeDilation;

    return AnimatedStyledContainer(
        duration: PuzzleThemeAnimationDuration.backgroundColorChange
            .dilate(context.getTimeDilation()),
        curve: Curves.easeInOut,
        style: theme.popupMenuTileStyle.resolve(context) ?? Style(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedStyledContainer(
                duration: PuzzleThemeAnimationDuration.backgroundColorChange
                    .dilate(context.getTimeDilation()),
                curve: Curves.easeInOut,
                style: theme.popupMenuTitleStyle.resolve(context)!,
                child: Builder(
                  builder: (context) => Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(context.l10n.slowmoControl),
                      const Gap(2),
                      AnimatedDefaultTextStyle(
                          style: theme.popupMenuButtonStyle
                                  .resolve(context)
                                  ?.textStyle
                                  ?.toTextStyle(
                                      screenSize: MediaQuery.of(context).size,
                                      parentFontSize:
                                          DefaultTextStyle.of(context)
                                                  .style
                                                  .fontSize ??
                                              14.0) ??
                              const TextStyle(),
                          duration: PuzzleThemeAnimationDuration.textStyle
                              .dilate(context.getTimeDilation()),
                          child: Text(
                            " × " + timeDilation.toString(),
                          ))
                    ],
                  ),
                )),
            StyledSlider(
                direction: Axis.horizontal,
                value: timeDilation,
                max: 5,
                min: 0.5,
                divisions: 9,
                label: timeDilation.toString(),
                toolTipStyle: Style(),
                onChanged: (value) =>
                    context.read<ThemeBloc>().add(ThemeSetTimeDilation(value)),
                trackStyle: theme.popupMenuSliderTrackStyle.resolve(context)!,
                activeTrackStyle:
                    theme.popupMenuSliderActiveTrackStyle.resolve(context),
                thumbStyle: theme.popupMenuSliderThumbStyle.resolve(context)!,
                thumbHoveredStyle:
                    theme.popupMenuSliderThumbHoverStyle.resolve(context),
                thumbPressedStyle:
                    theme.popupMenuSliderThumbPressedStyle.resolve(context),
                isTrackContained: theme.isPopupMenuSliderThumbContained),
          ],
        ));
  }

  Widget _buildLocaleControl(BuildContext context) {
    final theme = context.select((ThemeBloc bloc) => bloc.state.theme);

    return AnimatedStyledContainer(
        duration: PuzzleThemeAnimationDuration.backgroundColorChange
            .dilate(context.getTimeDilation()),
        curve: Curves.easeInOut,
        style: theme.popupMenuTileStyle.resolve(context) ?? Style(),
        child: const LocaleSelectList());
  }

  Widget _buildSizeControl(BuildContext context) {
    final theme = context.select((ThemeBloc bloc) => bloc.state.theme);
    return AnimatedStyledContainer(
      duration: PuzzleThemeAnimationDuration.backgroundColorChange
          .dilate(context.getTimeDilation()),
      curve: Curves.easeInOut,
      style: theme.popupMenuTileStyle.resolve(context) ?? Style(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedStyledContainer(
              duration: PuzzleThemeAnimationDuration.backgroundColorChange
                  .dilate(context.getTimeDilation()),
              curve: Curves.easeInOut,
              style: theme.popupMenuTitleStyle.resolve(context)!,
              child: Text(context.l10n.sizeControl)),
          const Gap(2),
          const SimplePuzzleSizeSelectButton(size: PuzzleSize(3, 3)),
          const SimplePuzzleSizeSelectButton(size: PuzzleSize(4, 4)),
          const SimplePuzzleSizeSelectButton(size: PuzzleSize(5, 5)),
          const SimplePuzzleSizeSelectButton(size: PuzzleSize(3, 4)),
          const SimplePuzzleSizeSelectButton(size: PuzzleSize(3, 5)),
          const SimplePuzzleSizeSelectButton(size: PuzzleSize(4, 3)),
          const SimplePuzzleSizeSelectButton(size: PuzzleSize(4, 5)),
          const SimplePuzzleSizeSelectButton(size: PuzzleSize(5, 3)),
          const SimplePuzzleSizeSelectButton(size: PuzzleSize(5, 4)),
        ],
      ),
    );
  }

  Widget _buildDifficultyControl(BuildContext context) {
    final theme = context.select((ThemeBloc bloc) => bloc.state.theme);

    return AnimatedStyledContainer(
        duration: PuzzleThemeAnimationDuration.backgroundColorChange
            .dilate(context.getTimeDilation()),
        curve: Curves.easeInOut,
        style: theme.popupMenuTileStyle.resolve(context) ?? Style(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedStyledContainer(
                duration: PuzzleThemeAnimationDuration.backgroundColorChange
                    .dilate(context.getTimeDilation()),
                curve: Curves.easeInOut,
                style: theme.popupMenuTitleStyle.resolve(context)!,
                child: Text(context.l10n.difficultyControl)),
            const Gap(2),
            const SimplePuzzleDifficultySelectButton(
                difficulty: PuzzleDifficulty.easy),
            const SimplePuzzleDifficultySelectButton(
                difficulty: PuzzleDifficulty.medium),
            const SimplePuzzleDifficultySelectButton(
                difficulty: PuzzleDifficulty.hard),
          ],
        ));
  }

  Widget _buildBrightnessControl(BuildContext context) {
    final theme = context.select((ThemeBloc bloc) => bloc.state.theme);

    List<Shadow>? _iconShadow = theme.menuActiveStyle.shadows;

    bool isDark = (theme as SimpleTheme).luminance == ThemeLuminance.dark;

    return theme.luminance != null
        ? AnimatedStyledContainer(
            duration: PuzzleThemeAnimationDuration.backgroundColorChange
                .dilate(context.getTimeDilation()),
            curve: Curves.easeInOut,
            style: theme.popupMenuTileStyle.resolve(context) ?? Style(),
            child: Row(
              children: [
                AnimatedStyledContainer(
                    duration: PuzzleThemeAnimationDuration.backgroundColorChange
                        .dilate(context.getTimeDilation()),
                    curve: Curves.easeInOut,
                    style: theme.popupMenuTitleStyle.resolve(context)!,
                    child:
                        Text(isDark ? context.l10n.dark : context.l10n.light)),
                const Gap(2),
                Expanded(
                  child: Center(
                      child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () {
                        context.read<ThemeBloc>().add(ThemeUpdated(
                            theme: theme.copyWith(
                                luminance: isDark
                                    ? ThemeLuminance.light
                                    : ThemeLuminance.dark)));
                      },
                      child: DecoratedIcon(
                        isDark ? Icons.dark_mode : Icons.light_mode,
                        size: 16,
                        color: theme.menuActiveStyle.color,
                        shadows: _iconShadow
                            ?.map((e) => Shadow(
                                color: e.color,
                                offset: e.offset,
                                blurRadius: e.blurRadius))
                            .toList(),
                      ),
                    ),
                  )),
                ),
              ],
            ))
        : Container();
  }

  Widget _buildAllControls(BuildContext context) {
    final theme = context.select((ThemeBloc bloc) => bloc.state.theme);

    return SingleChildScrollView(
      clipBehavior: Clip.none,
      child: AnimatedStyledContainer(
        duration: PuzzleThemeAnimationDuration.backgroundColorChange
            .dilate(context.getTimeDilation()),
        curve: Curves.easeInOut,
        style: theme.popupMenuStyle.resolve(context) ?? Style(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildAudioControl(context),
            _buildTimeDilationControl(context),
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      _buildSizeControl(context),
                      _buildInfoButton(context),
                    ],
                  ),
                ),
                const Gap(10),
                Expanded(
                    child: Column(
                  children: [
                    _buildLocaleControl(context),
                    _buildDifficultyControl(context),
                    _buildBrightnessControl(context),
                  ],
                )),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHowToPlay(BuildContext context) {
    final theme = context.select((ThemeBloc bloc) => bloc.state.theme);
    return AnimatedStyledContainer(
      duration: PuzzleThemeAnimationDuration.backgroundColorChange
          .dilate(context.getTimeDilation()),
      curve: Curves.easeInOut,
      style: theme.popupMenuTileStyle.resolve(context) ?? Style(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedStyledContainer(
              duration: PuzzleThemeAnimationDuration.backgroundColorChange
                  .dilate(context.getTimeDilation()),
              curve: Curves.easeInOut,
              style: theme.popupMenuTitleStyle.resolve(context)!,
              child: Text(context.l10n.howToPlayTitle)),
          const Gap(4),
          SelectableText(
            context.l10n.howToPlay,
            style: theme.popupMenuButtonStyle
                .resolve(context)
                ?.textStyle
                ?.toTextStyle(
                    screenSize: MediaQuery.of(context).size, parentFontSize: 14)
                .copyWith(fontSize: 14),
          )
        ],
      ),
    );
  }

  Widget _buildLicense(BuildContext context) {
    final theme = context.select((ThemeBloc bloc) => bloc.state.theme);
    return AnimatedStyledContainer(
      duration: PuzzleThemeAnimationDuration.backgroundColorChange
          .dilate(context.getTimeDilation()),
      curve: Curves.easeInOut,
      style: theme.popupMenuTileStyle.resolve(context) ?? Style(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedStyledContainer(
              duration: PuzzleThemeAnimationDuration.backgroundColorChange
                  .dilate(context.getTimeDilation()),
              curve: Curves.easeInOut,
              style: theme.popupMenuTitleStyle.resolve(context)!,
              child: Text(context.l10n.licenseTitle)),
          const Gap(4),
          SelectableLinkify(
            text: context.l10n.license,
            style: theme.popupMenuButtonStyle
                .resolve(context)
                ?.textStyle
                ?.toTextStyle(
                    screenSize: MediaQuery.of(context).size, parentFontSize: 14)
                .copyWith(fontSize: 14),
            onOpen: (link) async {
              if (await canLaunch(link.url)) {
                await launch(link.url);
              } else {
                throw 'Could not launch $link';
              }
            },
          )
        ],
      ),
    );
  }

  Widget _buildInfo(BuildContext context) {
    final theme = context.select((ThemeBloc bloc) => bloc.state.theme);

    return SingleChildScrollView(
      clipBehavior: Clip.none,
      child: AnimatedStyledContainer(
        duration: PuzzleThemeAnimationDuration.backgroundColorChange
            .dilate(context.getTimeDilation()),
        curve: Curves.easeInOut,
        style: theme.popupMenuStyle.resolve(context) ?? Style(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildHowToPlay(context),
            _buildLicense(context),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoButton(BuildContext context) {
    final theme = context.select((ThemeBloc bloc) => bloc.state.theme);
    List<Shadow>? _iconShadow = theme.menuActiveStyle.shadows;

    return AnimatedStyledContainer(
        duration: PuzzleThemeAnimationDuration.backgroundColorChange
            .dilate(context.getTimeDilation()),
        curve: Curves.easeInOut,
        style: theme.popupMenuTileStyle.resolve(context) ?? Style(),
        child: Row(
          children: [
            AnimatedStyledContainer(
                duration: PuzzleThemeAnimationDuration.backgroundColorChange
                    .dilate(context.getTimeDilation()),
                curve: Curves.easeInOut,
                style: theme.popupMenuTitleStyle.resolve(context)!,
                child: Text(context.l10n.help)),
            const Gap(2),
            Expanded(
              child: Center(
                  child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
                    showAlignedDialog(
                        duration:
                            PuzzleThemeAnimationDuration.backgroundColorChange,
                        transitionsBuilder: (BuildContext context,
                            Animation<double> animation,
                            Animation<double> secondaryAnimation,
                            Widget child) {
                          return SlideTransition(
                            ///TODO: add different slide transtion for each theme
                            position: Tween<Offset>(
                              begin: Offset.zero,
                              end: Offset.zero,
                            ).animate(CurvedAnimation(
                              parent: animation,
                              curve: Curves.easeInOut,
                            )),
                            child: FadeTransition(
                              opacity: CurvedAnimation(
                                parent: animation,
                                curve: Curves.easeInOut,
                              ),
                              child: child,
                            ),
                          );
                        },
                        context: context,
                        builder: (_) {
                          return MultiBlocProvider(
                              providers: [
                                BlocProvider.value(
                                  value: context.read<ThemeBloc>(),
                                ),
                                BlocProvider.value(
                                  value: context.read<AudioControlBloc>(),
                                ),
                                BlocProvider.value(
                                  value: context.read<PuzzleBloc>(),
                                ),
                              ],
                              child: ResponsiveLayoutBuilder(
                                small: (context, _) {
                                  final theme = context.select(
                                      (ThemeBloc bloc) => bloc.state.theme);

                                  List<Shadow>? _iconShadow =
                                      theme.menuActiveStyle.shadows;

                                  return Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      AnimatedStyledContainer(
                                        duration: PuzzleThemeAnimationDuration
                                            .backgroundColorChange
                                            .dilate(context.getTimeDilation()),
                                        curve: Curves.easeInOut,
                                        style: theme.backgroundStyle
                                            .resolve(context)!
                                          ..childAlignment = Alignment.center,
                                        child: _buildInfo(context),
                                      ),
                                      Positioned(
                                        top: 36,
                                        right: 30,
                                        child: MouseRegion(
                                            cursor: SystemMouseCursors.click,
                                            child: GestureDetector(
                                              onTap: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: DecoratedIcon(
                                                Icons.close,
                                                size: 24,
                                                color:
                                                    theme.menuActiveStyle.color,
                                                shadows: _iconShadow
                                                    ?.map((e) => Shadow(
                                                        color: e.color,
                                                        offset: e.offset,
                                                        blurRadius:
                                                            e.blurRadius))
                                                    .toList(),
                                              ),
                                            )),
                                      )
                                    ],
                                  );
                                },
                                medium: (context, _) {
                                  return _buildInfo(context);
                                },
                                large: (context, _) {
                                  return _buildInfo(context);
                                },
                              ));
                        },
                        isGlobal: true,
                        avoidOverflow: true,
                        barrierColor: Colors.transparent);
                  },
                  child: DecoratedIcon(
                    Icons.help_outline,
                    size: 16,
                    color: theme.menuActiveStyle.color,
                    shadows: _iconShadow
                        ?.map((e) => Shadow(
                            color: e.color,
                            offset: e.offset,
                            blurRadius: e.blurRadius))
                        .toList(),
                  ),
                ),
              )),
            ),
          ],
        ));
  }
}
