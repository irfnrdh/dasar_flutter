import 'dart:io';

main() {
  // mencetak teks ke layar
  print('Saya sedang belajar flutter');

  // Pengenalan Variabel
  // Dua cara deklarasi variabel di dart

  // a. Deklarasi implisit (tipe datanya tidak ditentutakan)

  var nama = "Irfannur Diah"; //String
  var nilai = 10; //int
  var ipk = 3.8; // double
  var kondisi = false; //boolean

  // b. Deklarasi eksplisit (tipe data didefenisikan)

  String name = 'Irfannur Diah';
  int value = 10;
  double degree = 18.8;
  bool condition = false;

  // mencetak isi variabel ke layar
  print('Isi dari variabel nama adalah $nama');

  // menerima masukan dari user
  print('Masukan email anda: ');
  var email = stdin.readLineSync();
  print('Alamar email anda adalah $email');
}
