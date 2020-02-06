import 'dart:io';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

///class hive_db
class Hivedb {
  static get dir async => (await getApplicationDocumentsDirectory()).path;

  /// hvConnect init
  static get hvConnect async {
    //print(directory.path);
    if (Platform.isAndroid || Platform.isIOS) {
      final directory = await Directory('${await dir}').create(recursive: true);
      return Hive.init('${directory.path}/hv_db');
    } else if (Platform.isMacOS || Platform.isWindows) {
      return Hive.init('hv_db');
    }
  }

  /// add data to resource hive_db
  void addHiveDb(Map<String, dynamic> model) async {
    final auth = await Hive.openBox('auth');
    auth.put(model['uid'], model);
  }

  ///GET DATA HIVEDB
  Future<dynamic> itemHiveDb() async {
    final auth = await Hive.openBox('auth');
    final data = auth.values;
    //print('total data ${data.length}');
    return data.last;
  }

  ///DELETE DATA HIVE DB
  Future<bool> deleteHiveDb(String uid) async {
    final auth = await Hive.openBox('auth');
    auth.delete(uid);
  }
}

void main() async {
  //Hive.init('somePath') -> not needed in browser
  Hivedb.hvConnect;
  final _repo = Hivedb();
  final model = {
    "uid": "jhgdahg_sdhahsd_sjhdgajshg_hshhasd",
    "name": 'ganti irfan',
    "email": 'irfan@gmail.com',
    "date": DateTime.now().millisecondsSinceEpoch,
  };
  //_repo.deleteHiveDb('jhgdahgsjhdgajshg_hshhasd');
  Future.delayed(Duration(seconds: 1), () async => _repo.addHiveDb(model));
  Future.delayed(Duration(seconds: 5),
      () async => print('Name: ${await _repo.itemHiveDb()}'));
}
