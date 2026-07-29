import 'package:cryptography/cryptography.dart';

typedef KeyDerivationParams = ({
  List<int> seed,
  List<int> salt,
  int iterations,
});

Future<String> deriveKeyHex(KeyDerivationParams params) async {
  final algorithm = Pbkdf2.hmacSha256(
    iterations: params.iterations,
    bits: 256,
  );
  final derivedKey = await algorithm.deriveKey(
    secretKey: SecretKey(params.seed),
    nonce: params.salt,
  );
  final bytes = await derivedKey.extractBytes();
  return bytes.map((b) => b.toRadixString(16).padLeft(2, '0')).join();
}
