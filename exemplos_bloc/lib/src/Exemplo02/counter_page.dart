import 'package:exemplos_bloc/src/Exemplo02/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<CounterBloc, int>(
          builder: (context, count) => Text(
            "Counter $count",
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: BlocBuilder<CounterBloc, int>(
        builder: (context, count) => Center(
          child: Text(count.toString()),
        ),
      ),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              context.read<CounterBloc>().add(Increment());
              // increment();
            },
          ),
          SizedBox(
            height: 10,
          ),
          FloatingActionButton(
            child: Icon(Icons.remove),
            onPressed: () {
              context.read<CounterBloc>().add(Decrement());
            },
          )
        ],
      ),
    );
  }
}
