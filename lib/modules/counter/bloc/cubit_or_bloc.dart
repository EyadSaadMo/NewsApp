import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test1/modules/counter/bloc/states.dart';
class CounterCubit extends Cubit<CounterState>{
  CounterCubit () : super(CounterInitialState());

  static CounterCubit get(context) => BlocProvider.of(context);
  // to be more easily when use this cubit in many places
  // is a way to call object from any bloc => BlocProvider.of(context)
   int counter =1;
   void minus(){
     counter--;
     // i need to change state so i use emit => mean change
     emit(CounterMinusState(counter)); // to move if it is not found it not change
   }
  void plus(){
    counter++;
    emit(CounterPlusState(counter));
  }
}
