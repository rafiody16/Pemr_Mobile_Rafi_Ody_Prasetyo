void main() {
  // Praktikum 3 - Menerapkan Perulangan "for" dan "break-continue"

  // Langkah 1:
  // for (Index = 10; index < 27; index) {
  //   print(Index);
  // }

  // Perbaikan Langkah 1:
  // for (int index = 10; index < 27; index++) {
  //   print(index);
  // }

  // Langkah 3:
  // If (Index == 21) break;
  // Else If (index > 1 || index < 7) continue;
  // print(index);

  // Perbaikan Langkah 3:
  for (int index = 10; index < 27; index++) {
    if (index == 21)
      break;
    else if (index > 1 && index < 7)
      continue;
    print(index);
  }
}
