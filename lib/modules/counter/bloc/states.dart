
abstract class CounterState{}

class CounterInitialState extends CounterState{}
class CounterPlusState extends CounterState{
  // i want to send the value with the class
  final int counter;
  CounterPlusState(this.counter);
}
class CounterMinusState extends CounterState{
  final int counter;
  CounterMinusState(this.counter);
}


