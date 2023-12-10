
import '../Todo.dart';

abstract class ApiStates{}

class InitialState extends ApiStates{}
class LoadingState extends ApiStates{}
class FailureState extends ApiStates{}
class SuccessTodoState extends ApiStates{
  List<Todo> todos;
  SuccessTodoState(this.todos);
}
