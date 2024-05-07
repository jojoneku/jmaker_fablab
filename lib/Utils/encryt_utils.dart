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

  static String decrypt(String encryptedString) {
    //? example of how to use decryption
    //* note: encrypted.base64 is the scanned qr value
    // final decrypt = EncryptUtils.decrypt(encrypted.base64);

    final String uid = encryptedString.substring(0, 28);
    final String keyString = ('flab$uid');
    final Key key = Key.fromUtf8(keyString.substring(0, 32));
    final Encrypter encrypter = Encrypter(AES(key, mode: AESMode.cbc));
    final IV initVector = IV.fromUtf8(keyString.substring(0, 16));
    Encrypted encryptedData = Encrypted.fromBase64(encryptedString);

    return encrypter.decrypt(encryptedData, iv: initVector);
  }
}
