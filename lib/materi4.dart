// Materi 4 : Membuat Fungsi

// a. fungsi void
perkalian(int angka1, int angka2) {
  var hasil = angka1 * angka2;
  print('Hasil perkalian dari $angka1 * $angka2 = $hasil');
}

// b. fungsi return
pembagian(double angka1, double angka2) {
  var hasil = angka1 / angka2;
  return hasil;
}

main() {
  perkalian(88, 38);

  var x = pembagian(100.1, 87.8);
  print('hasil pembagian adalah $x');
}
