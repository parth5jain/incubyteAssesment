import 'package:string_calculator/string_calculator.dart';

void main() {
  var calc = StringCalculator();
 
  var op0 = calc.add('');
  var op1 = calc.add('1');
  var op2 = calc.add('1,5');
  print(op0);
  print(op1);
  print(op2);
}
