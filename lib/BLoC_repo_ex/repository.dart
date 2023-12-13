import 'dart:math';

class AppIdeasRepository {
  Random random = Random();

  Stream<int> getData() async* {
    while (true) {
      yield random.nextInt(100) + 1;
      await Future<void>.delayed(const Duration(seconds: 2));
    }
  }
}
