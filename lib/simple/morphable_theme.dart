import 'dart:ui';

import 'package:animated_styled_widget/animated_styled_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:very_good_slide_puzzle/colors/colors.dart';
import 'package:very_good_slide_puzzle/layout/layout.dart';
import 'package:very_good_slide_puzzle/simple/simple.dart';
import 'package:very_good_slide_puzzle/theme/themes/themes.dart';
import 'package:responsive_property/responsive_property.dart';
import 'package:flutter/material.dart';

/// {@template simple_theme}
/// The simple puzzle theme.
/// {@endtemplate}
class MorphableTheme extends SimpleTheme {
  /// {@macro simple_theme}
  const MorphableTheme({this.shapeIndex = 0,
    this.hoverIndex=0,
    this.pressedIndex=0,
  }) : super();

  final int shapeIndex;
  final int hoverIndex;
  final int pressedIndex;

  @override
  String get name => 'Morphable';

  @override
  bool get hasTimer => false;

  @override
  DynamicTextStyle get nameTextStyle =>
      DynamicTextStyle(color: PuzzleColors.grey1);

  @override
  DynamicTextStyle get titleTextStyle => DynamicTextStyle(color: Colors.green);

  @override
  DynamicTextStyle get defaultTextStyle =>
      DynamicTextStyle(color: PuzzleColors.primary7);

  @override
  Responsive<Style> get backgroundStyle => Responsive({
        allScreen: Style(
          backgroundDecoration: BoxDecoration(
              color: Colors.redAccent),
        ),

      });

  @override
  Responsive<Style> get buttonStyle => Responsive({
        smallScreen: morphableBaseStyle.copyWith(
          width: 72.0.toPXLength,
          height: 72.0.toPXLength,
          shapeBorder: presetShapeList[shapeIndex],
        ),
        middleScreen: morphableBaseStyle.copyWith(
          width: 100.0.toPXLength,
          height: 100.0.toPXLength,
          shapeBorder: presetShapeList[shapeIndex],
        ),
        largeScreen: morphableBaseStyle.copyWith(
          width: 112.0.toPXLength,
          height: 112.0.toPXLength,
          shapeBorder: presetShapeList[shapeIndex],
        )
      });

  @override
  Responsive<Style> get hoverStyle => Responsive({
        smallScreen: morphableBaseStyle.copyWith(
          width: 72.0.toPXLength,
          height: 72.0.toPXLength,
          shapeBorder: presetShapeList[hoverIndex],
        ),
        middleScreen: morphableBaseStyle.copyWith(
          width: 100.0.toPXLength,
          height: 100.0.toPXLength,
          shapeBorder: presetShapeList[hoverIndex],
        ),
        largeScreen: morphableBaseStyle.copyWith(
          width: 112.0.toPXLength,
          height: 112.0.toPXLength,
          shapeBorder: presetShapeList[hoverIndex],
        )
      });

  @override
  Responsive<Style> get pressedStyle => Responsive({
        smallScreen: morphableBaseStyle.copyWith(
          width: 72.0.toPXLength,
          height: 72.0.toPXLength,
          shapeBorder: presetShapeList[pressedIndex],
        ),
        middleScreen: morphableBaseStyle.copyWith(
          width: 100.0.toPXLength,
          height: 100.0.toPXLength,
          shapeBorder: presetShapeList[pressedIndex],
        ),
        largeScreen: morphableBaseStyle.copyWith(
          width: 112.0.toPXLength,
          height: 112.0.toPXLength,
          shapeBorder: presetShapeList[pressedIndex],
        )
      });

  @override
  bool get isLogoColored => true;

  @override
  Color get menuActiveColor => PuzzleColors.grey1;

  @override
  Color get menuUnderlineColor => PuzzleColors.primary6;

  @override
  Color get menuInactiveColor => PuzzleColors.grey2;

  @override
  String get audioControlOnAsset => 'assets/images/audio_control/simple_on.png';

  @override
  String get audioControlOffAsset =>
      'assets/images/audio_control/simple_off.png';

  @override
  PuzzleLayoutDelegate get layoutDelegate => const SimplePuzzleLayoutDelegate();

  @override
  List<Object?> get props => [
        name,
        audioControlOnAsset,
        audioControlOffAsset,
        hasTimer,
        nameTextStyle,
        titleTextStyle,
        backgroundStyle,
        defaultTextStyle,
        buttonStyle,
        hoverStyle,
        pressedStyle,
        isLogoColored,
        menuActiveColor,
        menuUnderlineColor,
        menuInactiveColor,
        layoutDelegate,
      ];
}

final morphableBaseStyle = Style(
    alignment: Alignment.center,
    backgroundDecoration: BoxDecoration(color: Colors.green),
    transformAlignment: Alignment.center,
    childAlignment: Alignment.center);

