// Copyright 2014 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:math' as math;
import 'dart:ui';

import 'package:flutter/foundation.dart';

import 'package:flutter/painting.dart';

class AuroraDecoration extends Decoration {
  /// Creates a box decoration.
  ///
  /// * If [color] is null, this decoration does not paint a background color.
  /// * If [image] is null, this decoration does not paint a background image.
  /// * If [border] is null, this decoration does not paint a border.
  /// * If [borderRadius] is null, this decoration uses more efficient background
  ///   painting commands. The [borderRadius] argument must be null if [shape] is
  ///   [BoxShape.circle].
  /// * If [boxShadow] is null, this decoration does not paint a shadow.
  /// * If [gradient] is null, this decoration does not paint gradients.
  /// * If [backgroundBlendMode] is null, this decoration paints with [BlendMode.srcOver]
  ///
  /// The [shape] argument must not be null.
  const AuroraDecoration({
    this.color,
    this.border,
    this.borderRadius,
    this.boxShadow,
    this.gradients,
    this.gradientBlurs,
    this.backgroundBlendMode,
    this.shape = BoxShape.rectangle,
  })  : assert(
          backgroundBlendMode == null || color != null || gradients != null,
          "backgroundBlendMode applies to BoxDecoration's background color or "
          'gradient, but no color or gradient was provided.',
        ),
        assert(gradientBlurs == null ||
            (gradients != null && gradientBlurs.length == gradients.length));

  /// Creates a copy of this object but with the given fields replaced with the
  /// new values.
  AuroraDecoration copyWith({
    Color? color,
    BoxBorder? border,
    BorderRadiusGeometry? borderRadius,
    List<BoxShadow>? boxShadow,
    List<Gradient>? gradients,
    BlendMode? backgroundBlendMode,
    BoxShape? shape,
  }) {
    return AuroraDecoration(
      color: color ?? this.color,
      border: border ?? this.border,
      borderRadius: borderRadius ?? this.borderRadius,
      boxShadow: boxShadow ?? this.boxShadow,
      gradients: gradients ?? this.gradients,
      backgroundBlendMode: backgroundBlendMode ?? this.backgroundBlendMode,
      shape: shape ?? this.shape,
    );
  }

  @override
  bool debugAssertIsValid() {
    assert(shape != BoxShape.circle ||
        borderRadius == null); // Can't have a border radius if you're a circle.
    return super.debugAssertIsValid();
  }

  /// A border to draw above the background [color], [gradient], or [image].
  ///
  /// Follows the [shape] and [borderRadius].
  ///
  /// Use [Border] objects to describe borders that do not depend on the reading
  /// direction.
  ///
  /// Use [BoxBorder] objects to describe borders that should flip their left
  /// and right edges based on whether the text is being read left-to-right or
  /// right-to-left.
  final BoxBorder? border;

  /// If non-null, the corners of this box are rounded by this [BorderRadius].
  ///
  /// Applies only to boxes with rectangular shapes; ignored if [shape] is not
  /// [BoxShape.rectangle].
  ///
  /// {@macro flutter.painting.BoxDecoration.clip}
  final BorderRadiusGeometry? borderRadius;

  /// A list of shadows cast by this box behind the box.
  ///
  /// The shadow follows the [shape] of the box.
  ///
  /// See also:
  ///
  ///  * [kElevationToShadow], for some predefined shadows used in Material
  ///    Design.
  ///  * [PhysicalModel], a widget for showing shadows.
  final List<BoxShadow>? boxShadow;

  /// The color to fill in the background of the box.
  ///
  /// The color is filled into the [shape] of the box (e.g., either a rectangle,
  /// potentially with a [borderRadius], or a circle).
  ///
  /// This is ignored if [gradient] is non-null.
  ///
  /// The [color] is drawn under the [image].
  final Color? color;

  /// A gradient to use when filling the box.
  ///
  /// If this is specified, [color] has no effect.
  ///
  /// The [gradient] is drawn under the [image].
  final List<Gradient>? gradients;

