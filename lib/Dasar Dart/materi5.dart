// Materi 5: Membuat class dan Object

class Mahasiswa {
  String nim, nama, jurusan;
  int kelahiran;
  double ipk;

  // membuat method mahasiswa
  Mahasiswa(this.nim, this.nama);

  // fungsi menjadi string
  String toString() {
    return '[$nim, $nama, $jurusan, $kelahiran, $ipk]';
  }

  // membuat fungsi mengecek IPK
  cekLulus() {
    if (ipk > 3.0) {
      print('Nilai IPK lumayan tinggi');
    } else {
      print('Nilai IPK terlalu rendah');
    }
  }
}

main() {
  var irfan = new Mahasiswa('187038039', 'Irfannur Diah');

  // cara pertama menambahkan attribut
  irfan.jurusan = 'Teknik Informatika';
  irfan.kelahiran = 1995;

  // cara kedua menambahkan attribut
  irfan
    ..jurusan = 'Teknik Informatika'
    ..kelahiran = 1995
    ..ipk = 3.8;

  print(irfan);
  irfan.cekLulus();
}
