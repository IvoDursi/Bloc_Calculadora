import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'calculator_event.dart';
part 'calculator_state.dart';

class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
  CalculatorBloc() : super(CalculatorState());

  @override
  Stream<CalculatorState> mapEventToState(
    CalculatorEvent event,
  ) async* {

    if(event is ResetAc) {
      yield* this._resetAC();

    } else if(event is AddNumber){
      yield state.copyWith(//Yield para emitir un nuevo estado, copyWith para mantenerlo
        mathResult: (state.mathResult == "0") 
        ? event.number 
        : state.mathResult + event.number
      );
    
    } else if(event is ChangeNegativePositive){
      yield state.copyWith(
        mathResult: state.mathResult.contains("-")
        ? state.mathResult.replaceFirst("-", "")
        : "-" + state.mathResult
      );
    } else if(event is DeleteLastEntry){
      yield state.copyWith(
        mathResult: state.mathResult.length > 1
        ? state.mathResult.substring(0, state.mathResult.length -1)
        : "0"
      );
    } else if(event is OperationEntry){
      yield state.copyWith(
        firstNumber: state.mathResult,
        mathResult: "0",
        operation: event.operation,
        secondNumber: "0"
      );
    } else if(event is CalculateResult){
      yield* this._calculateResult();
    }
  }

  Stream<CalculatorState> _resetAC() async*{
    yield CalculatorState(
      firstNumber: "0",
      mathResult: "0",
      secondNumber: "0",
      operation: ""
    );
  }

  Stream<CalculatorState> _calculateResult() async*{

    final double num1 = double.parse(state.firstNumber);
    final double num2 = double.parse(state.mathResult);

    switch(state.operation){

      case "+":
        yield state.copyWith(
          secondNumber: state.mathResult,
          mathResult: "${num1 + num2}"
        );
      break;
      default:
        yield state;
    }
  }
}
