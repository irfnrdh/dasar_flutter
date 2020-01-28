// materi ke 9 : Parsing

main() {
  var a = "121";
  var b = "120.56";
  var c = "100.a12";
  var d = "abc";

  int parseA = int.tryParse(a);
  double parseB = double.tryParse(b);
  double parseC = double.tryParse(c);
  double parseD = double.tryParse(d);

  print(parseA);
  print(parseB);
  print(parseC);
  print(parseD);
}