const Map<String, MorphableShapeBorder> presetShapeMap = {
  "Circle": const CircleShapeBorder(),
  "RectangleAll0": const RoundedRectangleShapeBorder(
      borderRadius: DynamicBorderRadius.all(DynamicRadius.zero)),
  "RoundRectangleAll10": const RoundedRectangleShapeBorder(
      borderRadius: DynamicBorderRadius.all(const DynamicRadius.circular(
          const Length(10, unit: LengthUnit.percent)))),
  "RoundRectangleAll25": const RoundedRectangleShapeBorder(
      borderRadius: DynamicBorderRadius.all(const DynamicRadius.circular(
          const Length(25, unit: LengthUnit.percent)))),
  "RoundRectangleTLBR25": const RoundedRectangleShapeBorder(
      borderRadius: DynamicBorderRadius.only(
          topLeft: const DynamicRadius.circular(
              const Length(25, unit: LengthUnit.percent)),
          bottomRight: const DynamicRadius.circular(
              const Length(25, unit: LengthUnit.percent)))),
  "RoundRectangleTRBL25": const RoundedRectangleShapeBorder(
      borderRadius: DynamicBorderRadius.only(
          topRight: const DynamicRadius.circular(
              const Length(25, unit: LengthUnit.percent)),
          bottomLeft: const DynamicRadius.circular(
              const Length(25, unit: LengthUnit.percent)))),
  "RoundRectangleTL50BL50BR50": const RoundedRectangleShapeBorder(
      borderRadius: DynamicBorderRadius.only(
          topLeft: const DynamicRadius.circular(
              const Length(50, unit: LengthUnit.percent)),
          bottomLeft: const DynamicRadius.circular(
              const Length(50, unit: LengthUnit.percent)),
          bottomRight: const DynamicRadius.circular(
              const Length(50, unit: LengthUnit.percent)))),
  "RoundRectangleTL50BL50TR50": const RoundedRectangleShapeBorder(
      borderRadius: DynamicBorderRadius.only(
          topLeft: const DynamicRadius.circular(
              const Length(50, unit: LengthUnit.percent)),
          bottomLeft: const DynamicRadius.circular(
              const Length(50, unit: LengthUnit.percent)),
          topRight: const DynamicRadius.circular(
              const Length(50, unit: LengthUnit.percent)))),
  "RoundAll25": const RectangleShapeBorder(
      cornerStyles: RectangleCornerStyles.all(CornerStyle.rounded),
      borderRadius: DynamicBorderRadius.all(const DynamicRadius.circular(
          const Length(25, unit: LengthUnit.percent)))),
  "CutCornerAll25": const RectangleShapeBorder(
      cornerStyles: RectangleCornerStyles.all(CornerStyle.straight),
      borderRadius: DynamicBorderRadius.all(const DynamicRadius.circular(
          const Length(25, unit: LengthUnit.percent)))),
  "CutoutCornerAll25": const RectangleShapeBorder(
      cornerStyles: RectangleCornerStyles.all(CornerStyle.cutout),
      borderRadius: DynamicBorderRadius.all(const DynamicRadius.circular(
          const Length(25, unit: LengthUnit.percent)))),
  "ConcaveCornerAll25": const RectangleShapeBorder(
      cornerStyles: RectangleCornerStyles.all(CornerStyle.concave),
      borderRadius: DynamicBorderRadius.all(const DynamicRadius.circular(
          const Length(25, unit: LengthUnit.percent)))),
  "DiagonalBottomRight": const RectangleShapeBorder(
      cornerStyles:
      RectangleCornerStyles.only(bottomRight: CornerStyle.straight),
      borderRadius: DynamicBorderRadius.only(
          bottomRight: const DynamicRadius.elliptical(
              Length(100, unit: LengthUnit.percent),
              Length(25, unit: LengthUnit.percent)))),
  "DiagonalBottomLeft": const RectangleShapeBorder(
      cornerStyles:
      RectangleCornerStyles.only(bottomLeft: CornerStyle.straight),
      borderRadius: DynamicBorderRadius.only(
          bottomLeft: const DynamicRadius.elliptical(
              Length(100, unit: LengthUnit.percent),
              Length(25, unit: LengthUnit.percent)))),
  "ChevronLeft": const RectangleShapeBorder(
      cornerStyles: RectangleCornerStyles.only(
          bottomLeft: CornerStyle.straight, topLeft: CornerStyle.straight),
      borderRadius: DynamicBorderRadius.only(
          topLeft: const DynamicRadius.circular(
              Length(50, unit: LengthUnit.percent)),
          bottomLeft: const DynamicRadius.circular(
              Length(50, unit: LengthUnit.percent)))),
  "ChevronRight": const RectangleShapeBorder(
      cornerStyles: RectangleCornerStyles.only(
          bottomRight: CornerStyle.straight, topRight: CornerStyle.straight),
      borderRadius: DynamicBorderRadius.only(
          topRight: const DynamicRadius.circular(
              Length(50, unit: LengthUnit.percent)),
          bottomRight: const DynamicRadius.circular(
              Length(50, unit: LengthUnit.percent)))),
  "Diamond": const RectangleShapeBorder(
      cornerStyles: RectangleCornerStyles.all(CornerStyle.straight),
      borderRadius: DynamicBorderRadius.all(
          const DynamicRadius.circular(Length(50, unit: LengthUnit.percent)))),
  "ArcTL": const RectangleShapeBorder(
      borderRadius: DynamicBorderRadius.only(
          topLeft: const DynamicRadius.circular(
              Length(100, unit: LengthUnit.percent)))),
  "ArcBR": const RectangleShapeBorder(
      borderRadius: DynamicBorderRadius.only(
          bottomRight: const DynamicRadius.circular(
              Length(100, unit: LengthUnit.percent)))),
  "DonutTL": const RectangleShapeBorder(
      cornerStyles:
      RectangleCornerStyles.only(bottomRight: CornerStyle.concave),
      borderRadius: DynamicBorderRadius.only(
          topLeft: const DynamicRadius.circular(
              Length(100, unit: LengthUnit.percent)),
          bottomRight: const DynamicRadius.circular(
              Length(50, unit: LengthUnit.percent)))),
  "Polygon5": const PolygonShapeBorder(sides: 5),
  "Polygon6": const PolygonShapeBorder(sides: 6),
  "Polygon8": const PolygonShapeBorder(sides: 8),
  "Polygon12": const PolygonShapeBorder(sides: 12),
  "Polygon5Rounded": const PolygonShapeBorder(
      sides: 5, cornerRadius: Length(50, unit: LengthUnit.percent)),
  "Polygon6Rounded": const PolygonShapeBorder(
      sides: 6, cornerRadius: Length(50, unit: LengthUnit.percent)),
  "Polygon8Rounded": const PolygonShapeBorder(
      sides: 8, cornerRadius: Length(50, unit: LengthUnit.percent)),
  "Polygon6Straight": const PolygonShapeBorder(
      cornerStyle: CornerStyle.straight,
      sides: 6,
      cornerRadius: Length(50, unit: LengthUnit.percent)),
  "Polygon6Cutout": const PolygonShapeBorder(
      cornerStyle: CornerStyle.cutout,
      sides: 6,
      cornerRadius: Length(50, unit: LengthUnit.percent)),
  "Polygon6Concave": const PolygonShapeBorder(
      cornerStyle: CornerStyle.concave,
      sides: 6,
      cornerRadius: Length(50, unit: LengthUnit.percent)),
  "Star4": const StarShapeBorder(corners: 4),
  "Star5": const StarShapeBorder(corners: 5),
  "Star6": const StarShapeBorder(corners: 6),
  "Star8": const StarShapeBorder(corners: 8),
  "Star12": const StarShapeBorder(corners: 12),
  "Star4Rounded": const StarShapeBorder(
      corners: 4,
      cornerRadius: Length(50, unit: LengthUnit.percent),
      insetRadius: Length(50, unit: LengthUnit.percent)),
  "Star6Rounded": const StarShapeBorder(
      corners: 6,
      cornerRadius: Length(30, unit: LengthUnit.percent),
      insetRadius: Length(30, unit: LengthUnit.percent)),
  "Star8Rounded": const StarShapeBorder(
      corners: 8,
      cornerRadius: Length(10, unit: LengthUnit.percent),
      insetRadius: Length(10, unit: LengthUnit.percent)),
  "BubbleTop": const BubbleShapeBorder(
      side: ShapeSide.top, borderRadius: Length(20, unit: LengthUnit.percent)),
  "BubbleBottom": const BubbleShapeBorder(
      side: ShapeSide.bottom,
      borderRadius: Length(20, unit: LengthUnit.percent)),
  "BubbleLeft": const BubbleShapeBorder(
      side: ShapeSide.left, borderRadius: Length(20, unit: LengthUnit.percent)),
  "BubbleRight": const BubbleShapeBorder(
      side: ShapeSide.right,
      borderRadius: Length(20, unit: LengthUnit.percent)),
  "ArcTop": const ArcShapeBorder(
      side: ShapeSide.top, arcHeight: Length(20, unit: LengthUnit.percent)),
  "ArcBottom": const ArcShapeBorder(
      side: ShapeSide.bottom, arcHeight: Length(20, unit: LengthUnit.percent)),
  "ArrowRight": const ArrowShapeBorder(),
  "ArrowLeft": const ArrowShapeBorder(side: ShapeSide.left),
  "Trapezoid": const TrapezoidShapeBorder(),
  "TrapezoidBottom": const TrapezoidShapeBorder(side: ShapeSide.top),
};

List<MorphableShapeBorder> presetShapeList=presetShapeMap.values.toList();
