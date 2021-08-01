part of 'calculator_bloc.dart';

@immutable
abstract class CalculatorEvent {}

class AddNumber extends CalculatorEvent{

}

class ResetAc extends CalculatorEvent{
  final String number;
  ResetAc(this.number);
}