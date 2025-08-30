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
  });
}
