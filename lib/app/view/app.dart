// Copyright (c) 2021, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

// ignore_for_file: public_member_api_docs, avoid_print

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_localized_locales/flutter_localized_locales.dart';
import 'package:http/http.dart' as http;
import 'package:very_good_slide_puzzle/helpers/helpers.dart';
import 'package:very_good_slide_puzzle/l10n/l10n.dart';
import 'package:very_good_slide_puzzle/puzzle/puzzle.dart';
import 'package:very_good_slide_puzzle/game_config/game_config.dart';
import 'package:very_good_slide_puzzle/models/models.dart';

class App extends StatefulWidget {
  const App({Key? key, ValueGetter<PlatformHelper>? platformHelperFactory})
      : _platformHelperFactory = platformHelperFactory ?? getPlatformHelper,
        super(key: key);

  final ValueGetter<PlatformHelper> _platformHelperFactory;

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  /// The path to local assets folder.
  static const localAssetsPrefix = 'assets/';

  static final audioAssets = [
    'assets/audio/click.mp3',
    'assets/audio/tile_move.mp3',
    'assets/audio/material_click.mp3',
    'assets/audio/neu_click.mp3',
    'assets/audio/clay_click.mp3',
    'assets/audio/neon_click.mp3',
    'assets/audio/keyboard_click.mp3',
    'assets/audio/wood_click.mp3',
  ];

  static final imageAssets = [
    'assets/images/logo_flutter_color.png',
    'assets/images/logo_flutter_white.png',
    'assets/images/simple_dash_small.png',
    'assets/images/wood_grain.png',
    'assets/images/wood_background.jpg',
    'assets/images/win11.jpg',
    'assets/images/win11_dark.jpg',
    ...[1, 2, 3, 4, 5, 6, 7, 8]
        .map((e) => "assets/images/mojave_day_" + e.toString() + ".jpg"),
    ...[1, 2, 3, 4, 5, 6, 7, 8]
        .map((e) => "assets/images/mojave_night_" + e.toString() + ".jpg")
  ];

  late final PlatformHelper _platformHelper;
  late final Timer _timer;

  @override
  void initState() {
    super.initState();

    _platformHelper = widget._platformHelperFactory();

    _timer = Timer(const Duration(milliseconds: 100), () {
      for (final imageAsset in imageAssets) {
        precacheImage(
          Image.asset(imageAsset).image,
          context,
        );
      }

      for (final audioAsset in audioAssets) {
        prefetchToMemory(audioAsset);
      }
    });
  }

  /// Prefetches the given [filePath] to memory.
  Future<void> prefetchToMemory(String filePath) async {
    if (_platformHelper.isWeb) {
      // We rely on browser caching here. Once the browser downloads the file,
      // the native implementation should be able to access it from cache.
      await http.get(Uri.parse('$localAssetsPrefix$filePath'));
      return;
    }
    throw UnimplementedError(
      'The function `prefetchToMemory` is not implemented '
      'for platforms other than Web.',
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(
        create: (context) => LocaleBloc(),
      ),
      BlocProvider(
        create: (_) =>
            GameConfigBloc()..add(const PuzzleSetSize(PuzzleSize(4, 4))),
      )
    ], child: const HomePage());
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localeState = context.select((LocaleBloc bloc) => bloc.state);

    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(color: Color(0xFF13B9FF)),
        colorScheme: ColorScheme.fromSwatch(
          accentColor: const Color(0xFF13B9FF),
        ),
      ),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        LocaleNamesLocalizationsDelegate(),
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      locale: localeState.locale,
      home: const PuzzleGamePage(),
    );
  }
}
