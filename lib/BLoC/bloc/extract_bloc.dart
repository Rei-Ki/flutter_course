import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_bloc/flutter_bloc.dart';
import '../user.dart';
import 'extract_event.dart';
import 'extract_state.dart';

class ApiBloc extends Bloc<ApiEvents, ApiStates> {
  ApiBloc() : super(InitialState()){
    on<GetUserListEvent>(_getUserList);
  }

  _getUserList(GetUserListEvent event, Emitter<ApiStates> emitter) async {
    try {
      emitter(LoadingState());
      List<User> users = await getUserApi();
      emitter(SuccessUserListState(users));
    } catch(e) {
      print(e);
      emitter(FailureState());
    }
  }

  Future<List<User>> getUserApi() async {
    List<User> usersList = [];

    Uri url = Uri.parse("https://gorest.co.in/public/v2/users");
    var respose = await http.get(url);

    if (respose.statusCode == 200) {
      var list = jsonDecode(respose.body) as List;
      list.forEach((element) {
        User user = User.fromJson(element);
        usersList.add(user);
      });
      return usersList;
    }
    return [];
  }

}
