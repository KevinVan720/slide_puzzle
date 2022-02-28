/*
import 'package:animated_styled_widget/animated_styled_widget.dart';
import 'package:flutter/material.dart';
import 'package:responsive_property/responsive_property.dart';
import 'package:very_good_slide_puzzle/colors/colors.dart';
import 'package:very_good_slide_puzzle/layout/layout.dart';
import 'package:very_good_slide_puzzle/simple/simple.dart';
import 'dart:math';
import 'dart:ui';

import 'package:animated_styled_widget/animated_styled_widget.dart';

class MorphableTheme extends SimpleTheme {
  /// {@macro simple_theme}
  const MorphableTheme({
    this.shapeIndex = 0,
    this.hoverIndex = 0,
    this.pressedIndex = 0,
  }) : super();

  final int shapeIndex;
  final int hoverIndex;
  final int pressedIndex;

  @override
  Map<Locale, String> get name => {
        const Locale("en"): 'Material',
        const Locale("es"): 'Material',
        const Locale("zh"): "材质"
      };

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
          backgroundDecoration: BoxDecoration(color: Colors.redAccent),
        ),
      });

  @override
  Responsive<Style> get buttonStyle => Responsive({
        smallScreen: morphableBaseStyle.copyWith(
            width: 72.0.toPXLength,
            height: 72.0.toPXLength,
            shapeBorder: buttonShape),
        middleScreen: morphableBaseStyle.copyWith(
            width: 100.0.toPXLength,
            height: 100.0.toPXLength,
            shapeBorder: buttonShape),
        largeScreen: morphableBaseStyle.copyWith(
          width: 112.0.toPXLength,
          height: 112.0.toPXLength,
          shapeBorder: buttonShape,
        )
      });

  @override
  Responsive<Style> get hoverStyle => Responsive({
        smallScreen: morphableBaseStyle.copyWith(
            width: 72.0.toPXLength,
            height: 72.0.toPXLength,
            shapeBorder: hoverShape),
        middleScreen: morphableBaseStyle.copyWith(
            width: 100.0.toPXLength,
            height: 100.0.toPXLength,
            shapeBorder: hoverShape),
        largeScreen: morphableBaseStyle.copyWith(
            width: 112.0.toPXLength,
            height: 112.0.toPXLength,
            shapeBorder: hoverShape)
      });

  @override
  Responsive<Style> get pressedStyle => Responsive({
        smallScreen: morphableBaseStyle.copyWith(
            width: 72.0.toPXLength,
            height: 72.0.toPXLength,
            shapeBorder: pressedShape),
        middleScreen: morphableBaseStyle.copyWith(
          width: 100.0.toPXLength,
          height: 100.0.toPXLength,
          shapeBorder: pressedShape,
        ),
        largeScreen: morphableBaseStyle.copyWith(
            width: 112.0.toPXLength,
            height: 112.0.toPXLength,
            shapeBorder: pressedShape)
      });

  @override
  bool get isLogoColored => true;

  @override
  DynamicTextStyle get menuActiveStyle =>
      DynamicTextStyle(color: PuzzleColors.black, fontWeight: FontWeight.bold);

  @override
  DynamicTextStyle get menuInactiveStyle =>
      DynamicTextStyle(color: PuzzleColors.grey1);

  @override
  Color get menuUnderlineColor => PuzzleColors.primary6;

  @override
  Color get popupMenuBackgroundColor => Colors.grey.shade100;

  @override
  String get audioControlOnAsset => 'assets/images/audio_control/simple_on.png';

  @override
  String get audioControlOffAsset =>
      'assets/images/audio_control/simple_off.png';

  @override
  PuzzleLayoutDelegate get layoutDelegate => const SimplePuzzleLayoutDelegate();
}

final morphableBaseStyle = Style(
  alignment: Alignment.center,
  backgroundDecoration: BoxDecoration(color: Colors.green),
  transformAlignment: Alignment.center,
  childAlignment: Alignment.center,
  textStyle:
      DynamicTextStyle(fontWeight: FontWeight.bold, fontSize: 24.toPXLength),
);

var buttonShape = RoundedRectangleShapeBorder(
    borderRadius: DynamicBorderRadius.all(DynamicRadius.circular(1.toPXLength)),
    borderSides: RectangleBorderSides.only(
        top: DynamicBorderSide(
            gradient: LinearGradient(colors: [
              Colors.cyanAccent.shade100,
              Colors.purpleAccent.shade100
            ]),
            width: 2),
        bottom: const DynamicBorderSide(
            gradient: LinearGradient(colors: [Colors.cyan, Colors.purple]),
            width: 28),
        left: DynamicBorderSide(color: Colors.cyanAccent.shade200, width: 2),
        right: const DynamicBorderSide(color: Colors.purpleAccent, width: 28)));
var hoverShape = const RectangleShapeBorder(
    //cornerStyles: RectangleCornerStyles.all(CornerStyle.straight),
    borderRadius: DynamicBorderRadius.all(DynamicRadius.circular(Length(30))),
    border: DynamicBorderSide(
        width: 5,
        gradient: SweepGradient(startAngle: 2 * 0.33 * pi, colors: [
          Colors.cyan,
          Colors.amberAccent,
          Colors.amberAccent,
          Colors.cyan,
        ])));
var pressedShape = CircleShapeBorder(
    //cornerStyles: RectangleCornerStyles.all(CornerStyle.concave),
    border: DynamicBorderSide(
        width: 5,
        gradient: SweepGradient(startAngle: 2 * 0.67 * pi, colors: [
          Colors.cyan,
          Colors.amberAccent,
          Colors.amberAccent,
          Colors.cyan,
        ])));

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

List<MorphableShapeBorder> presetShapeList = presetShapeMap.values.toList();

List<Map<String, dynamic>> presetPebbles = [
  {
    "type": "Path",
    "border": {
      "color": "ff000000",
      "width": 0,
      "style": "none",
      "strokeCap": "butt",
      "strokeJoin": "miter"
    },
    "path": {
      "size": {"width": 600, "height": 600},
      "nodes": [
        {
          "pos": {"dx": 414.558, "dy": 0},
          "next": {"dx": 463.722, "dy": 0}
        },
        {
          "pos": {"dx": 545.685, "dy": 58.089},
          "prev": {"dx": 510.922, "dy": 20.91},
          "next": {"dx": 580.449, "dy": 95.269}
        },
        {
          "pos": {"dx": 600, "dy": 198.329},
          "prev": {"dx": 600, "dy": 145.749}
        },
        {
          "pos": {"dx": 600, "dy": 240.573},
          "next": {"dx": 600, "dy": 335.862}
        },
        {
          "pos": {"dx": 501.647, "dy": 494.726},
          "prev": {"dx": 564.597, "dy": 427.346},
          "next": {"dx": 438.696, "dy": 562.106}
        },
        {
          "pos": {"dx": 264.2, "dy": 600},
          "prev": {"dx": 353.226, "dy": 600}
        },
        {
          "pos": {"dx": 263.485, "dy": 600},
          "next": {"dx": 193.631, "dy": 600}
        },
        {
          "pos": {"dx": 77.173, "dy": 505.002},
          "prev": {"dx": 126.567, "dy": 565.805},
          "next": {"dx": 27.779, "dy": 444.199}
        },
        {
          "pos": {"dx": 0, "dy": 275.656},
          "prev": {"dx": 0, "dy": 361.645},
          "next": {"dx": 0, "dy": 202.576}
        },
        {
          "pos": {"dx": 118.905, "dy": 80.738},
          "prev": {"dx": 42.801, "dy": 132.414},
          "next": {"dx": 195.009, "dy": 29.062}
        },
        {
          "pos": {"dx": 405.967, "dy": 0},
          "prev": {"dx": 298.339, "dy": 0}
        }
      ]
    }
  },
  {
    "type": "Path",
    "border": {
      "color": "ff000000",
      "width": 0,
      "style": "none",
      "strokeCap": "butt",
      "strokeJoin": "miter"
    },
    "path": {
      "size": {"width": 600, "height": 600},
      "nodes": [
        {
          "pos": {"dx": 300, "dy": 0},
          "prev": {"dx": 220.466, "dy": 0},
          "next": {"dx": 379.534, "dy": 0}
        },
        {
          "pos": {"dx": 512.132, "dy": 87.868},
          "prev": {"dx": 455.893, "dy": 31.629},
          "next": {"dx": 568.371, "dy": 144.107}
        },
        {
          "pos": {"dx": 600, "dy": 300},
          "prev": {"dx": 600, "dy": 220.466}
        },
        {
          "pos": {"dx": 600, "dy": 414.4},
          "next": {"dx": 600, "dy": 464.155}
        },
        {
          "pos": {"dx": 545.707, "dy": 546.757},
          "prev": {"dx": 580.424, "dy": 511.877},
          "next": {"dx": 511.757, "dy": 580.867}
        },
        {
          "pos": {"dx": 418.4, "dy": 600},
          "prev": {"dx": 466.008, "dy": 600}
        },
        {
          "pos": {"dx": 300, "dy": 600},
          "next": {"dx": 220.466, "dy": 600}
        },
        {
          "pos": {"dx": 87.868, "dy": 512.132},
          "prev": {"dx": 144.107, "dy": 568.371},
          "next": {"dx": 31.629, "dy": 455.893}
        },
        {
          "pos": {"dx": 0, "dy": 300},
          "prev": {"dx": 0, "dy": 379.534},
          "next": {"dx": 0, "dy": 220.466}
        },
        {
          "pos": {"dx": 87.868, "dy": 87.868},
          "prev": {"dx": 31.629, "dy": 144.107},
          "next": {"dx": 144.107, "dy": 31.629}
        }
      ]
    }
  },
  {
    "type": "RoundedRectangle",
    "borderRadius": {
      "topLeft": {"x": "507.20001220703125px", "y": "254.39999389648438px"},
      "topRight": {"x": "24.999999999999986%", "y": "74.19999694824226%"},
      "bottomLeft": {"x": "71.86665852864589%", "y": "67.00000508626303%"},
      "bottomRight": {"x": "225.60003662109375px", "y": "217.60003662109375px"}
    },
    "borderSides": {
      "top": {
        "color": "ff000000",
        "width": 0,
        "style": "none",
        "strokeCap": "butt",
        "strokeJoin": "miter"
      },
      "bottom": {
        "color": "ff000000",
        "width": 0,
        "style": "none",
        "strokeCap": "butt",
        "strokeJoin": "miter"
      },
      "left": {
        "color": "ff000000",
        "width": 0,
        "style": "none",
        "strokeCap": "butt",
        "strokeJoin": "miter"
      },
      "right": {
        "color": "ff000000",
        "width": 0,
        "style": "none",
        "strokeCap": "butt",
        "strokeJoin": "miter"
      }
    }
  },
  {
    "type": "Rectangle",
    "border": {
      "color": "ff000000",
      "width": 0,
      "style": "none",
      "strokeCap": "butt",
      "strokeJoin": "miter"
    },
    "borderRadius": {
      "topLeft": {"x": "59.26667277018232%", "y": "55.26666259765622%"},
      "topRight": {"x": "47.399993896484375%", "y": "47.73333485921223%"},
      "bottomLeft": {"x": "82.46665445963546%", "y": "51.399993896484396%"},
      "bottomRight": {"x": "13.066680908203217%", "y": "52.3333333333334%"}
    },
    "cornerStyles": {
      "topLeft": "rounded",
      "bottomLeft": "rounded",
      "topRight": "rounded",
      "bottomRight": "rounded"
    }
  },
  {
    "type": "Rectangle",
    "border": {
      "color": "ff000000",
      "width": 0,
      "style": "none",
      "strokeCap": "butt",
      "strokeJoin": "miter"
    },
    "borderRadius": {
      "topLeft": {"x": "100%", "y": "90.80000813802081%"},
      "topRight": {"x": "270.39996337890625px", "y": "362.3999938964844px"},
      "bottomLeft": {"x": "257.59991455078125px", "y": "254.4000244140625px"},
      "bottomRight": {"x": "50%", "y": "54.66666666666662%"}
    },
    "cornerStyles": {
      "topLeft": "rounded",
      "bottomLeft": "rounded",
      "topRight": "rounded",
      "bottomRight": "rounded"
    }
  }
];

 */
