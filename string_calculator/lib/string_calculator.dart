/// Support for doing something awesome.
///
/// More dartdocs go here.
library;

// TODO: Export any libraries intended for clients of this package.

class StringCalculator {
  int add(String numbers) {
    if (numbers.isEmpty) return 0;

    // Split by comma or newline, filter out empty strings, and convert to integers
    final numberList =
        numbers
            .split(RegExp(r'[,|\n]'))
            .map((num) => num.trim())
            .where((num) => num.isNotEmpty)
            .map((num) => int.parse(num))
            .toList();

    // Return sum of all numbers
    return numberList.fold(0, (sum, number) => sum + number);
  }
}
