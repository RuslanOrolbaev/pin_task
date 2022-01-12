import 'package:pin_task/model/i_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pin_task/constants.dart' as constants;

class LocalStorage implements IStorage {
  @override
  Future<List<String>>? loadData(String uid) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? storedPin = prefs.getStringList(uid);
    return Future.value(storedPin);
  }

  @override
  Future<void> saveData(pin) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList(constants.keyForPinInSharedPrefs, pin as List<String>);
  }
}
