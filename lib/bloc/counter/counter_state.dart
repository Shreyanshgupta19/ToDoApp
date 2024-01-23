import 'package:equatable/equatable.dart';

class CounterState extends Equatable {
  const CounterState({ this.counter = 0, });
  final int counter;

  CounterState copyWith ({int? counter}) {   // here we give the name of function is copyWith and it takes a input integer value and it returns CounterState class
    return CounterState(counter: counter ?? this.counter );
}

  @override
  List<Object?> get props => [counter];
}
