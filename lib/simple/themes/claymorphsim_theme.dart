import 'package:animated_styled_widget/animated_styled_widget.dart';

import 'package:flutter/material.dart';
import 'package:responsive_property/responsive_property.dart';
import 'package:very_good_slide_puzzle/colors/colors.dart';
import 'package:very_good_slide_puzzle/layout/layout.dart';
import 'package:very_good_slide_puzzle/simple/simple.dart';

/// {@template simple_theme}
/// The simple puzzle theme.
/// {@endtemplate}
class ClaymorphismTheme extends SimpleTheme {
  /// {@macro simple_theme}
  const ClaymorphismTheme() : super();

  @override
  Map<Locale, String> get name => {
        const Locale("en"): 'Claymorphism',
        const Locale("es"): 'Arcillamorfismo',
        const Locale("zh"): "黏土拟物"
      };

  @override
  bool get hasTimer => false;

  @override
  Curve get tileMoveAnimationCurve => Curves.easeInOutBack;

  @override
  Duration get tileMoveAnimationDuration => const Duration(milliseconds: 333);

  @override
  DynamicTextStyle get nameTextStyle =>
      const DynamicTextStyle(color: PuzzleColors.grey1);

  @override
  DynamicTextStyle get titleTextStyle => const DynamicTextStyle(
        color: PuzzleColors.green50,
        fontFamily: "BalooThambi2",
        fontWeight: FontWeight.bold,
      );

  @override
  DynamicTextStyle get defaultTextStyle => DynamicTextStyle(
        color: Colors.blue.shade900,
        fontFamily: "BalooThambi2",
      );

