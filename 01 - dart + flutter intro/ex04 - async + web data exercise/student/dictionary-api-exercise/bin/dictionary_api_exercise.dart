// 1. Get user input for a word to lookup
// 2. I need a function that:
//        - attach that value to the end of a URL
//        - send a get request at that URL
//        - tries to return the JSON-decoded body of that
// 3. Loop this until the user quits
// 4. Create a class to represent the returned word
import 'dart:io';

import 'package:dictionary_api_exercise/http_requests.dart';

void main() async {
  // MINE Version
  // stdout.write("Enter the word to lookup: ");
  // String word = stdin.readLineSync()!;

  // var wordData = await getJSON(API_WORKING_BASE_URL, word);

  // print('Word: ${wordData['word']}');

  // Teach
  print("What word want to look up? ");
  String word = stdin.readLineSync()!;

  final definition = await getDefinition(word);

  print('This is the $definition');
}
