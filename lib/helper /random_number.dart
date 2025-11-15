import 'dart:async';

class RandomNumber {
  Timer? _timer;
  double uploadNumber = 0;
  double downloadNumber = 0;

  void randomizeNumber() {
    _timer = Timer.periodic(Duration(milliseconds: 100), (_) {
      uploadNumber++;
      downloadNumber++;
    });
  }

  void stopRandomize() {
    _timer?.cancel();
  }
}