  @override
  Responsive<Style> get backgroundStyle => Responsive({
        allScreen: Style(
          backgroundDecoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                Colors.lightBlue.shade200,
                Colors.lightBlue.shade100,
                Colors.lightBlue.shade50,
                Colors.white,
              ],
                  stops: const [
                0,
                0.15,
                0.3,
                1
              ])),
        )
      });

  @override
  Responsive<Style> get popupMenuStyle => Responsive({
        allScreen: Style(
          width: Dimension.min(240.toPXLength, 90.toPercentLength),
          backgroundDecoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                Colors.lightBlue.shade100,
                Colors.lightBlue.shade50,
                Colors.white,
              ],
                  stops: const [
                0,
                0.3,
                1
              ])),
          shapeBorder: RectangleShapeBorder(
            border: DynamicBorderSide(
                color: Colors.blue.shade500.withOpacity(0.6), width: 0.2),
            borderRadius:
                DynamicBorderRadius.all(DynamicRadius.circular(20.toPXLength)),
          ),
          shadows: [
            ShapeShadow(
                blurRadius: 10,
                spreadRadius: 2,
                color: Colors.blue.shade400.withOpacity(0.5),
                offset: const Offset(4, 4)),
          ],
          insetShadows: [
            ShapeShadow(
                blurRadius: 10,
                color: Colors.white70.withOpacity(0.5),
                offset: const Offset((-3), (-3))),
            ShapeShadow(
                blurRadius: 2,
                spreadRadius: 1,
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: const [
                      0,
                      0.5
                    ],
                    colors: [
                      Colors.lightBlue.shade300.withOpacity(0.5),
                      Colors.lightBlue.shade700.withOpacity(0.5),
                    ]),
                offset: const Offset(-3, -3)),
          ],
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        ),
      });

  @override
  Responsive<Style> get popupMenuButtonStyle => Responsive({
        allScreen: Style(
            alignment: Alignment.center,
            childAlignment: Alignment.center,
            backgroundDecoration:
                BoxDecoration(color: Colors.lightBlue.shade50.withOpacity(0.2)),
            margin: const EdgeInsets.all(2),
            padding: const EdgeInsets.all(4),
            shapeBorder: RectangleShapeBorder(
              borderRadius: DynamicBorderRadius.all(
                  DynamicRadius.circular(25.toPXLength)),
            ),
            textStyle: DynamicTextStyle(
              fontSize: 16.toPXLength,
              letterSpacing: 0.1.toPXLength,
              fontFamily: "BalooThambi2",
              fontWeight: FontWeight.w700,
              color: Colors.blue.shade900,
            ),
            textAlign: TextAlign.center,
            mouseCursor: SystemMouseCursors.click)
      });

  @override
  Responsive<Style> get popupMenuHoverStyle => Responsive({
        allScreen: Style(
            alignment: Alignment.center,
            childAlignment: Alignment.center,
            margin: const EdgeInsets.all(2),
            padding: const EdgeInsets.all(4),
            backgroundDecoration: BoxDecoration(
                color: Colors.lightBlue.shade100.withOpacity(0.25)),
            shapeBorder: RectangleShapeBorder(
              borderRadius: DynamicBorderRadius.all(
                  DynamicRadius.circular(25.toPXLength)),
            ),
            textStyle: DynamicTextStyle(
              fontSize: 16.toPXLength,
              letterSpacing: 0.1.toPXLength,
              fontFamily: "BalooThambi2",
              fontWeight: FontWeight.w700,
              color: Colors.blue.shade900,
            ),
            textAlign: TextAlign.center,
            mouseCursor: SystemMouseCursors.click)
      });

  @override
  Responsive<Style> get popupMenuPressedStyle => Responsive({
        allScreen: Style(
            alignment: Alignment.center,
            childAlignment: Alignment.center,
            margin: const EdgeInsets.all(2),
            padding: const EdgeInsets.all(4),
            backgroundDecoration:
                BoxDecoration(color: Colors.lightBlue.shade100),
            shadows: [
              ShapeShadow(
                  blurRadius: 10,
                  spreadRadius: 2,
                  color: Colors.blue.shade400.withOpacity(0.5),
                  offset: const Offset(4, 4)),
            ],
            insetShadows: [
              ShapeShadow(
                  blurRadius: 10,
                  color: Colors.white70.withOpacity(0.5),
                  offset: const Offset((-3), (-3))),
              ShapeShadow(
                  blurRadius: 2,
                  spreadRadius: 1,
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      stops: const [
                        0,
                        0.5
                      ],
                      colors: [
                        Colors.lightBlue.shade300,
                        Colors.lightBlue.shade700,
                      ]),
                  offset: const Offset(-3, -3)),
            ],
            shapeBorder: RectangleShapeBorder(
              borderRadius: DynamicBorderRadius.all(
                  DynamicRadius.circular(25.toPXLength)),
            ),
            textStyle: DynamicTextStyle(
              fontSize: 16.toPXLength,
              letterSpacing: 0.1.toPXLength,
              fontFamily: "BalooThambi2",
              fontWeight: FontWeight.w700,
              color: Colors.blue.shade900,
            ),
            textAlign: TextAlign.center,
            mouseCursor: SystemMouseCursors.click)
      });

  @override
  Responsive<Style> get popupMenuTitleStyle => Responsive({
        allScreen: Style(
            margin: const EdgeInsets.all(2),
            alignment: Alignment.centerLeft,
            textStyle: DynamicTextStyle(
              letterSpacing: 0.1.toPXLength,
              fontSize: 18.toPXLength,
              fontFamily: "BalooThambi2",
              fontWeight: FontWeight.w700,
              color: Colors.blue.shade900,
            ))
      });

  @override
  Responsive<Style> get popupMenuTileStyle => Responsive({
        allScreen: Style(
          backgroundDecoration: const BoxDecoration(
            color: Colors.transparent,
          ),
          shapeBorder: RectangleShapeBorder(
            border: DynamicBorderSide(
                color: Colors.blue.shade300.withOpacity(0.3), width: 2),
            borderRadius:
                DynamicBorderRadius.all(DynamicRadius.circular(15.toPXLength)),
          ),
          padding: const EdgeInsets.all(5),
          margin: const EdgeInsets.symmetric(vertical: 5),
        )
      });

  @override
  Responsive<Style> get popupMenuSliderThumbStyle => Responsive({
        allScreen: Style(
          shapeBorder: parseMorphableShapeBorder({
            "type": "Rectangle",
            "border": {
              "color": "ff000000",
              "width": 0,
              "style": "none",
              "strokeCap": "butt",
              "strokeJoin": "miter"
            },
            "borderRadius": {
              "topLeft": {"x": "94.5333557128907%", "y": "87.8666610717774%"},
              "topRight": {
                "x": "81.60000610351543%",
                "y": "88.93332926432305%"
              },
              "bottomLeft": {
                "x": "72.40001424153652%",
                "y": "77.33332316080705%"
              },
              "bottomRight": {
                "x": "90.933339436849%",
                "y": "82.26665242513029%"
              }
            },
            "cornerStyles": {
              "topLeft": "rounded",
              "bottomLeft": "rounded",
              "topRight": "rounded",
              "bottomRight": "rounded"
            }
          }),
          backgroundDecoration: BoxDecoration(color: Colors.lightBlue.shade100),
          shadows: [
            ShapeShadow(
                blurRadius: 10,
                spreadRadius: 2,
                color: Colors.blue.shade400.withOpacity(0.5),
                offset: const Offset(4, 4)),
          ],
          insetShadows: [
            ShapeShadow(
                blurRadius: 10,
                color: Colors.white70.withOpacity(0.5),
                offset: const Offset((-3), (-3))),
            ShapeShadow(
                blurRadius: 2,
                spreadRadius: 1,
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: const [
                      0,
                      0.5
                    ],
                    colors: [
                      Colors.lightBlue.shade300,
                      Colors.lightBlue.shade700,
                    ]),
                offset: const Offset(-3, -3)),
          ],
          width: 20.toPXLength,
          height: 20.toPXLength,
        )
      });

  @override
  Responsive<Style> get popupMenuSliderTrackStyle => Responsive({
        allScreen: Style(
          width: 88.toPercentLength,
          height: 4.toPXLength,
          backgroundDecoration: const BoxDecoration(
            color: PuzzleColors.primary8,
          ),
          shapeBorder: RectangleShapeBorder(
            borderRadius:
                DynamicBorderRadius.all(DynamicRadius.circular(2.toPXLength)),
          ),
        )
      });

  @override
  Responsive<Style> get popupMenuSliderActiveTrackStyle => Responsive({
        allScreen: Style(
          height: 10.toPXLength,
          backgroundDecoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Colors.blue.shade800,
            Colors.blue.shade300,
          ])),
          shapeBorder: RectangleShapeBorder(
            borderRadius:
                DynamicBorderRadius.all(DynamicRadius.circular(5.toPXLength)),
          ),
        )
      });

  @override
  bool get isPopupMenuSliderThumbContained => false;

  @override
  Responsive<Style> get buttonStyle => Responsive({
        smallScreen: _baseStyle.copyWith(
          width: _TileDimension.small,
          height: _TileDimension.small,
        ),
        middleScreen: _baseStyle.copyWith(
          width: _TileDimension.medium,
          height: _TileDimension.medium,
        ),
        largeScreen: _baseStyle.copyWith(
          width: _TileDimension.large,
          height: _TileDimension.large,
        )
      });

  @override
  Responsive<Style> get hoverStyle => Responsive({
        smallScreen: _baseStyle.copyWith(
          width: _TileDimension.small,
          height: _TileDimension.small,
          transform: SmoothMatrix4()..scale(0.97),
          shadows: [
            ShapeShadow(
                blurRadius: 6,
                spreadRadius: 2,
                color: Colors.blue.shade400.withOpacity(0.5),
                offset: const Offset(2, 2)),
          ],
        ),
        middleScreen: _baseStyle.copyWith(
          width: _TileDimension.medium,
          height: _TileDimension.medium,
          transform: SmoothMatrix4()..scale(0.97),
          shadows: [
            ShapeShadow(
                blurRadius: 6,
                spreadRadius: 2,
                color: Colors.blue.shade400.withOpacity(0.5),
                offset: const Offset(2, 2)),
          ],
        ),
        largeScreen: _baseStyle.copyWith(
          width: _TileDimension.large,
          height: _TileDimension.large,
          transform: SmoothMatrix4()..scale(0.97),
          shadows: [
            ShapeShadow(
                blurRadius: 6,
                spreadRadius: 2,
                color: Colors.blue.shade400.withOpacity(0.5),
                offset: const Offset(2, 2)),
          ],
        )
      });

  @override
  Responsive<Style> get pressedStyle => Responsive({
        smallScreen: _baseStyle.copyWith(
          width: _TileDimension.small,
          height: _TileDimension.small,
          transform: SmoothMatrix4()..scale(0.94),
          shadows: [
            ShapeShadow(
                blurRadius: 1,
                spreadRadius: 0,
                color: Colors.blue.shade400.withOpacity(0.5),
                offset: const Offset(1, 1)),
          ],
        ),
        middleScreen: _baseStyle.copyWith(
          width: _TileDimension.medium,
          height: _TileDimension.medium,
          transform: SmoothMatrix4()..scale(0.94),
          shadows: [
            ShapeShadow(
                blurRadius: 1,
                spreadRadius: 0,
                color: Colors.blue.shade400.withOpacity(0.5),
                offset: const Offset(1, 1)),
          ],
        ),
        largeScreen: _baseStyle.copyWith(
          width: _TileDimension.large,
          height: _TileDimension.large,
          transform: SmoothMatrix4()..scale(0.94),
          shadows: [
            ShapeShadow(
                blurRadius: 1,
                spreadRadius: 0,
                color: Colors.blue.shade400.withOpacity(0.5),
                offset: const Offset(1, 1)),
          ],
        )
      });

  @override
  bool get isLogoColored => true;

  @override
  DynamicTextStyle get menuActiveStyle => const DynamicTextStyle(
      color: PuzzleColors.black,
      fontWeight: FontWeight.w700,
      fontFamily: "BalooThambi2");

  @override
  Color get menuUnderlineColor => Colors.blue.shade900;

  @override
  DynamicTextStyle get menuInactiveStyle => const DynamicTextStyle(
      color: PuzzleColors.grey2, fontFamily: "BalooThambi2");

  @override
  String get tilePressSoundAsset => "assets/audio/clay_click.mp3";

  @override
  PuzzleLayoutDelegate get layoutDelegate => const SimplePuzzleLayoutDelegate();
}

