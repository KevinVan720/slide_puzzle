import 'dart:math';

import 'package:animated_styled_widget/animated_styled_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localized_locales/flutter_localized_locales.dart';
import 'package:very_good_slide_puzzle/audio_control/audio_control.dart';
import 'package:very_good_slide_puzzle/l10n/l10n.dart';
import 'package:very_good_slide_puzzle/puzzle/bloc/puzzle_bloc.dart';
import 'package:very_good_slide_puzzle/theme/theme.dart';
import 'package:very_good_slide_puzzle/layout/layout.dart';
import 'package:very_good_slide_puzzle/typography/text_styles.dart';
import 'package:decorated_icon/decorated_icon.dart';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:very_good_slide_puzzle/game_config/game_config.dart';

import 'package:responsive_property/responsive_property.dart';
import 'package:very_good_slide_puzzle/simple/simple.dart';
import 'package:animated_styled_widget/src/styled_components/styled_plain_container.dart';

import 'package:gap/gap.dart';
import 'package:very_good_slide_puzzle/l10n/l10n.dart';

/// {@template audio_control}
/// Displays and allows to update the current locale of the puzzle.
/// {@endtemplate}
class SettingsControl extends StatelessWidget {
  /// {@macro audio_control}
  const SettingsControl({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = context.select((ThemeBloc bloc) => bloc.state.theme);

    List<Shadow>? _iconShadow = theme.menuActiveStyle.shadows;

    return GestureDetector(
      onTap: () {
        showAlignedDialog(
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
                    small: (context, _) => Stack(
                      alignment: Alignment.center,
                      children: [
                        StyledContainer(
                          style: theme.backgroundStyle.resolve(context)!
                            ..childAlignment = Alignment.center,
                          child: _buildAllControls(context),
                        ),
                        Positioned(
                          top: 36,
                          right: 30,
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
                          ),
                        )
                      ],
                    ),
                    medium: (context, _) => Stack(
                      alignment: Alignment.center,
                      children: [
                        StyledContainer(
                          style: theme.backgroundStyle.resolve(context)!
                            ..childAlignment = Alignment.center,
                          child: _buildAllControls(context),
                        ),
                        Positioned(
                          top: 32,
                          right: 30,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: DecoratedIcon(
                              Icons.close,
                              size: 32,
                              color: theme.menuActiveStyle.color,
                              shadows: _iconShadow
                                  ?.map((e) => Shadow(
                                      color: e.color,
                                      offset: e.offset,
                                      blurRadius: e.blurRadius))
                                  .toList(),
                            ),
                          ),
                        )
                      ],
                    ),
                    large: (context, _) => _buildAllControls(context),
                  ));
            },
            followerAnchor: Alignment.topRight,
            targetAnchor: Alignment.bottomRight,
            avoidOverflow: true,
            offset: const Offset(-2, 4),
            barrierColor: Colors.transparent);
      },
      child: AnimatedSwitcher(
        duration: PuzzleThemeAnimationDuration.backgroundColorChange,
        child: ResponsiveLayoutBuilder(
          small: (_, __) => DecoratedIcon(
            Icons.settings,
            size: 24,
            color: theme.menuActiveStyle.color,
            shadows: _iconShadow
                ?.map((e) => Shadow(
                    color: e.color, offset: e.offset, blurRadius: e.blurRadius))
                .toList(),
          ),
          medium: (_, __) => DecoratedIcon(
            Icons.settings,
            size: 32,
            color: theme.menuActiveStyle.color,
            shadows: _iconShadow
                ?.map((e) => Shadow(
                    color: e.color, offset: e.offset, blurRadius: e.blurRadius))
                .toList(),
          ),
          large: (_, __) => DecoratedIcon(
            Icons.settings,
            size: 36,
            color: theme.menuActiveStyle.color,
            shadows: _iconShadow
                ?.map((e) => Shadow(
                    color: e.color, offset: e.offset, blurRadius: e.blurRadius))
                .toList(),
          ),
        ),
      ),
    );
  }

  Widget _buildAudioControl(BuildContext context) {
    final theme = context.select((ThemeBloc bloc) => bloc.state.theme);

    final double volume = context.read<AudioControlBloc>().state.volume;

    return StyledContainer(
        style: theme.popupMenuTileStyle.resolve(context) ?? Style(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            StyledContainer(
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

  Widget _buildLocaleControl(BuildContext context) {
    final theme = context.select((ThemeBloc bloc) => bloc.state.theme);

    return StyledContainer(
        style: theme.popupMenuTileStyle.resolve(context) ?? Style(),
        child: const LocaleSelectList());
  }

  Widget _buildSizeControl(BuildContext context) {
    final theme = context.select((ThemeBloc bloc) => bloc.state.theme);
    return StyledContainer(
      style: theme.popupMenuTileStyle.resolve(context) ?? Style(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          StyledContainer(
              style: theme.popupMenuTitleStyle.resolve(context)!,
              child: Text(context.l10n.sizeControl)),
          const Gap(2),
          const SimplePuzzleSizeSelectButton(size: 3),
          const SimplePuzzleSizeSelectButton(size: 4),
          const SimplePuzzleSizeSelectButton(size: 5),
        ],
      ),
    );
  }

  Widget _buildDifficultyControl(BuildContext context) {
    final theme = context.select((ThemeBloc bloc) => bloc.state.theme);

    return StyledContainer(
        style: theme.popupMenuTileStyle.resolve(context) ?? Style(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            StyledContainer(
                style: theme.popupMenuTitleStyle.resolve(context)!,
                child: Text(context.l10n.difficultyControl)),
            const Gap(2),
            const SimplePuzzleDifficultySelectButton(
                difficulty: PuzzleDifficulty.easy),
            const SimplePuzzleDifficultySelectButton(
                difficulty: PuzzleDifficulty.hard),
          ],
        ));
  }

  Widget _buildAllControls(BuildContext context) {
    final theme = context.select((ThemeBloc bloc) => bloc.state.theme);

    return StyledContainer(
      style: theme.popupMenuStyle.resolve(context) ?? Style(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildAudioControl(context),
          _buildLocaleControl(context),
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: _buildSizeControl(context),
              ),
              const Gap(10),
              Expanded(child: _buildDifficultyControl(context)),
            ],
          ),
        ],
      ),
    );
  }
}
