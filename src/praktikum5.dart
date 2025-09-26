void main() {
  // Langkah 1
  print('Langkah 1');
  var record = ('first', a: 2, b: true, 'last');
  print(record);

  // Langkah 3
  print('Langkah 3');
  (int, int) tukar((int, int) record) {
    var (a, b) = record;
    return (b, a);
  }

  print('Langkah 4');
  // (String, int) mahasiswa;
  // print(mahasiswa);
  (String, int) mahasiswa = ('Rafi Ody Prasetyo', 2341720180);

  print(mahasiswa);
  print(mahasiswa.$1);
  print(mahasiswa.$2);

  print('Langkah 5');
  var mahasiswa2 = ('first', a: 2, b: true, 'last');

  print(mahasiswa2.$1); // Prints 'first'
  print(mahasiswa2.a); // Prints 2
  print(mahasiswa2.b); // Prints true
  print(mahasiswa2.$2); // Prints 'last'
}
