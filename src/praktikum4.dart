void main() {
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
}
