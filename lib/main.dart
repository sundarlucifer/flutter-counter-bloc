import 'package:counter_bloc/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/bloc/counter_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterBloc>(
          create: (_) => CounterBloc()..add(RefreshCounter()),
          child: MaterialApp(
        title: 'Counter Bloc',
        home: HomeScreen(),
      ),
    );
  }
}
