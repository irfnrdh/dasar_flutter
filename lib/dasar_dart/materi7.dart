// materi ke 7 : String Interpolation

main() {
  int x = 5;
  int y = 10;

  String penjumlahan = '${x + y}';
  String pengurangan = '${x - y}';
  String besarHuruf = '${'akungeblog'.toUpperCase()}';
  String concatXY = '$x$y';

  print(penjumlahan);
  print(pengurangan);
  print(besarHuruf);
  print(concatXY);
}
