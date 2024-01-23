part of 'switch_bloc.dart';

class SwitchStates extends Equatable {
  SwitchStates({this.isSwitch = false, this.slider = 1.0,});
  bool isSwitch;
  double slider;

  SwitchStates copyWith({bool? isSwitch, double? slider}) {  // here, copyWith creates a new instance of SwitchStates class
    return SwitchStates( isSwitch: isSwitch ?? this.isSwitch, slider: slider ?? this.slider );
}

  @override
  List<Object?> get props => [isSwitch, slider];

}
