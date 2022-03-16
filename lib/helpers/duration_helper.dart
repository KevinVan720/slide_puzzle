extension DurationExtension on Duration {
  /// Replays the current audio.
  Duration dilate(double dilationFactor) {
    return Duration(
        milliseconds: (this.inMilliseconds * dilationFactor).round());
  }
}
