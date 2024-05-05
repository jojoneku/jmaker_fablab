import 'package:encrypt/encrypt.dart';

class EncryptUtils {
  EncryptUtils._();
  static Encrypted encrypt(String keyString, String plainText) {
    keyString = ('flab$keyString');
    final Key key = Key.fromUtf8(keyString.substring(0, 32));
    final Encrypter encrypter = Encrypter(AES(key, mode: AESMode.cbc));
    final IV initVector = IV.fromUtf8(keyString.substring(0, 16));
    Encrypted encryptedData = encrypter.encrypt(plainText, iv: initVector);
    return encryptedData;
  }

  static String decrypt(String keyString, String encryptedString) {
    keyString = ('flab$keyString');
    final Key key = Key.fromUtf8(keyString.substring(0, 32));
    final Encrypter encrypter = Encrypter(AES(key, mode: AESMode.cbc));
    final IV initVector = IV.fromUtf8(keyString.substring(0, 16));
    Encrypted encryptedData = Encrypted.fromBase64(encryptedString);

    return encrypter.decrypt(encryptedData, iv: initVector);
  }
}
