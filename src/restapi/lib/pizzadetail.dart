import 'package:flutter/material.dart';
import 'pizza.dart';
import 'httphelper.dart';

class PizzaDetailScreen extends StatefulWidget {
  final Pizza pizza;
  final bool isNew;

  const PizzaDetailScreen({
    super.key,
    required this.pizza,
    required this.isNew,
  });

  @override
  State<PizzaDetailScreen> createState() => _PizzaDetailScreenState();
}

class _PizzaDetailScreenState extends State<PizzaDetailScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController nameCtrl;
  late TextEditingController descCtrl;
  late TextEditingController priceCtrl;

  @override
  void initState() {
    super.initState();
    nameCtrl = TextEditingController(text: widget.pizza.pizzaName);
    descCtrl = TextEditingController(text: widget.pizza.description);
    priceCtrl = TextEditingController(
      text: widget.pizza.price?.toString() ?? '',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.isNew ? 'Add New Pizza' : 'Edit Pizza'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: nameCtrl,
                decoration: const InputDecoration(labelText: 'Pizza Name'),
                validator: (v) => v!.isEmpty ? 'Required' : null,
              ),
              TextFormField(
                controller: descCtrl,
                decoration: const InputDecoration(labelText: 'Description'),
              ),
              TextFormField(
                controller: priceCtrl,
                decoration: const InputDecoration(labelText: 'Price'),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                child: const Text('SAVE'),
                onPressed: () async {
                  // 1. Validasi Form
                  if (!_formKey.currentState!.validate()) return;

                  // 2. Simpan input ke object
                  widget.pizza.pizzaName = nameCtrl.text;
                  widget.pizza.description = descCtrl.text;
                  widget.pizza.price = double.tryParse(priceCtrl.text) ?? 0;

                  HttpHelper helper = HttpHelper();
                  bool success;

                  // 3. Tampilkan Loading biar user tau proses berjalan
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Sedang menyimpan data...'),
                      duration: Duration(seconds: 1),
                    ),
                  );

                  // 4. Kirim ke API
                  if (widget.isNew) {
                    success = await helper.postPizza(widget.pizza);
                  } else {
                    success = await helper.putPizza(widget.pizza);
                  }

                  if (!mounted) return; // Cek widget masih aktif

                  // 5. Cek Hasil
                  if (success) {
                    Navigator.pop(context, true); // Sukses -> Kembali
                  } else {
                    // Gagal -> Tampilkan Error Merah
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Gagal menyimpan! Cek Debug Console.'),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
