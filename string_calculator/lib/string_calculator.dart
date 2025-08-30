/// Support for doing something awesome.
///
/// More dartdocs go here.
library;

class StringCalculator {
  int add(String numbers) {
    if (numbers.isEmpty) return 0;

    String delimiter = ',';
    String numbersToProcess = numbers;

    // Check if custom delimiter is specified
    if (numbers.startsWith('//')) {
      final delimiterEndIndex = numbers.indexOf('\n');
      if (delimiterEndIndex != -1) {
        delimiter = numbers.substring(2, delimiterEndIndex);
        numbersToProcess = numbers.substring(delimiterEndIndex + 1);
      }
    }

    // Split by the appropriate delimiter(s) and convert to integers
    final numberList =
        numbersToProcess
            .split(
              RegExp(delimiter == ',' ? r'[,|\n]' : RegExp.escape(delimiter)),
            )
            .map((num) => num.trim())
            .where((num) => num.isNotEmpty)
            .map((num) => int.parse(num))
            .toList();

    // Check for negative numbers and collect them
    final negativeNumbers = numberList.where((num) => num < 0).toList();
    if (negativeNumbers.isNotEmpty) {
      final negativeNumbersStr = negativeNumbers.join(',');
      throw FormatException('negative numbers not allowed $negativeNumbersStr');
    }

    // Filter out numbers bigger than 1000 and return sum
    final validNumbers = numberList.where((num) => num <= 1000).toList();
    return validNumbers.fold(0, (sum, number) => sum + number);
  }
}
