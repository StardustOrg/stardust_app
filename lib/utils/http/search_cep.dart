import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:stardust_app_skeleton/models/cep.dart';

class SearchCep {
  static const String _viaCepUrl = 'https://viacep.com.br/ws/';

  static Future<Cep> searchCep(String cep) async {
    final response = await http.get(Uri.parse('$_viaCepUrl$cep/json'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return Cep(
        cep: data['cep'] ?? '',
        logradouro: data['logradouro'] ?? '',
        complemento: data['complemento'] ?? '',
        bairro: data['bairro'] ?? '',
        localidade: data['localidade'] ?? '',
        uf: data['uf'] ?? '',
      );
    } else {
      throw Exception('Failed to load address');
    }
  }
}
