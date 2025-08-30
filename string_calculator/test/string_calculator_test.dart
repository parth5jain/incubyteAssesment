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

    // Step 4: Custom Delimiters
    test('custom semicolon delimiter returns correct sum', () {
      final calc = StringCalculator();
      expect(calc.add('//;\n1;2'), equals(3));
    });

    test('custom pipe delimiter returns correct sum', () {
      final calc = StringCalculator();
      expect(calc.add('//|\n1|2|3'), equals(6));
    });

    test('custom hash delimiter returns correct sum', () {
      final calc = StringCalculator();
      expect(calc.add('//#\n1#2#3#4'), equals(10));
    });

    test('custom delimiter with single number', () {
      final calc = StringCalculator();
      expect(calc.add('//*\n5'), equals(5));
    });

    test('custom delimiter maintains backward compatibility', () {
      final calc = StringCalculator();
      expect(calc.add('1,2,3'), equals(6));
      expect(calc.add('1\n2\n3'), equals(6));
    });

    test('custom delimiter with special regex characters', () {
      final calc = StringCalculator();
      expect(calc.add('//.\n1.2.3'), equals(6));
      expect(calc.add('//+\n1+2+3'), equals(6));
      expect(calc.add('//?\n1?2?3'), equals(6));
    });

    test('custom delimiter with multiple special characters', () {
      final calc = StringCalculator();
      expect(calc.add('//[+]\n1[+]2[+]3'), equals(6));
    });

    // Step 5: Negative Number Validation
    test('single negative number throws exception with correct message', () {
      final calc = StringCalculator();
      expect(
        () => calc.add('-1'),
        throwsA(
          predicate(
            (e) => e.toString().contains('negative numbers not allowed -1'),
          ),
        ),
      );
    });

    test(
      'multiple negative numbers throws exception with all negative numbers',
      () {
        final calc = StringCalculator();
        expect(
          () => calc.add('1,-2,3,-4'),
          throwsA(
            predicate(
              (e) =>
                  e.toString().contains('negative numbers not allowed -2,-4'),
            ),
          ),
        );
      },
    );

    test('all negative numbers throws exception with all numbers listed', () {
      final calc = StringCalculator();
      expect(
        () => calc.add('-1,-2,-3'),
        throwsA(
          predicate(
            (e) =>
                e.toString().contains('negative numbers not allowed -1,-2,-3'),
          ),
        ),
      );
    });

    test('negative numbers with custom delimiter throws exception', () {
      final calc = StringCalculator();
      expect(
        () => calc.add('//;\n1;-2;3'),
        throwsA(
          predicate(
            (e) => e.toString().contains('negative numbers not allowed -2'),
          ),
        ),
      );
    });

    test('negative numbers with newlines throws exception', () {
      final calc = StringCalculator();
      expect(
        () => calc.add('1\n-2,3'),
        throwsA(
          predicate(
            (e) => e.toString().contains('negative numbers not allowed -2'),
          ),
        ),
      );
    });

    test('zero and negative numbers mixed', () {
      final calc = StringCalculator();
      expect(
        () => calc.add('0,-1,2,-3'),
        throwsA(
          predicate(
            (e) => e.toString().contains('negative numbers not allowed -1,-3'),
          ),
        ),
      );
    });

    test('large negative numbers handled correctly', () {
      final calc = StringCalculator();
      expect(
        () => calc.add('-999,-1000'),
        throwsA(
          predicate(
            (e) => e.toString().contains(
              'negative numbers not allowed -999,-1000',
            ),
          ),
        ),
      );
    });
  });
}
