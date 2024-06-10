import 'dart:convert';
import 'dart:math';
import 'package:crypto/crypto.dart' as crypto;

class API {
  String? sign;
  late String salt;

  API() {
    String apiKey = "viaviweb";
    salt = getRandomSalt().toString();
    sign = md5(apiKey + salt);
  }

  int getRandomSalt() {
    Random random = Random();
    return random.nextInt(900);
  }

  String md5(String input) {
    var content = utf8.encode(input);
    var digest = crypto.md5.convert(content);
    return digest.toString();
  }

  static String toBase64(String input) {
    var encodeValue = base64.encode(utf8.encode(input));
    return encodeValue;
  }

  // Convert the API instance to a map
  Map<String, String> toJson() {
    return {
      'sign': sign ?? '',
      'salt': salt,
    };
  }
}
