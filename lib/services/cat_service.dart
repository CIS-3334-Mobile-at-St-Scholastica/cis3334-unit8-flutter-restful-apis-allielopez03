import 'dart:convert';
import 'package:http/http.dart' as http;
import '../data_models/cat_fact_model.dart';

class CatService {
  Future<CatFact> fetchCatFact() async {
    final response = await http.get(Uri.parse('https://catfact.ninja/fact'));

    if (response.statusCode == 200) {
      return CatFact.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load cat fact');
    }
  }
}

