void main() {
  var gifts = {'first': 'partridge', 'second': 'turtledoves', 'fifth': 1};

  var nobleGases = {2: 'hellium', 10: 'neon', 18: 2};

  print(gifts);
  print(nobleGases);

  var mhs1 = Map<String, String>();
  gifts['first'] = 'partridge';
  gifts['second'] = 'turtledoves';
  gifts['fifth'] = 'golden rings';

  var mhs2 = Map<int, String>();
  nobleGases[2] = 'helium';
  nobleGases[10] = 'neon';
  nobleGases[18] = 'argon';

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
}
