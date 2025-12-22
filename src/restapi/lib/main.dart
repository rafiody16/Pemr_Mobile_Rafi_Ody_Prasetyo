import 'package:flutter/material.dart';
import 'httphelper.dart';
import 'pizza.dart';
import 'pizzadetail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pizza App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
      ),
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
  late Future<List<Pizza>> _pizzaFuture;
  final HttpHelper _helper = HttpHelper();

  @override
  void initState() {
    super.initState();
    _loadPizza();
  }

  // Fungsi untuk mengambil data dari Server
  void _loadPizza() {
    setState(() {
      _pizzaFuture = _helper.getPizzaList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pizza List - Rafi Ody'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          // Tombol Refresh Manual (Opsional)
          IconButton(icon: const Icon(Icons.refresh), onPressed: _loadPizza),
        ],
      ),
      body: FutureBuilder<List<Pizza>>(
        future: _pizzaFuture,
        builder: (context, snapshot) {
          // 1. Loading State
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          // 2. Error State
          if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline, color: Colors.red, size: 50),
                  const SizedBox(height: 10),
                  Text('Error: ${snapshot.error}'),
                  ElevatedButton(
                    onPressed: _loadPizza,
                    child: const Text('Coba Lagi'),
                  ),
                ],
              ),
            );
          }

          // 3. Empty State
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Tidak ada data pizza.'));
          }

          // 4. Data Ready
          final pizzas = snapshot.data!;

          return RefreshIndicator(
            onRefresh: () async {
              _loadPizza();
            },
            child: ListView.builder(
              itemCount: pizzas.length,
              itemBuilder: (context, index) {
                final pizza = pizzas[index];

                return Dismissible(
                  key: Key(pizza.id.toString()), // Pastikan ID unik
                  direction: DismissDirection.endToStart,
                  background: Container(
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.only(right: 20),
                    color: Colors.red,
                    child: const Icon(Icons.delete, color: Colors.white),
                  ),
                  confirmDismiss: (direction) async {
                    // Konfirmasi hapus dulu biar aman
                    return await showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text("Konfirmasi Hapus"),
                          content: Text(
                            "Yakin ingin menghapus ${pizza.pizzaName}?",
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(false),
                              child: const Text("Batal"),
                            ),
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(true),
                              child: const Text(
                                "Hapus",
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  onDismissed: (direction) async {
                    // 1. Hapus visual dulu (Optimistic UI)
                    setState(() {
                      pizzas.removeAt(index);
                    });

                    // 2. Request hapus ke Server
                    bool success = await _helper.deletePizza(pizza.id!);

                    if (!mounted) return;

                    if (success) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('${pizza.pizzaName} berhasil dihapus'),
                        ),
                      );
                    } else {
                      // Kembalikan data kalau gagal (opsional, butuh logic load ulang)
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Gagal menghapus data di server'),
                        ),
                      );
                      _loadPizza(); // Reload biar data balik
                    }
                  },
                  child: Card(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.orange.shade100,
                        child: Text(pizza.pizzaName?[0] ?? 'P'),
                      ),
                      title: Text(
                        pizza.pizzaName ?? 'No Name',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        '${pizza.description ?? ''}\n€ ${pizza.price ?? 0}',
                      ),
                      isThreeLine: true,
                      trailing: const Icon(Icons.edit, color: Colors.blue),
                      onTap: () async {
                        // --- LOGIKA EDIT ---
                        final result = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                                PizzaDetailScreen(pizza: pizza, isNew: false),
                          ),
                        );

                        // Jika berhasil simpan (result == true), refresh list
                        if (result == true) {
                          _loadPizza();
                        }
                      },
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          // --- LOGIKA TAMBAH BARU ---
          final result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => PizzaDetailScreen(pizza: Pizza(), isNew: true),
            ),
          );

          // Jika berhasil simpan (result == true), refresh list
          if (result == true) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(const SnackBar(content: Text('Sukses! ')));

            setState(() {});
            if (mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Data berhasil disimpan (Refresh List)'),
                ),
              );
            }
          }
        },
      ),
    );
  }
}
