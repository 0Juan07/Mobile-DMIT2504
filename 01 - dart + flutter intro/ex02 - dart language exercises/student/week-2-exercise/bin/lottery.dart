// 1. Program gonna run by itself, --> main
// 2. Handle command-line user inputs
// 3. Any function that returns a list of 6 ints, ranging from 1 - 49
// 4. Any function that ensures no duplicate on the results

//2. For command-line input I need to import dart:io

import 'dart:io';
import 'dart:math';

//1.
void main() {
  // I can use print() if I want an immediate new line or
  // stdout.write if I want input on the same line
  // print() is basically just shorthand for stdout.writeln
  stdout.write('How many lottery numbers to pick? ');
  int count = int.parse(stdin.readLineSync()!);

  stdout.write('What is the upper bound of numbers to pick? (inclusevly) ');
  int largestNum = int.parse(stdin.readLineSync()!);

  // print(count);

  //3. (logic by this time) generate {count} numbs between 1 and {largestNum}
  Random rng = Random();
  List<int> lottoNumbers = List.filled(count, 0);

  for (int i = 0; i < count; i++) {
    int value;

    value =
        rng.nextInt(largestNum) +
        1; //Random.nextInt(upperLimit), 0 >= x < upperLimit
    // so we add 1 to make it inclusive

    // print(value);

    // 4. to validate the duplicates, decrement the [i]
    if (lottoNumbers.contains(value)) {
      i--;
    } else {
      lottoNumbers[i] = value;
    }

    print(lottoNumbers.join(' '));
  }
}
