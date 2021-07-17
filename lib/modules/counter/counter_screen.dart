import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test1/modules/counter/bloc/cubit_or_bloc.dart';
import 'package:test1/modules/counter/bloc/states.dart';

class CounterScreen extends StatelessWidget {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(), //return the block provider
      child: BlocConsumer<CounterCubit, CounterState>(
        // it make me listen all changes and states in the app . he will operate the block
        listener: (context,CounterState state) {
          // if i need to know where iam in any state
          // if(state is CounterInitialState) print('initial state'); it disappear because he start with it
          if(state is CounterMinusState) {
            //print('Minus state ${state.counter}');
          }
          //by this ${state.counter} i could send data to ui with state
          if(state is CounterPlusState) {
            //print('Plus state ${state.counter}');
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text('counter'),
              centerTitle: true,
            ),
            body: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () {
                        CounterCubit.get(context).minus();
                      },
                      child: Text(
                        'Minus',
                        style: TextStyle(
                            fontSize: 30.0, fontWeight: FontWeight.bold),
                      )),
                  SizedBox(
                    width: 5.0,
                  ),
                  Text(
                    '${CounterCubit.get(context).counter}',
                    style:
                        TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  TextButton(
                      onPressed: () {
                        CounterCubit.get(context).plus();

                      },
                      child: Text(
                        'plus',
                        style: TextStyle(
                            fontSize: 30.0, fontWeight: FontWeight.bold),
                      )),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
