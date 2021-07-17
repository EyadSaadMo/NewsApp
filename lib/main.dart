import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:test1/layout/home_layout.dart';
import 'package:test1/shared/components/bloc_observer.dart';

import 'modules/counter/counter_screen.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeLayout(),
    );
  }
}
