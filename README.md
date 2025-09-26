# Codelab 04

  * **Nama:** Rafi Ody Prasetyo
  * **NIM:** 2341720180
  * **Kelas:** TI-3F
  * **Absen:** 24

-----

# Praktikum 1 - Eksperimen Tipe Data List

  ***Langkah 1:*** Ketik/salin kode berikut pada `main()`

  ```dart
  var list = [1, 2, 3];
  assert(list.length == 3);
  assert(list[1] == 2);
  print(list.length);
  print(list[1]);
  
  list[1] = 1;
  assert(list[1] == 1);
  print(list[1]);
  ```

  ***Langkah 2:*** Kemudian eksekusi kode tersebut.

  **Output:**

  
  ![praktikum1.dart](img/praktikum1_langkah1.png)

  ***Penjelasan:*** Program tersebut membuat list [1, 2, 3], lalu menampilkan panjang list yaitu 3 dan nilai pada index ke-1 yaitu 2. Setelah itu, nilai pada index ke-1 diubah dari 2 menjadi 1, sehingga ketika ditampilkan lagi hasilnya 1.

  ***Langkah 3:*** Ubah kode pada langkah 1 menjadi variabel final yang mempunyai index = 5 dengan default value = null. Isilah nama dan NIM Anda pada elemen index ke-1 dan ke-2. Lalu print dan capture hasilnya.

  ```dart
  final List<String?> list = List.filled(5, null, growable: false);

  list[1] = "Rafi Ody Prasetyo";
  list[2] = "2341720180";

  print(list);
  ```

  **Output:**

  
  ![praktikum1.dart](img/praktikum1_langkah3.png)

  ***Penjelasan:*** Kode tersebut membuat sebuah list bertipe String? dengan panjang tetap 5 elemen yang awalnya semuanya bernilai null. Karena menggunakan final, list tidak bisa diganti dengan list lain, tetapi isi elemennya tetap bisa diubah. Pada baris berikutnya, elemen indeks ke-1 diisi dengan string "Rafi Ody Prasetyo" dan indeks ke-2 diisi dengan string "2341720180". Saat dicetak, list menampilkan `[null, Rafi Ody Prasetyo, 2341720180, null, null]`.

-----

# Praktikum 2 - Eksperimen Tipe Data Set

  ***Langkah 1:*** Ketik/salin kode berikut pada `main()`

  ```dart
  var halogens = {'fluorine', 'chlorine', 'bromine', 'iodine', 'astatine'};
  print(halogens);
  ```

  ***Langkah 2:*** Kemudian eksekusi kode tersebut.

  **Output:**

  
  ![praktikum2.dart](img/praktikum2_langkah1.png)

  ***Penjelasan:*** Kode tersebut membuat sebuah Set String berisi nama-nama unsur halogen. Saat dicetak, akan menampilkan semua elemen unik dalam tanda {}, dengan urutan yang tidak harus sama seperti saat didefinisikan.
  
  ***Langkah 3:*** Tambahkan kode program berikut, lalu coba eksekusi (Run) kode Anda.

  ```dart
  var names1 = <String>{};
  Set<String> names2 = {}; // This works, too.
  var names3 = {}; // Creates a map, not a set.

  print(names1);
  print(names2);
  print(names3);
  ```

  **Output:**

  
  ![praktikum2.dart](img/praktikum2_langkah3(1).png)

  ***Penjelasan:*** Menampilkan 2 set kosong dari set names1 dan names2, lalu menampilkan map kosong dari map names3.

  Apa yang terjadi ? Jika terjadi error, silakan perbaiki namun tetap menggunakan ketiga variabel tersebut. Tambahkan elemen nama dan NIM Anda pada kedua variabel Set tersebut dengan dua fungsi berbeda yaitu `.add()` dan `.addAll()`. Untuk variabel Map dihapus, nanti kita coba di praktikum selanjutnya.

  ```dart
  names1.add("Rafi Ody Prasetyo");
  names2.addAll({"Rafi Ody Prasetyo", "2341720180"});

  print(names1);
  print(names2);
  ```
  **Output:**


  ![praktikum2.dart](img/praktikum2_langkah3(2).png)

-----

