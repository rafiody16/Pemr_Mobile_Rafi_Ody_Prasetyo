import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';
import 'stream.dart'; // Pastikan file stream.dart ada di folder lib

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stream Ody',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: const StreamHomePage(),
    );
  }
}

class StreamHomePage extends StatefulWidget {
  const StreamHomePage({super.key});

  @override
  State<StreamHomePage> createState() => _StreamHomePageState();
}

class _StreamHomePageState extends State<StreamHomePage> {
  int lastNumber = 0;
  late StreamController numberStreamController;
  late NumberStream numberStream;

  // Langkah 1: Tambah variabel baru
  late StreamSubscription subscription;
  late StreamSubscription subscription2;
  String values = '';

  @override
  void initState() {
    super.initState();
    numberStream = NumberStream();
    numberStreamController = numberStream.controller;

    // Langkah 4: Set broadcast stream
    // PENTING: .asBroadcastStream() membuat stream bisa didengar >1 subscriber
    Stream stream = numberStreamController.stream.asBroadcastStream();

    // Langkah 2: Buat subscription pertama
    subscription = stream.listen((event) {
      setState(() {
        values += '$event - '; // Menambahkan angka ke string
      });
    });

    // Langkah 2: Buat subscription kedua (duplikasi)
    subscription2 = stream.listen((event) {
      setState(() {
        values += '$event - '; // Menambahkan angka yang sama lagi
      });
    });
  }

  @override
  void dispose() {
    // Jangan lupa cancel kedua subscription agar tidak memory leak
    subscription.cancel();
    subscription2.cancel();
    super.dispose();
  }

  void stopStream() {
    numberStreamController.close();
  }

  void addRandomNumber() {
    Random random = Random();
    int myNum = random.nextInt(10);
    // Cek apakah stream sudah ditutup sebelum menambah data
    if (!numberStreamController.isClosed) {
      numberStream.addNumberToSink(myNum);
    } else {
      setState(() {
        lastNumber = -1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Stream Ody')),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Langkah 5: Tampilkan variable values di layar
            Text(
              values,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            ElevatedButton(
              onPressed: () => addRandomNumber(),
              child: const Text('New Random Number'),
            ),
            ElevatedButton(
              onPressed: () => stopStream(),
              child: const Text('Stop Subscription'),
            ),
          ],
        ),
      ),
    );
  }
}
