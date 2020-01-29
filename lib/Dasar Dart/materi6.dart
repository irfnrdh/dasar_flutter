// Materi 6: Konsep pewarisan

import 'package:dasar_flutter/materi5.dart';

class MahasiswaTeknik extends Mahasiswa {
  String kampus = 'AkuNgeblog.com';
  MahasiswaTeknik(String nim, String nama) : super(nim, nama);
}

class Hewan {
  String nama, suara;
}

class Unggas extends Hewan {
  String jenisBulu;
}

class Reptil extends Hewan {
  String bentukSisik;
}

class KebunBinatang {
  List<Hewan> koleksi = [];
}

main() {
  var budi = new MahasiswaTeknik('18111', 'Budi Setiawan');
  budi.jurusan = "Pertanian";

  var ayam = new Unggas();
  ayam.nama = "Ayam Jago";
  ayam.suara = "Petok";
  ayam.jenisBulu = 'Halus';

  var kadal = new Reptil();
  kadal.nama = 'Kampung Dalam';
  kadal.suara = 'huaar';
  kadal.bentukSisik = 'kecil';

  var zoo = new KebunBinatang();
  zoo.koleksi.add(ayam);
  zoo.koleksi.add(kadal);
}