# Praktikum 3 - Eksperimen Tipe Data Maps

  ***Langkah 1:*** Ketik/salin kode berikut pada `main()`

  ```dart
  var gifts = {
    // Key:    Value
    'first': 'partridge',
    'second': 'turtledoves',
    'fifth': 1
  };
  
  var nobleGases = {
    2: 'helium',
    10: 'neon',
    18: 2,
  };
  
  print(gifts);
  print(nobleGases);
  ```

  ***Langkah 2:*** Kemudian eksekusi kode tersebut.

  **Output:**

  
  ![praktikum3.dart](img/praktikum3_langkah1.png)

  ***Penjelasan:*** Kode tersebut membuat dua Map di Dart. Map gifts menggunakan String sebagai key ('first', 'second', 'fifth') dengan value berupa string dan angka, sehingga outputnya {first: partridge, second: turtledoves, fifth: 1}. Sedangkan nobleGases menggunakan int sebagai key (2, 10, 18) dengan value string dan angka, sehingga hasil cetaknya {2: helium, 10: neon, 18: 2}.
  
  ***Langkah 3:*** Tambahkan kode program berikut, lalu coba eksekusi (Run) kode Anda.

  ```dart
  var mhs1 = Map<String, String>();
  gifts['first'] = 'partridge';
  gifts['second'] = 'turtledoves';
  gifts['fifth'] = 'golden rings';

  var mhs2 = Map<int, String>();
  nobleGases[2] = 'helium';
  nobleGases[10] = 'neon';
  nobleGases[18] = 'argon';
  ```
  
  Tambahkan elemen nama dan NIM Anda pada tiap variabel di atas (gifts, nobleGases, mhs1, dan mhs2).

  ```dart
   gifts['nama'] = 'Rafi Ody Prasetyo';
  gifts['nim'] = '2341720180';

  nobleGases[20] = 'Rafi Ody Prasetyo';
  nobleGases[21] = '2341720180';

  mhs1['nama'] = 'Rafi Ody Prasetyo';
  mhs1['nim'] = '2341720180';

  mhs2[1] = 'Rafi Ody Prasetyo';
  mhs2[2] = '2341720180';

  print(gifts);
  print(nobleGases);
  print(mhs1);
  print(mhs2);
  ```

  **Output:**

  
  ![praktikum3.dart](img/praktikum3_langkah3.png)

  ***Penjelasan:*** Kode tersebut menghasilkan empat output Map berbeda. Map gifts berisi pasangan key–value dengan key berupa string, awalnya menyimpan daftar hadiah lalu ditambah data mahasiswa sehingga hasil akhirnya {first: partridge, second: turtledoves, fifth: golden rings, nama: Rafi Ody Prasetyo, nim: 2341720180}. Map nobleGases menggunakan key bertipe angka, awalnya menyimpan unsur kimia lalu ditambah data mahasiswa sehingga hasilnya {2: helium, 10: neon, 18: argon, 20: Rafi Ody Prasetyo, 21: 2341720180}. Sementara itu, Map mhs1 hanya menyimpan identitas mahasiswa dengan key string, yaitu {nama: Rafi Ody Prasetyo, nim: 2341720180}, dan Map mhs2 menyimpan identitas mahasiswa dengan key angka, yaitu {1: Rafi Ody Prasetyo, 2: 2341720180}.

-----

# Praktikum 4 - Eksperimen Tipe Data List: Spread dan Control-flow Operators

  ***Langkah 1:*** Ketik/salin kode berikut pada `main()`

  ```dart
  print('Langkah 1');
  var list = [1, 2, 3];
  var list2 = [0, ...list];
  print(list);
  print(list2);
  print(list2.length);

  // Langkah 3
  print('Langkah 3');
  List<int?> list1 = [1, 2, null];
  print(list1);
  var list3 = [0, ...?list1];
  print(list3.length);

  var nim = [2, 3, 4, 1, 7, 2, 0, 1, 8, 0];
  var listNim = [...nim];
  print(listNim);

  // Langkah 4
  print('Langkah 4');
  bool promoActive = true;
  var nav_true = ['Home', 'Furniture', 'Plants', if (promoActive) 'Outlet'];
  print(nav_true);

  promoActive = false;
  var nav_false = ['Home', 'Furniture', 'Plants', if (promoActive) 'Outlet'];
  print(nav_false);

  // Langkah 5
  print('Langkah 5');
  String login = 'Manager';
  var nav2 = [
    'Home',
    'Furniture',
    'Plants',
    if (login case 'Manager') 'Outlet',
  ];
  print(nav2);

  // Langkah 6:
  print('Langkah 6');
  var listOfInts = [1, 2, 3];
  var listOfStrings = ['#0', for (var i in listOfInts) '#$i'];
  assert(listOfStrings[1] == '#1');
  print(listOfStrings);
  ```

  ***Langkah 2:*** Kemudian eksekusi kode tersebut.

  **Output:**

  
  ![praktikum4.dart](img/praktikum4.png)

  ***Ringkasan:*** Kode tersebut mendemonstrasikan berbagai fitur manipulasi List di Dart. Pada Langkah 1, dibuat list sederhana `[1, 2, 3]` kemudian digabung dengan operator spread `...` menjadi `[0, 1, 2, 3]` dengan panjang 4. Pada Langkah 3, list dengan elemen nullable `[1, 2, null]` digabung menggunakan `...?` sehingga nilai null diabaikan, menghasilkan panjang 4 pada list baru. Kemudian dibuat list nim yang disalin penuh ke list lain dengan spread operator. Pada Langkah 4, digunakan `if` di dalam list untuk menambahkan elemen secara kondisional: jika promoActive bernilai true, elemen "Outlet" ikut dimasukkan, jika false tidak dimasukkan. Pada Langkah 5, digunakan pola `if (login case 'Manager')` sehingga jika variabel login berisi "Manager", maka "Outlet" otomatis ditambahkan ke list. Terakhir pada Langkah 6, ditunjukkan penggunaan for di dalam list untuk membuat list baru dengan format string #i dari angka dalam `listOfInts`, menghasilkan `['#0', '#1', '#2', '#3']`. Secara keseluruhan, kode ini menjelaskan cara kerja spread operator, null-aware spread, list comprehension, dan list conditionals di Dart.
  
