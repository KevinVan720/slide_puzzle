// ignore_for_file: public_member_api_docs

part of 'theme_bloc.dart';

class ThemeState extends Equatable {
  const ThemeState({
    required this.themes,
    this.theme = const MaterialTheme(),
    this.timeDilation = 1.0,
  });

  /// The list of all available themes.
  final List<PuzzleTheme> themes;

  /// Currently selected theme.
  final PuzzleTheme theme;

  final double timeDilation;

  @override
  List<Object> get props => [themes, theme, timeDilation];

  ThemeState copyWith({
    List<PuzzleTheme>? themes,
    PuzzleTheme? theme,
    double? timeDilation,
  }) {
    return ThemeState(
        themes: themes ?? this.themes,
        theme: theme ?? this.theme,
        timeDilation: timeDilation ?? this.timeDilation);
  }
}
