import 'package:flutter/material.dart';
import 'package:belanja/models/item.dart';

class HomePage extends StatelessWidget {
  final List<Item> items = [
    Item(
      name: 'Sugar',
      price: 5000,
      stock: 20,
      rating: 4.5,
      image: 'images/sugar.jpg',
    ),
    Item(
      name: 'Salt',
      price: 2000,
      stock: 10,
      rating: 4.3,
      image: 'images/salt.jpg',
    ),
    Item(
      name: 'Flavor',
      price: 3500,
      stock: 7,
      rating: 5.0,
      image: 'images/flavor.jpg',
    ),
    Item(
      name: 'Soap',
      price: 7000,
      stock: 15,
      rating: 4.5,
      image: 'images/soap.jpg',
    ),
    Item(
      name: 'Detergen',
      price: 10000,
      stock: 8,
      rating: 4.1,
      image: 'images/detergen.jpg',
    ),
    Item(
      name: 'Milk',
      price: 7000,
      stock: 10,
      rating: 4.5,
      image: 'images/milk.jpg',
    ),
    Item(
      name: 'Instant Noodle',
      price: 2000,
      stock: 20,
      rating: 4.1,
      image: 'images/noodle.jpg',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Online Shop | Rafi Ody Prasetyo 2341720180'),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.8,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/item', arguments: item);
            },
            child: Card(
              elevation: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Hero(
                      tag: item.name,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(4),
                        ),
                        child: Image.asset(
                          item.image,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.name,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text('Price: Rp ${item.price}'),
                        Text('Stock: ${item.stock}'),
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 16,
                            ),
                            Text('${item.rating}'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
