import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageService {
  final _secureStorage = const FlutterSecureStorage();

  Future<void> writeSecureData({
    required String key,
    required String value,
  }) async {
    await _secureStorage.write(key: key, value: value);
  }

  Future<String?> readSecureData({
    required String key,
  }) async {
    var readData = await _secureStorage.read(key: key);
    return readData;
  }

  Future<void> deleteSecureData({
    required String key,
  }) async {
    await _secureStorage.delete(
      key: key,
    );
  }
}
