import 'package:firedart/firedart.dart' as firestore;
import 'package:firedart/firedart.dart';

class FirestoreDart {
  static final tokenStore = VolatileStore();
  static final auth =
      FirebaseAuth('AIzaSyDDKhxGavQbw_3-w9rNCa9p867KgYYVoss', tokenStore);
  static final instance = Firestore('fakehunter-861ee', auth: auth);

  static firestore.CollectionReference get userRef =>
      instance.collection('user');
  static firestore.CollectionReference get absensiRef =>
      instance.collection('absen');
}