  final List<double>? gradientBlurs;

  /// The blend mode applied to the [color] or [gradient] background of the box.
  ///
  /// If no [backgroundBlendMode] is provided then the default painting blend
  /// mode is used.
  ///
  /// If no [color] or [gradient] is provided then the blend mode has no impact.
  final BlendMode? backgroundBlendMode;

  /// The shape to fill the background [color], [gradient], and [image] into and
  /// to cast as the [boxShadow].
  ///
  /// If this is [BoxShape.circle] then [borderRadius] is ignored.
  ///
  /// The [shape] cannot be interpolated; animating between two [AuroraDecoration]s
  /// with different [shape]s will result in a discontinuity in the rendering.
  /// To interpolate between two shapes, consider using [ShapeDecoration] and
  /// different [ShapeBorder]s; in particular, [CircleBorder] instead of
  /// [BoxShape.circle] and [RoundedRectangleBorder] instead of
  /// [BoxShape.rectangle].
  ///
  /// {@macro flutter.painting.BoxDecoration.clip}
  final BoxShape shape;

  @override
  EdgeInsetsGeometry? get padding => border?.dimensions;

  @override
  Path getClipPath(Rect rect, TextDirection textDirection) {
    switch (shape) {
      case BoxShape.circle:
        final Offset center = rect.center;
        final double radius = rect.shortestSide / 2.0;
        final Rect square = Rect.fromCircle(center: center, radius: radius);
        return Path()..addOval(square);
      case BoxShape.rectangle:
        if (borderRadius != null) {
          return Path()
            ..addRRect(borderRadius!.resolve(textDirection).toRRect(rect));
        }
        return Path()..addRect(rect);
    }
  }

  /// Returns a new box decoration that is scaled by the given factor.
  AuroraDecoration scale(double factor) {
    return AuroraDecoration(
      color: Color.lerp(null, color, factor),
      border: BoxBorder.lerp(null, border, factor),
      borderRadius: BorderRadiusGeometry.lerp(null, borderRadius, factor),
      boxShadow: BoxShadow.lerpList(null, boxShadow, factor),
      gradients: gradients?.map((e) => e.scale(factor)).toList(),
      shape: shape,
    );
  }

  @override
  bool get isComplex => boxShadow != null;

  @override
  AuroraDecoration? lerpFrom(Decoration? a, double t) {
    if (a == null) return scale(t);
    if (a is AuroraDecoration) return AuroraDecoration.lerp(a, this, t);
    return super.lerpFrom(a, t) as AuroraDecoration?;
  }

  @override
  AuroraDecoration? lerpTo(Decoration? b, double t) {
    if (b == null) return scale(1.0 - t);
    if (b is AuroraDecoration) return AuroraDecoration.lerp(this, b, t);
    return super.lerpTo(b, t) as AuroraDecoration?;
  }

