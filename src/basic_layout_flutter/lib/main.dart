import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Widget titleSection = ListTile(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'Ranu Kumbolo',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          SizedBox(height: 4),
        ],
      ),
      subtitle: Text(
        'Semeru, Jawa Timur, Indonesia',
        style: TextStyle(color: Colors.grey[500]),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.star, color: Colors.red[500]),
          const Text('41'),
        ],
      ),
      contentPadding: const EdgeInsets.all(32),
    );

    Color color = Theme.of(context).primaryColor;

    Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(color, Icons.call, 'CALL'),
        _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
        _buildButtonColumn(color, Icons.share, 'SHARE'),
      ],
    );

    Widget textSection = const Text(
      'Ranu Kumbolo adalah danau cantik dan sejuk di kaki Gunung Semeru, Jawa Timur, yang berfungsi sebagai tempat istirahat dan berkemah bagi pendaki. Berada di ketinggian sekitar 2.400 mdpl di dalam Taman Nasional Bromo Tengger Semeru (TNBTS), danau ini terkenal dengan keindahan alamnya, terutama pemandangan matahari terbit (sunrise) di antara dua bukit hijau yang memukau. Danau ini juga merupakan sumber air bersih dan memiliki keunikan geologi sebagai danau vulkanik (maar).  By: Rafi Ody Prasetyo | 2341720180',
      softWrap: true,
      textAlign: TextAlign.justify,
    );

    return MaterialApp(
      title: 'Flutter Layout',
      home: Scaffold(
        appBar: AppBar(title: const Text('Flutter Layout')),
        body: ListView(
          children: [
            Stack(
              alignment: AlignmentGeometry.bottomLeft,
              children: [
                Image.asset(
                  'images/kumbolo.jpg',
                  width: double.infinity,
                  height: 240,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  bottom: 16,
                  left: 16,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 6,
                      horizontal: 12,
                    ),
                    color: Colors.black54,
                    child: const Text(
                      'Ranu Kumbolo',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  titleSection,
                  const SizedBox(height: 32),
                  buttonSection,
                  const SizedBox(height: 32),
                  textSection,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}
