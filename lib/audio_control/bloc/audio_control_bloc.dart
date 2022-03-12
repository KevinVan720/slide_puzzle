// ignore_for_file: public_member_api_docs

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'audio_control_event.dart';
part 'audio_control_state.dart';

class AudioControlBloc extends Bloc<AudioControlEvent, AudioControlState> {
  AudioControlBloc() : super(const AudioControlState()) {
    on<AudioToggled>(_onAudioToggled);
    on<VolumeChanged>(_onVolumeChanged);
  }

  void _onAudioToggled(AudioToggled event, Emitter<AudioControlState> emit) {
    bool muted = !state.muted;
    emit(AudioControlState(muted: muted, volume: muted ? 0.0 : state.volume));
  }

  void _onVolumeChanged(VolumeChanged event, Emitter<AudioControlState> emit) {
    emit(AudioControlState(
        muted: event.volume < 0.01 ? true : false, volume: event.volume));
  }
}
