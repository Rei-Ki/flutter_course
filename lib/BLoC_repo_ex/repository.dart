import 'dart:math';

class AppIdeasRepository {
  Random random = Random();

  Stream<int> getData() async* {
    while (true) {
      int a = random.nextInt(100) + 1;
      print(a);
      yield a;
      await Future<void>.delayed(const Duration(seconds: 2));
    }
  }
}
