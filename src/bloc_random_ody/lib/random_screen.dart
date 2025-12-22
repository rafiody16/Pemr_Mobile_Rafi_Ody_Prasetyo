import 'package:flutter/material.dart';
import 'random_bloc.dart'; // Pastikan file random_bloc.dart ada di folder lib

class RandomScreen extends StatefulWidget {
  const RandomScreen({super.key});

  @override
  State<RandomScreen> createState() => _RandomScreenState();
}

class _RandomScreenState extends State<RandomScreen> {
  // Membuat instance BLoC
  final _bloc = RandomNumberBloc();

  @override
  void dispose() {
    _bloc.dispose(); // Wajib menutup stream saat layar ditutup
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Random Number Ody')),
      body: Center(
        child: StreamBuilder<int>(
          stream: _bloc.randomNumber, // Mendengarkan output dari BLoC
          initialData: 0, // Data awal sebelum ada event
          builder: (context, snapshot) {
            return Text(
              'Random Number: ${snapshot.data}',
              style: const TextStyle(fontSize: 24),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // Mengirim perintah "generate" ke BLoC saat tombol ditekan
        onPressed: () => _bloc.generateRandom.add(null),
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
