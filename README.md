# Codelab 07

  * **Nama:** Rafi Ody Prasetyo
  * **NIM:** 2341720180
  * **Kelas:** TI-3F
  * **Absen:** 24

-----

# Praktikum Menerapkan Plugin

  1. Tambahkan plugin `auto_size_text` menggunakan terminal dengan perintah berikut:
     ```dart flutter pub add auto_size_text```
     Jika berhasil maka akan menghasilkan `auto_text_size` pada bagian dependencies yang berada di dalam file `pubspec.yaml`.
     ```dart
     dependencies:
       flutter:
         sdk: flutter
         cupertino_icons: ^1.0.8
         auto_size_text: ^3.0.0

      dev_dependencies:
       flutter_test:
       sdk: flutter
       flutter_lints: ^5.0.0
     ```
    
  3. Buat file baru bernama red_text_widget.dart di dalam folder lib lalu isi kode seperti berikut.
     ```dart
       import 'package:flutter/material.dart';

       class RedTextWidget extends StatelessWidget {
         const RedTextWidget({Key? key}) : super(key: key);

         @override
         Widget build(BuildContext context) {
           return Container();
         }
        }
   ```

  3. 
