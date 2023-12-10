import '../user.dart';

abstract class ApiStates{}

class LoadingState extends ApiStates{}
class FailureState extends ApiStates{}
class InitialState extends ApiStates{}

class SuccessUserListState extends ApiStates{
  List<User> users;
  SuccessUserListState(this.users);
}
