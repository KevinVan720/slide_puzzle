import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:very_good_slide_puzzle/theme/theme.dart';

extension BuildContextExtension on BuildContext {
  /// Replays the current audio.
  double getTimeDilation() {
    return select((ThemeBloc bloc) => bloc.state).timeDilation;
  }
}
