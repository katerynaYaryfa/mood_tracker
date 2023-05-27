import 'package:shared_preferences/shared_preferences.dart';

const lastLoginTimeKey = 'last_login_time';

class StorageService {
  Future<void> write({
    required String key,
    required String value,
  }) async {
    (await SharedPreferences.getInstance()).setString(key, value);
  }

  Future<String?> read({
    required String key,
  }) async {
    var readData = (await SharedPreferences.getInstance()).getString(key);
    return readData;
  }

  Future<void> delete({
    required String key,
  }) async {
    await (await SharedPreferences.getInstance()).remove(key);
  }
}