final _baseStyle = Style(
    alignment: Alignment.center,
    transformAlignment: Alignment.center,
    backgroundDecoration: BoxDecoration(color: Colors.lightBlue.shade100),
    shadows: [
      ShapeShadow(
          blurRadius: 10,
          spreadRadius: 2,
          color: Colors.blue.shade400.withOpacity(0.5),
          offset: const Offset(4, 4)),
    ],
    insetShadows: [
      ShapeShadow(
          blurRadius: 10,
          color: Colors.white70.withOpacity(0.5),
          offset: const Offset((-3), (-3))),
      ShapeShadow(
          blurRadius: 2,
          spreadRadius: 1,
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: const [0, 0.5],
              colors: [Colors.lightBlue.shade300, Colors.lightBlue.shade700]),
          offset: const Offset(-3, -3)),
    ],
    textStyle: DynamicTextStyle(
      letterSpacing: 0.1.toPXLength,
      fontSize: 28.toPXLength,
      fontFamily: "BalooThambi2",
      fontWeight: FontWeight.w700,
      color: Colors.blue.shade900,
    ),
    shapeBorder: parseMorphableShapeBorder({
      "type": "Rectangle",
      "border": {
        "color": "ff000000",
        "width": 0,
        "style": "none",
        "strokeCap": "butt",
        "strokeJoin": "miter"
      },
      "borderRadius": {
        "topLeft": {"x": "94.5333557128907%", "y": "87.8666610717774%"},
        "topRight": {"x": "81.60000610351543%", "y": "88.93332926432305%"},
        "bottomLeft": {"x": "72.40001424153652%", "y": "77.33332316080705%"},
        "bottomRight": {"x": "90.933339436849%", "y": "82.26665242513029%"}
      },
      "cornerStyles": {
        "topLeft": "rounded",
        "bottomLeft": "rounded",
        "topRight": "rounded",
        "bottomRight": "rounded"
      }
    }),
    childAlignment: Alignment.center,
    mouseCursor: SystemMouseCursors.click);

abstract class _TileDimension {
  static Dimension small = Dimension.min(60.0.toPXLength, 100.toPercentLength);
  static Dimension medium =
      Dimension.min(100.0.toPXLength, 100.toPercentLength);
  static Dimension large = Dimension.min(112.0.toPXLength, 100.toPercentLength);
}
