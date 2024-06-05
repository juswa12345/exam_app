import 'dart:convert';

import 'package:exam_app/src/model/person.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  Future<List<Person>?> getPerson(int pages) async {
    final url = 'https://fakerapi.it/api/v1/persons?_quantity=$pages';

    final uri = Uri.parse(url);

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final json = response.body;

      final decodedJson = jsonDecode(json);

      final encodedJson = jsonEncode(decodedJson['data']);

      return personFromJson(encodedJson);
    }
    return null;
  }
}
