import 'package:exemplos_bloc/src/Exemplo01/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<CounterCubit, int>(
          builder: (context, count) => Text(
            "Counter $count",
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: BlocBuilder<CounterCubit, int>(
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
              context.read<CounterCubit>().increment();
            },
          ),
          SizedBox(
            height: 10,
          ),
          FloatingActionButton(
            child: Icon(Icons.remove),
            onPressed: () {
              context.read<CounterCubit>().dencrement();
            },
          )
        ],
      ),
    );
  }
}
