import 'package:flutter/material.dart';
import 'dart:convert';
import 'model/pizza.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter JSON Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Pizza> myPizzas = [];
  int appCounter = 0; // Default 0

  Future<List<Pizza>> readJsonFile() async {
    String myString = await DefaultAssetBundle.of(
      context,
    ).loadString('assets/pizzalist.json');

    List pizzaMapList = jsonDecode(myString);
    List<Pizza> myPizzas = [];

    for (var pizza in pizzaMapList) {
      Pizza myPizza = Pizza.fromJson(pizza);
      myPizzas.add(myPizza);
    }

    return myPizzas;
  }

  // Fungsi untuk membaca dan menambah counter
  Future readAndWritePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // 1. Ambil nilai lama (jika null anggap 0)
    int savedValue = prefs.getInt('appCounter') ?? 0;

    // 2. Tambah 1
    int newValue = savedValue + 1;

    // 3. Simpan nilai baru ke memori HP
    await prefs.setInt('appCounter', newValue);

    // 4. Update tampilan di layar
    setState(() {
      appCounter = newValue;
    });
  }

  // Fungsi untuk mereset counter (Hapus Data)
  Future deletePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear(); // Menghapus semua data
    setState(() {
      appCounter = 0; // Reset variabel lokal ke 0
    });
  }

  @override
  void initState() {
    super.initState();

    // Panggil fungsi counter (Jalan sendiri update UI-nya)
    readAndWritePreference();

    // Panggil fungsi JSON
    readJsonFile().then((value) {
      setState(() {
        myPizzas = value;
        // JANGAN update appCounter di sini, biarkan readAndWritePreference yang urus
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Shared Preferences ODY')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'You have opened the app $appCounter times.',
              style: const TextStyle(fontSize: 18),
            ),
            ElevatedButton(
              onPressed: () {
                deletePreference();
              },
              child: const Text('Reset Counter'),
            ),
          ],
        ),
      ),
    );
  }
}
