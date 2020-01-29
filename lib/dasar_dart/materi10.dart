// materi ke 10 : List array

// membuat list berupa angka
var kumpulanAngka = [1, 2, 3, 4, 5, 6, 7, 8];

// membuat list berupa string
// bisa dimualai var atau list
List kumpulanNegara = <String>['Indonesia', 'Malaysia', 'Brunei Darussalam'];

// menghitung jumlah list
int jumlahAngka = kumpulanAngka.length;
int jumlahNegara = kumpulanNegara.length;

// memanggil index pada list
String negaraPilihan = kumpulanNegara[1];
int angkaPilihan = kumpulanAngka[0];

// membuat list dengan ukuran yang sudah ditentukan
var listTerbatas = new List(3);
// membuat list dengan tipe string
var lisTerbatas = new List<String>();

// Membuat map dengan key dan value
Map<int, dynamic> data = {0: "Saya", 1: "aku"};

main() {
  // Menambah ke list
  kumpulanNegara.add("Singapura");

  // Menampilkan List Pilihan
  print('$negaraPilihan $angkaPilihan');

  // Menghapus item pada list
  kumpulanNegara.remove("Indonesia");

  // Menampilkan dalam bentuk List
  print(kumpulanNegara);

  // Menampilkan dalam bentuk map
  kumpulanNegara.map((it) {
    print(it);
  }).toList();

  // Menampilkan dalam bentuk foreach
  kumpulanNegara.forEach((it) {
    print(it);
  });

  // Menampilkan item pilihan pada map
  print(data[1]);

  // Menampilkan semua item map dengan foreach
  data.values.forEach((it) => print(it));

  // Menampilkan semua item map dengan for
  for (var i = 0; i < data.length; i++) {
    print(data[i]);
  }
}
