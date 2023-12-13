import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_course/BLoC_repo_ex/ws.dart';

import 'repository.dart';

class SomeBloc extends Bloc<Events, States> {
  late AppIdeasRepository repo;
  late WebSocketManager socket;

  SomeBloc({required this.repo, required this.socket}) : super(SomeInitial()) {
    on<SomeChangeEvent>((event, emit) async {
      await emit.forEach(
        repo.getData(),
        onData: (int title) => SomeUpdated(title),
      );
    });
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
