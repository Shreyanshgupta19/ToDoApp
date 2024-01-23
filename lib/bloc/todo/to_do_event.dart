part of 'to_do_bloc.dart';

abstract class ToDoEvent extends Equatable {
  const ToDoEvent();
}

class AddToDoEvent extends ToDoEvent {
  const AddToDoEvent({required this.task,});
  final String task;

  @override
  List<Object?> get props => [task];
}

class RemoveToDoEvent extends ToDoEvent {
  const RemoveToDoEvent({required this.task,});
  final Object task;

  @override
  List<Object?> get props => [task];
}
