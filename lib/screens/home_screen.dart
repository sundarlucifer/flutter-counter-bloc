import 'package:counter_bloc/blocs/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter Bloc'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              context.bloc<CounterBloc>().add(RefreshCounter());
            },
          ),
        ],
      ),
      body: BlocBuilder<CounterBloc, CounterState>(
        builder: (context, state) => _buildBody(state),
      ),
    );
  }

  _buildBody(state) {
    int count = 0;
    if (state is CounterInitial) {
      count = 0;
    } else if (state is CounterRunning) {
      count = state.count;
    }
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Counter: $count',
            style: TextStyle(fontSize: 36.0),
          ),
          FlatButton(
            child: Text('Increment'),
            onPressed: () =>
                context.bloc<CounterBloc>().add(IncrementCounter(count: count)),
          ),
        ],
      ),
    );
  }
}
