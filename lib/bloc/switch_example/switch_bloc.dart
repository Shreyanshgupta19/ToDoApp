import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'switch_event.dart';
part 'switch_state.dart';

class SwitchBloc extends Bloc<SwitchEvents, SwitchStates> {
  SwitchBloc() : super(SwitchStates()) {
    on<EnableOrDisableNotification>(_enableOrDisableNotification);
    on<SliderEvent>(_slider);
  }

  void _enableOrDisableNotification(EnableOrDisableNotification events, Emitter<SwitchStates> emit) {
  emit(state.copyWith(isSwitch: !state.isSwitch));
  }
  void _slider(SliderEvent events, Emitter<SwitchStates> emit) {
  emit(state.copyWith(slider: events.slider.toDouble()));
  }

}
