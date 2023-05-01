import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const pinKey = 'pin';

class StorageService {
  final _secureStorage = const FlutterSecureStorage();

  Future<void> write({required String key, required String value}) async {
    await _secureStorage.write(key: key, value: value);
  }

  Future<String?> read({
    required String key,
  }) async {
    var readData = await _secureStorage.read(key: key);
    return readData;
  }

  Future<void> delete({
    required String key,
  }) async {
    await _secureStorage.delete(
      key: key,
    );
  }
}
