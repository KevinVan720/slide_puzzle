// ignore_for_file: public_member_api_docs

part of 'audio_control_bloc.dart';

class AudioControlState extends Equatable {
  const AudioControlState({
    this.muted = false,
    this.volume = 1,
  });

  /// Whether the audio is muted.
  final bool muted;

  final double volume;

  @override
  List<Object> get props => [muted, volume];
}
