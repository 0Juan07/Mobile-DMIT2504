import 'dart:convert'; // Needed for encode/decode JSON

import 'package:http/http.dart'
    as http; // Needed for HTTP requests (third pcks  )

String API_BASE_URL = 'https://freedictionaryapi.com/api/v1/entries/en/';

// MINE Version
// Future<dynamic> getJSON(String endpoint, String word) async {
//   final url = Uri.parse('$endpoint$word');
//   final response = await http.get(url);
//   return jsonDecode(response.body);
// }

// Teach

Future<dynamic> getJSON(String endpoint) async {
  final url = Uri.parse(endpoint);
  final response = await http.get(url);
  return jsonDecode(response.body);
}

Future<String> getDefinition(String word) async {
  String urlString = '${API_BASE_URL}${word}';

  var jsonData = await getJSON(urlString);

  return jsonData['entries'][0]['senses'][0]['definition'];
}
