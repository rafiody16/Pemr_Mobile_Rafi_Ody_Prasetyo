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
