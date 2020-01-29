// materi ke 8 : fungsi

String namaLengkap() {
  String namaDepan = "Irfannur";
  String namaBelakang = "Diah";
  return '$namaDepan $namaBelakang';
}

int panjangNama(String text) {
  return text.length; // returns length of text
}

main() {
  print(namaLengkap());
  print(panjangNama(namaLengkap()));
}
