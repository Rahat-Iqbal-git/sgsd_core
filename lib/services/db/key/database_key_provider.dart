import 'dart:convert';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:sgsd_core/services/db/key/key_derivation.dart';

const _seedStorageKey = 'sgsd_db_seed_v1';
const _saltStorageKey = 'sgsd_db_salt_v1';
const _seedLengthBytes = 32;
const _saltLengthBytes = 16;
const _pbkdf2Iterations = 150000;

@lazySingleton
class DatabaseKeyProvider {
  DatabaseKeyProvider(this._secureStorage);

  final FlutterSecureStorage _secureStorage;
  final Random _random = Random.secure();

  Future<String> databaseKey() async {
    final seed = await _readOrCreateSecret(_seedStorageKey, _seedLengthBytes);
    final salt = await _readOrCreateSecret(_saltStorageKey, _saltLengthBytes);
    return compute(deriveKeyHex, (
      seed: seed,
      salt: salt,
      iterations: _pbkdf2Iterations,
    ));
  }

  Future<List<int>> _readOrCreateSecret(String key, int lengthBytes) async {
    final existing = await _secureStorage.read(key: key);
    if (existing != null) {
      return base64Decode(existing);
    }

    final bytes = List<int>.generate(lengthBytes, (_) => _random.nextInt(256));
    await _secureStorage.write(key: key, value: base64Encode(bytes));
    return bytes;
  }
}
