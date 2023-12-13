import 'package:flutter_bloc/flutter_bloc.dart';

import 'repository.dart';

class SomeBloc extends Bloc<Events, States> {
  final AppIdeasRepository repo;

  SomeBloc({required this.repo}) : super(SomeInitial()) {
    on<SomeChangeEvent>(onSomeChange);
  }

  onSomeChange(event, emit) async {
    await emit.forEach(
      repo.getData(),
      onData: (int title) => SomeUpdated(title),
    );
  }
}

abstract class States {}

abstract class Events {}

class SomeInitial extends States {}

class SomeUpdated extends States {
  int title;
  SomeUpdated(this.title);
}

class SomeChangeEvent extends Events {}
