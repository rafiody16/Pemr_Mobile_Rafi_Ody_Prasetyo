import 'dart:async';
import 'dart:math';

class RandomNumberBloc {
  // Tambahkan .broadcast() di sini agar stream bisa didengar berulang kali
  final _generateRandomController = StreamController<void>.broadcast();
  final _randomNumberController = StreamController<int>.broadcast();

  // Input Sink
  Sink<void> get generateRandom => _generateRandomController.sink;

  // Output Stream
  Stream<int> get randomNumber => _randomNumberController.stream;

  RandomNumberBloc() {
    _generateRandomController.stream.listen((_) {
      final random = Random().nextInt(10);
      _randomNumberController.sink.add(random);
    });
  }

  void dispose() {
    _generateRandomController.close();
    _randomNumberController.close();
  }
}