  static AuroraDecoration? lerp(
      AuroraDecoration? a, AuroraDecoration? b, double t) {
    if (a == null && b == null) return null;
    if (a == null) return b!.scale(t);
    if (b == null) return a.scale(1.0 - t);
    if (t == 0.0) return a;
    if (t == 1.0) return b;

    List<Gradient> _gradients = [];
    List<double> _blurs = [];
    /*if (a.gradients != null) {
      _gradients.addAll(a.gradients!.map((e) => e.scale(1 - t)));
      List<double> _blursA = [];
      if (a.gradientBlurs != null) {
        _blursA.addAll(a.gradientBlurs!);
      }
      _blursA.addAll(
          List.generate(_gradients.length - _blursA.length, (index) => 0));
      _blurs.addAll(_blursA);
    }

    if (b.gradients != null) {
      _gradients.addAll(b.gradients!.map((e) => e.scale(t)));
      if (b.gradientBlurs != null) {
        _blurs.addAll(b.gradientBlurs!);
      }
    }*/

    List<Gradient>? aGradients = a.gradients;
    List<Gradient>? bGradients = b.gradients;
    List<double>? aBlurs = a.gradientBlurs;
    List<double>? bBlurs = b.gradientBlurs;

    aGradients ??= <Gradient>[];
    bGradients ??= <Gradient>[];
    aGradients = aGradients.reversed.toList();
    bGradients = bGradients.reversed.toList();
    aBlurs ??= <double>[];
    bBlurs ??= <double>[];
    aBlurs = aBlurs.reversed.toList();
    bBlurs = bBlurs.reversed.toList();
    final int commonLength = math.min(aBlurs.length, bBlurs.length);
    List<double> rst = [];
    for (int i = 0; i < commonLength; i += 1) {
      if (_isSameGradient(aGradients[i], bGradients[i])) {
        _gradients.add(Gradient.lerp(aGradients[i], bGradients[i], t)!);
        _blurs.add(lerpDouble(aBlurs[i], bBlurs[i], t)!);
      } else {
        _gradients.add(aGradients[i].scale(1 - t));
        _gradients.add(bGradients[i].scale(t));
        _blurs.add(aBlurs[i]);
        _blurs.add(bBlurs[i]);
      }
    }
    for (int i = commonLength; i < aBlurs.length; i += 1) {
      _gradients.add(aGradients[i].scale(1.0 - t));
      _blurs.add(aBlurs[i]);
    }
    for (int i = commonLength; i < bBlurs.length; i += 1) {
      _gradients.add(bGradients[i].scale(t));
      _blurs.add(bBlurs[i]);
    }

    _gradients = _gradients.reversed.toList();
    _blurs = _blurs.reversed.toList();

    return AuroraDecoration(
      color: Color.lerp(a.color, b.color, t),
      border: BoxBorder.lerp(a.border, b.border, t),
      borderRadius:
          BorderRadiusGeometry.lerp(a.borderRadius, b.borderRadius, t),
      boxShadow: BoxShadow.lerpList(a.boxShadow, b.boxShadow, t),
      gradients: _gradients,
      gradientBlurs: _blurs,
      shape: t < 0.5 ? a.shape : b.shape,
    );
  }

  static bool _isSameGradient(Gradient a, Gradient b) {
    return (a is LinearGradient && b is LinearGradient) ||
        (a is RadialGradient && b is RadialGradient) ||
        (a is SweepGradient && b is SweepGradient);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    return other is AuroraDecoration &&
        other.color == color &&
        other.border == border &&
        other.borderRadius == borderRadius &&
        listEquals<BoxShadow>(other.boxShadow, boxShadow) &&
        other.gradients == gradients &&
        other.gradientBlurs == gradientBlurs &&
        other.shape == shape;
  }

  @override
  int get hashCode {
    return hashValues(
      color,
      border,
      borderRadius,
      hashList(boxShadow),
      hashList(gradients),
      hashList(gradientBlurs),
      shape,
    );
  }

  @override
  bool hitTest(Size size, Offset position, {TextDirection? textDirection}) {
    assert((Offset.zero & size).contains(position));
    switch (shape) {
      case BoxShape.rectangle:
        if (borderRadius != null) {
          final RRect bounds =
              borderRadius!.resolve(textDirection).toRRect(Offset.zero & size);
          return bounds.contains(position);
        }
        return true;
      case BoxShape.circle:
        // Circles are inscribed into our smallest dimension.
        final Offset center = size.center(Offset.zero);
        final double distance = (position - center).distance;
        return distance <= math.min(size.width, size.height) / 2.0;
    }
  }

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    assert(onChanged != null);
    return _BoxDecorationMixPainter(this, onChanged);
  }
}

/// An object that paints a [AuroraDecoration] into a canvas.
class _BoxDecorationMixPainter extends BoxPainter {
  _BoxDecorationMixPainter(this._decoration, VoidCallback? onChanged)
      : super(onChanged);

  final AuroraDecoration _decoration;

