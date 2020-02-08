import 'package:dasar_flutter/config.dart';
import 'package:dasar_flutter/model/user.dart';

main(List<String> args) async {
  await FirestoreDart.auth.signIn('izal@gmail.com', '12345678');
  final user = await FirestoreDart.auth.getUser();
  print('user-auth $user');
  final model = User()
    ..email = 'izal@gmail.com'
    ..address = 'loremipsum'
    ..name = 'izal';

  FirestoreDart.userRef.document(user.id).update(model.toJson());
  FirestoreDart.userRef.stream.listen((event) {
    print('event $event');
  });
}
