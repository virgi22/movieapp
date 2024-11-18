import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:crypto/crypto.dart';  // Para generar el hash md5


class MarvelService {
  static const String baseUrl = 'https://gateway.marvel.com/v1/public/';
  static const String publicKey = 'cde0172af553734c053186ea39a69fdb';
  static const String privateKey = 'cf822fb50b35cecbdd96a8669fb778cd134e02f6';

  // Función para generar el hash necesario
  String _generateHash(String timestamp) {
    final input = timestamp + privateKey + publicKey;
    return md5.convert(utf8.encode(input)).toString();
  }

  // Función para obtener los personajes
  Future<List<dynamic>> fetchCharacters() async {
    final timestamp = DateTime.now().millisecondsSinceEpoch.toString();
    final hash = _generateHash(timestamp);
    final url = Uri.parse(
      '$baseUrl/characters?ts=$timestamp&apikey=$publicKey&hash=$hash',
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['data']['results'];
    } else {
      throw Exception('Error al cargar los personajes');
    }
  }
}