  Paint? _cachedColorPaint;
  Paint _getColorPaint(Rect rect, TextDirection? textDirection) {
    if (_cachedColorPaint == null) {
      final Paint paint = Paint();
      if (_decoration.backgroundBlendMode != null) {
        paint.blendMode = _decoration.backgroundBlendMode!;
      }
      if (_decoration.color != null) paint.color = _decoration.color!;
      _cachedColorPaint = paint;
    }

    return _cachedColorPaint!;
  }

  List<Paint?> _cachedGradientPaints = [];
  List<Rect?> _rectForCachedGradientPaints = [];

  Paint _getGradientPainAt(Rect rect, TextDirection? textDirection, int i) {
    assert(_decoration.gradients![i] != null ||
        _rectForCachedGradientPaints[i] == null);

    if (_cachedGradientPaints[i] == null ||
        (_rectForCachedGradientPaints[i] != rect)) {
      final Paint paint = Paint();
      if (_decoration.backgroundBlendMode != null) {
        paint.blendMode = _decoration.backgroundBlendMode!;
      }
      if (_decoration.gradientBlurs != null &&
          i < _decoration.gradientBlurs!.length) {
        if (_decoration.gradientBlurs![i] > 0) {
          paint.imageFilter = ImageFilter.blur(
              sigmaY: _decoration.gradientBlurs![i],
              sigmaX: _decoration.gradientBlurs![i]);
        }
      }

      paint.shader = _decoration.gradients![i]
          .createShader(rect, textDirection: textDirection);
      _rectForCachedGradientPaints[i] = rect;
      _cachedGradientPaints[i] = paint;
    }

    return _cachedGradientPaints[i]!;
  }

  void _paintBox(
      Canvas canvas, Rect rect, Paint paint, TextDirection? textDirection) {
    switch (_decoration.shape) {
      case BoxShape.circle:
        assert(_decoration.borderRadius == null);
        final Offset center = rect.center;
        final double radius = rect.shortestSide / 2.0;
        canvas.drawCircle(center, radius, paint);
        break;
      case BoxShape.rectangle:
        if (_decoration.borderRadius == null) {
          canvas.drawRect(rect, paint);
        } else {
          canvas.drawRRect(
              _decoration.borderRadius!.resolve(textDirection).toRRect(rect),
              paint);
        }
        break;
    }
  }

  void _paintShadows(Canvas canvas, Rect rect, TextDirection? textDirection) {
    if (_decoration.boxShadow == null) return;
    for (final BoxShadow boxShadow in _decoration.boxShadow!) {
      final Paint paint = boxShadow.toPaint();
      final Rect bounds =
          rect.shift(boxShadow.offset).inflate(boxShadow.spreadRadius);
      _paintBox(canvas, bounds, paint, textDirection);
    }
  }

  void _paintBackgroundColor(
      Canvas canvas, Rect rect, TextDirection? textDirection) {
    if (_decoration.color != null) {
      _paintBox(
          canvas, rect, _getColorPaint(rect, textDirection), textDirection);
    }
    if (_decoration.gradients != null) {
      _cachedGradientPaints =
          List.generate(_decoration.gradients!.length, (index) => null);
      _rectForCachedGradientPaints =
          List.generate(_decoration.gradients!.length, (index) => null);
      for (int i = 0; i < _decoration.gradients!.length; i++) {
        _paintBox(canvas, rect, _getGradientPainAt(rect, textDirection, i),
            textDirection);
      }
    }
  }

  /// Paint the box decoration into the given location on the given canvas.
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    assert(configuration.size != null);
    final Rect rect = offset & configuration.size!;
    final TextDirection? textDirection = configuration.textDirection;
    _paintShadows(canvas, rect, textDirection);
    _paintBackgroundColor(canvas, rect, textDirection);
    _decoration.border?.paint(
      canvas,
      rect,
      shape: _decoration.shape,
      borderRadius: _decoration.borderRadius?.resolve(textDirection),
      textDirection: configuration.textDirection,
    );
  }

  @override
  String toString() {
    return 'BoxPainter for $_decoration';
  }
}
