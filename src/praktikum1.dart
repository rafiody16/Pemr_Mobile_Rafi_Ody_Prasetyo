void main() {
  // Langkah 1
  // var list = [1, 2, 3];

  // assert(list.length == 3);
  // assert(list[1] == 2);
  // print(list.length);
  // print(list[1]);

  // list[1] = 1;
  // assert(list[1] == 1);
  // print(list[1]);

  final List<String?> list = List.filled(5, null, growable: false);

  list[1] = "Rafi Ody Prasetyo";
  list[2] = "2341720180";

  print(list);
}
