import 'dart:io';
import 'dart:math';

void main() {
  stdout.write('How many lottery numbers do you want? ');
  int count = int.parse(stdin.readLineSync()!);

  stdout.write('What is the limit range for the lottery numbers? ');
  int maxN = int.parse(stdin.readLineSync()!);

  Random rnd = Random();

  var lottoNumbers = <int>{};

  bool isInvalid = true;
  int value;

  while (isInvalid) {
    value = rnd.nextInt(maxN) + 1;

    lottoNumbers.add(value);

    if (lottoNumbers.length == count) {
      isInvalid = false;
    }
  }

  print(lottoNumbers);
}
