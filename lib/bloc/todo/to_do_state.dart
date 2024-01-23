part of 'to_do_bloc.dart';

class ToDoState extends Equatable {
  const ToDoState({this.todosList = const [],});
  final List<String> todosList;

ToDoState copyWith({List<String>? todosList}) {
  return ToDoState(todosList: todosList ?? this.todosList,);
}

  @override
  List<Object> get props => [todosList];
}

