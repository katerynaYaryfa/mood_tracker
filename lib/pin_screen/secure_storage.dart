import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageService {
  final _secureStorage = const FlutterSecureStorage();

  Future<void> writeSecureData(String value, String key) async {
    await _secureStorage.write(key: key, value: value);
  }

  Future<String?> readSecureData(String key) async {
    var readData = await _secureStorage.read(key: key);
    return readData;
  }
}

void dkejdkewj() {
  var storageServices = StorageService();
  storageServices.writeSecureData('1234', 'pin');
}