-----

# Praktikum 5 - Eksperimen Tipe Data Records

  ***Langkah 1:*** Ketik/salin kode berikut pada `main()`

  ```dart
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

   var swapped = tukar((10, 20));
   print('Sebelum tukar: (10, 20)');
   print('Sesudah tukar: $swapped');

   // Langkah 4
   print('Langkah 4');
   (String, int) mahasiswa = ('Rafi Ody Prasetyo', 2341720180);

   print(mahasiswa);
   print('Nama: ${mahasiswa.$1}');
   print('NIM : ${mahasiswa.$2}');
 
   // Langkah 5
   print('Langkah 5');
   var mahasiswa2 = ('first', a: 2, b: true, 'last');

   print(mahasiswa2.$1); // Prints 'first'
   print(mahasiswa2.a);  // Prints 2
   print(mahasiswa2.b);  // Prints true
   print(mahasiswa2.$2); // Prints 'last'
  }
  ```

  ***Langkah 2:*** Kemudian eksekusi kode tersebut.

  **Output:**

  
  ![praktikum5.dart](img/praktikum5.png)

  ***Ringkasan:*** Pada Langkah 1, dibuat record berisi string, integer, boolean, dan string, lalu ditampilkan seluruh isinya. Di Langkah 3, dibuat fungsi tukar yang menukar posisi dua nilai integer dalam sebuah record; hasil sebelum dan sesudah pertukaran ditampilkan. Selanjutnya, di Langkah 4, record digunakan untuk menyimpan data mahasiswa berupa nama dan NIM, yang kemudian diakses menggunakan properti $1 dan $2. Terakhir, di Langkah 5, record yang mirip dengan Langkah 1 ditampilkan elemen-elemennya satu per satu, baik melalui indeks ($1, $2) maupun nama field (a, b). Output yang dihasilkan sesuai dengan isi record, menampilkan data awal, hasil pertukaran nilai, informasi mahasiswa, serta akses elemen record satu per satu.

-----

