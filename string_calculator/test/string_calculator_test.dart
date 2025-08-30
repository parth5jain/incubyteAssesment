import 'package:string_calculator/string_calculator.dart';
import 'package:test/test.dart';

void main() {
  group('StringCalculator TDD', () {
    test('empty string returns 0', () {
      final calc = StringCalculator();
      expect(calc.add(''), equals(0));
    });

    test('single number returns the number', () {
      final calc = StringCalculator();
      expect(calc.add('1'), equals(1));
    });

    test('two comma-separated numbers returns their sum', () {
      final calc = StringCalculator();
      expect(calc.add('1,5'), equals(6));
    });

    // Step 2: Handle any amount of numbers
    test('three comma-separated numbers returns their sum', () {
      final calc = StringCalculator();
      expect(calc.add('1,2,3'), equals(6));
    });

    test('five comma-separated numbers returns their sum', () {
      final calc = StringCalculator();
      expect(calc.add('1,2,3,4,5'), equals(15));
    });

    // Step 3: Support new lines between numbers
    test('newline between numbers returns their sum', () {
      final calc = StringCalculator();
      expect(calc.add('1\n2,3'), equals(6));
    });

    test('multiple newlines between numbers returns their sum', () {
      final calc = StringCalculator();
      expect(calc.add('1\n2\n3'), equals(6));
    });

    test('mixed newlines and commas returns their sum', () {
      final calc = StringCalculator();
      expect(calc.add('1\n2,3\n4'), equals(10));
    });

    test('handles consecutive delimiters correctly', () {
      final calc = StringCalculator();
      expect(calc.add('1,\n2'), equals(3));
      expect(calc.add('1\n,2'), equals(3));
    });

    test('handles whitespace around delimiters', () {
      final calc = StringCalculator();
      expect(calc.add(' 1 \n 2 , 3 '), equals(6));
    });
  });
}
