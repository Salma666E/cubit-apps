import 'package:flutter_bloc/flutter_bloc.dart';

//  A Cubit can expose functions which can be invoked to trigger state changes.
class CounterCubit extends Cubit<int>{
  CounterCubit(): super(0);
  void increment()=> emit(state+1);
  void decrement()=> emit(state-1);
}