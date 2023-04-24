import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// TODO you always create new instance of StorageService. It means that FlutterSecureStorage
// TODO creates new instance every time too.
// TODO It is needed to create only one instance of StorageService and put it into Provider.
// TODO then you can use your service inside ChangeNotifier by providing it through constructor.
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
