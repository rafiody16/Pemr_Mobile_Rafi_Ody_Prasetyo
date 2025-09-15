# Codelab 03 - Conditional and Loop

  * **Nama:** Rafi Ody Prasetyo
  * **NIM:** 2341720180
  * **Kelas:** TI-3F
  * **Absen:** 24

-----

# Praktikum 1 - Menerapkan Control Flows ("if/else")

  ***Langkah 1:*** Ketik/salin kode berikut pada `main()`

  ```dart
  String test = "test2";
  if (test == "test1") {
    print("Test1");
  } else If (test == "test2") {
    print("Test2");
  } Else {
    print("Something else");
  }

  if (test == "test2") print("Test2 again");
  ```

  ***Langkah 2:*** Kemudian eksekusi kode tersebut.

  **Output:**
  ![praktikum1.dart](img/Praktikum1-error_langkah1.png)

  ***Penjelasan:*** Error disebabkan adanya kesalahan penulisan pada bagian `else If` dan `Else`. Penulisan yang benar adalah `else if` 
                    dan `else` tanpa ada awalan huruf besar.

  ***Perbaikan:***
  ```dart
  String test = "test2";
  if (test == "test1") {
    print("Test1");
  } else if (test == "test2") {
    print("Test2");
  } else {
    print("Something else");
  }
  ```

  **Output:**

  
  ![praktikum1.dart](img/Praktikum1-perbaikan_langkah1.png)

  ***Langkah 3:*** Tambahkan kode program berikut, lalu coba eksekusi (Run).

  ```dart
  String test = "true";
  if (test) {
    print("Kebenaran");
  }
  ```

  **Output:**

  
  ![praktikum1.dart](img/Praktikum1-error_langkah3.png)

  ***Penjelasan:*** Error disebabkan karena variabel `test` bertipe data `string`, tetapi digunakan sebagai `boolean` di dalam perulangan.

  ***Perbaikan:***
  ```dart
  String test = "true";

  if (test == "true") {
    print("Kebenaran");
  }
  ```

  **Output:**

  
  ![praktikum1.dart](img/Praktikum1-perbaikan_langkah3.png)

-----

# Praktikum 2 - Menerapkan Perulangan "while" dan "do-while"

  ***Langkah 1:*** Ketik atau salin kode program berikut ke dalam fungsi main().

  ```dart
  while (counter < 33) {
    print(counter);
    counter++;
  }
  ```

  ***Langkah 2:*** Silakan coba eksekusi (Run) kode pada langkah 1 tersebut. Apa yang terjadi? Jelaskan! Lalu perbaiki jika terjadi error.

  **Output:**
  ![praktikum2.dart](img/Praktikum2-error_langkah1.png)

  ***Penjelasan:*** Error terjadi karena variabel `counter` dipanggil dalam kode, tetapi sebelumnya belum pernah dideklarasikan atau diinisialisasi.

  ***Perbaikan:***

  ```dart
  int counter = 0;

  while (counter < 3) {
    print(counter);
    counter++;
  }
  ```
  Pada kode tersebut, `counter` berfungsi sebagai penghitung jumlah perulangan yang dijalankan. Oleh karena itu, variabel ini dapat dideklarasikan menggunakan tipe data `int`, atau menggunakan `var` agar lebih fleksibel.

  **Output:**

  ![praktikum2.dart](img/Praktikum2-perbaikan_langkah1.png)

  ***Langkah 3:*** Tambahkan kode program berikut, lalu coba eksekusi (Run) kode Anda.

  ```dart
  do {
    print(counter);
    counter++;
  } while (counter < 77);
  ```

  **Output:**
  ![praktikum2.dart](img/Praktikum2-langkah3.png)

  ***Penjelasan:*** Ketika kode pada langkah 3 dijalankan, program akan menampilkan output berupa angka dari 0 hingga 76. Hal ini terjadi karena perulangan `do-while` akan terus dijalankan selama nilai `counter` masih lebih kecil dari 77.

-----

# Praktikum 3 - Menerapkan Perulangan "for" dan "break-continue"

  ***Langkah 1:*** Ketik atau salin kode program berikut ke dalam fungsi main().

  ```dart
  for (Index = 10; index < 27; index) {
    print(Index);
  }
  ```

  ***Langkah 2:*** Silakan coba eksekusi (Run) kode pada langkah 1 tersebut. Apa yang terjadi? Jelaskan! Lalu perbaiki jika terjadi error.

  **Output:**
  ![praktikum3.dart](img/Praktikum3-error_langkah1.png)

  ***Penjelasan:*** "Error terjadi karena variabel `Index` belum dideklarasikan dengan tipe data yang sesuai. Selain itu, terdapat inkonsistensi penulisan nama variabel pada bagian kondisi perulangan. Variabel yang digunakan adalah `Index`, tetapi pada kondisi ditulis `index`.

  ***Perbaikan:***

  ```dart
  for (int index = 10; index < 27; index++) {
    print(index);
  }
  ```
  **Output:**
  ![praktikum3.dart](img/Praktikum3-perbaikan_langkah1.png)

  Perulangan dimulai dari `10` dikarenakan variabel `index` bernilai `10`. Perulangan akan berakhir ketika index bernilai 27.

-----

# Tugas Praktikum

 1. Silakan selesaikan Praktikum 1 sampai 3, lalu dokumentasikan berupa screenshot hasil pekerjaan beserta penjelasannya!
 2. Buatlah sebuah program yang dapat menampilkan bilangan prima dari angka 0 sampai 201 menggunakan Dart. Ketika bilangan prima ditemukan, maka tampilkan nama lengkap dan NIM Anda.

 ***Kode Tugas Praktikum:***

 ```dart
 void main() {
  String nama = "Rafi Ody Prasetyo";
  String nim = "2341720180";

  for (int i = 0; i <= 201; i++) {
    bool prima = true;

    if (i < 2) {
      prima = false;
    } else {
      for (int j = 2; j < i; j++) {
        if (i % j == 0) {
          prima = false;
          break;
        }
      }
    }

    if (prima == true) {
      print("$i adalah bilangan prima | Nama : $nama | NIM : $nim");
    } else {
      print("$i");
    }
  }
}
```

 ***Output:***

 
 ![tugas.dart](img/output1-tugas.png)
 ![tugas.dart](img/output3-tugas.png)

 ***Penjelasan:*** Kode program di atas digunakan untuk menampilkan angka dari 0 sampai 201 dengan menggunakan perulangan for. Pada setiap iterasi, program akan mengecek apakah angka tersebut merupakan bilangan prima atau bukan. Untuk menentukan apakah sebuah angka `i` termasuk bilangan prima:

  * Jika `i` kurang dari 2, maka langsung dianggap bukan bilangan prima.
  * Jika `i ≥ 2`, maka dilakukan pengecekan dengan cara membagi `i` dengan semua bilangan dari 2 hingga i-1.
  * Jika ditemukan sisa bagi 0, berarti i bukan bilangan prima. Jika tidak ada, maka i adalah bilangan prima.

Jika angka tersebut bilangan prima, program akan mencetak angka disertai dengan nama dan NIM. Jika bukan bilangan prima, hanya angka yang dicetak. Dengan begitu, output program akan berupa daftar angka 0–201, di mana angka-angka prima ditandai dengan tambahan informasi identitas.


