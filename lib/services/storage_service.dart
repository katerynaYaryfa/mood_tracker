import 'package:shared_preferences/shared_preferences.dart';

const lastLoginTimestamp = 'last_login_timestamp';

class StorageService {
  Future<void> writeString({
    required String key,
    required String value,
  }) async {
    (await SharedPreferences.getInstance()).setString(key, value);
  }

  Future<void> writeInt({
    required String key,
    required int value,
  }) async {
    (await SharedPreferences.getInstance()).setInt(key, value);
  }

  Future<String?> readString({
    required String key,
  }) async {
    var readData = (await SharedPreferences.getInstance()).getString(key);
    return readData;
  }

  Future<int?> readInt({
    required String key,
  }) async {
    var readData = (await SharedPreferences.getInstance()).getInt(key);
    return readData;
  }

  Future<void> delete({
    required String key,
  }) async {
    await (await SharedPreferences.getInstance()).remove(key);
  }
}
