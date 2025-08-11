// Package imports:
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class SecureStorage {
  Future<void> write({required String key, required String value});

  Future<String?> read({required String key});

  Future<void> delete({required String key});

  Future<bool> containsKey({required String key});
}

class SecureStorageImpl implements SecureStorage {
  final FlutterSecureStorage _flutterSecureStorage =
      const FlutterSecureStorage();

  @override
  Future<void> write({required String key, required String value}) async {
    await _flutterSecureStorage.write(key: key, value: value);
  }

  @override
  Future<String?> read({required String key}) async {
    return await _flutterSecureStorage.read(key: key);
  }

  @override
  Future<void> delete({required String key}) async {
    await _flutterSecureStorage.delete(key: key);
  }

  @override
  Future<bool> containsKey({required String key}) async {
    return await _flutterSecureStorage.containsKey(key: key);
  }
}