#Tugas Praktikum

 1. Silakan selesaikan Praktikum 1 sampai 5, lalu dokumentasikan berupa screenshot hasil pekerjaan Anda beserta penjelasannya!
 2. Jelaskan yang dimaksud Functions dalam bahasa Dart!
    **Jawab:** Pada bahasa dart, function adalah blok kode yang dapat digunakan kembali (reusable) yang dirancang untuk melakukan tugas tertentu. Function membantu mengorganisir kode, membuatnya lebih mudah dibaca dan dipelihara, serta memungkinkan penggunaan kembali logika yang sama di berbagai bagian program tanpa harus menuliskannya berulang kali.
 3. Jelaskan jenis-jenis parameter di Functions beserta contoh sintaksnya!
    **Jawab:**
    - Required Parameters
      Required Parameters adalah parameter yang harus selalu disertakan saat memanggil sebuah function. Jika tidak menyertakannya, Dart akan mengeluarkan error saat kompilasi. Ini memastikan bahwa fungsi menerima semua data yang dibutuhkan untuk beroperasi dengan benar.
      Contoh:
      ```dart
      void sayHello(String nama, int nim) {
       print('Nama: $nama, NIM: $nim');
      }

      void main() {
      // Panggilan yang benar: semua parameter wajib disertakan
      sayHello('Rafi Ody Prasetyo', 2341720180);

      // Ini akan menghasilkan error, karena parameter age tidak disertakan
      // sayHello('Rafi');
      }
      ```
    - Optional Parameters
      Optional Parameters adalah parameter yang bisa dilewati saat memanggil sebuah fungsi. Dart menyediakan tiga jenis parameter opsional, masing-masing dengan kegunaan yang berbeda.
      
      - Optional Positional Parameters
        Parameter ini bersifat opsional dan harus diurutkan secara berurutan. Mereka didefinisikan di dalam tanda kurung siku []. Parameter ini dapat memberikan nilai default jika parameter tersebut tidak disertakan.
        Contoh:
        ```dart
        // Jika tidak diberikan, nilai defaultnya adalah ' ' dan ' '
        void fullname(String firstName, [String middleName = '', String lastName = '']) {
         print('Halo, $firstName $middleName $lastName');
        }

        void main() {
         // Panggilan yang menggunakan semua parameter
         fullname('Rafi', 'Ody', 'Prasetyo');
        `// Output: 'Halo, Rafi Ody Prasetyo'

         // Panggilan yang hanya menggunakan parameter pertama
         fullname('Rafi'); 
         // Output: 'Halo, Rafi  '
        }
        ```

      - Optional Named Parameters
        Parameter ini bersifat opsional dan diidentifikasi berdasarkan namanya, bukan posisinya. Parameter ini didefinisikan di dalam tanda kurung kurawal {}. Ini membuat kode lebih mudah dibaca, terutama saat fungsinya memiliki banyak parameter. Parameter ini juga dapat diatur menjadi wajib, dengan menambahkan kata kunci required.
        Contoh:
        ```dart
        void profile({String nama = 'Pengguna', int umur = 0, String kota = 'Tidak Diketahui'}) {
         print('Nama: $nama, Usia: $umur, Kota: $kota');
        }

        void main() {
         // Panggilan dengan menyertakan semua parameter opsional
         profile(nama: 'Rafi', umur: 20, kota: 'Malang');

         // Panggilan dengan hanya menyertakan satu parameter opsional
         profile(nama: 'Rafi'); 
         // Output: 'Nama: Rafi, Usia: 0, Kota: Tidak Diketahui'

         // Panggilan dengan parameter opsional yang berurutan secara acak
         profile(kota: 'Surabaya', umur: 22); 
         // Output: 'Nama: Pengguna, Usia: 22, Kota: Surabaya'
        }
        ```

 4. Jelaskan maksud Functions sebagai first-class objects beserta contoh sintaknya!
    **Jawab:**
    Konsep functions sebagai first-class objects berarti fungsi diperlakukan sama seperti objek lain (seperti String, int, atau List). Artinya, sebuah fungsi tidak memiliki batasan khusus dan dapat digunakan di mana pun sebuah objek dapat digunakan.
    Contoh:
    ```dart
    void halo(String nama) => print("Halo $nama");

    void jalankan(void Function(String) fungsi, String value) {
     fungsi(value);
    }

    void main() {
     var f = halo;        // Simpan fungsi dalam variabel
     f("Rafi");          // Panggil lewat variabel
        jalankan(halo, "Ody"); // Kirim fungsi sebagai parameter
    }

 5. Apa itu Anonymous Functions? Jelaskan dan berikan contohnya!
    **Jawab:** Anonymous Functions adalah sebuah fungsi yang tidak memiliki nama atau nama pengenal. Fungsi ini biasanya dibuat untuk sekali pakai atau untuk tugas yang sederhana dan spesifik.
    Contoh:
    ```dart
    void main() {
     var list = [1, 2, 3];
     list.forEach((item) {
        print("Angka: $item");
     });
    }
    ```

 6. Jelaskan perbedaan Lexical scope dan Lexical closures! Berikan contohnya!
    **Jawab:** Perbedaan utama adalah lexical scope (lingkup leksikal) adalah aturan bagaimana sebuah fungsi atau kode dapat mengakses variabel berdasarkan lokasi penulisan kode tersebut, sementara lexical closure adalah kemampuan sebuah fungsi untuk "mengingat" dan mengakses variabel dari lingkup leksikalnya bahkan setelah fungsi luar tempatnya dideklarasikan telah selesai dieksekusi.
    Contoh:
    Lexical Scope
    ```dart
    void main() {
     var x = 10;
     void tampil() {
        print(x); // Bisa akses x karena dalam lexical scope
     }
     tampil();
    }
    ```

    Lexical Closure
    ```dart
    Function hitung() {
     var counter = 0;
     return () {
        counter++;
        return counter;
     };
    }

    void main() {
     var tambah = hitung();
     print(tambah()); // 1
     print(tambah()); // 2
    }
    ```

 7. Jelaskan dengan contoh cara membuat return multiple value di Functions!
    **Jawab:** Pada bahasa pemrograman dart, fungsi hanya bisa mengembalikan satu nilai, namun kita dapat menggunakan record atau collection (List/Map) untuk mengembalikan banyak nilai sekaligus.
    Contoh:
    ```dart
    // Menggunakan record
    (String, int) biodata() {
     return ("Rifda", 12345678);
    }

    void main() {
     var (nama, nim) = biodata();
     print("Nama: $nama, NIM: $nim");
    }
    ```


