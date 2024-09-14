import 'package:stardust_app_skeleton/models/cep.dart';
import 'package:stardust_app_skeleton/utils/http/search_cep.dart';

class Store {
  String name, cep, email, id, insta, icon, cover;

  Store({
    required this.name,
    required this.cep,
    required this.email,
    required this.id,
    required this.insta,
    required this.icon,
    required this.cover,
  });

  // Method to get localidade and uf using SearchCep class
  Future<String> getLocalidadeUf() async {
    Cep cepData = await SearchCep.searchCep(cep);
    return '${cepData.localidade}, ${cepData.uf}';
  }
}
