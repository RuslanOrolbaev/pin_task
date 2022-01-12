import 'package:pin_task/model/i_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage implements IStorage {
  @override
  Future<List<String>?>? loadData(String uid) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? storedPin = prefs.getStringList(uid);
    return Future.value(storedPin);
  }

  @override
  Future<void> saveData(pin, [String? uid]) async {
    assert(uid != null);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList(uid!, pin as List<String>);
  }
}
