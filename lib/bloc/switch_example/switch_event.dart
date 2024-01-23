part of 'switch_bloc.dart';

@immutable
abstract class SwitchEvents {
  SwitchEvents();

  @override
  List<Object> get props => [];
}

class EnableOrDisableNotification extends SwitchEvents {}

class SliderEvent extends SwitchEvents {
  SliderEvent({required this.slider,});
  double slider;

  @override
  List<Object> get props => [slider];
}
