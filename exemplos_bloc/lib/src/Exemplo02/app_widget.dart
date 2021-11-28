import 'package:exemplos_bloc/src/Exemplo02/counter_bloc.dart';
import 'package:exemplos_bloc/src/Exemplo02/counter_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Exemplo02 extends StatelessWidget {
  const Exemplo02({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exemplo 01',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (_) => CounterBloc(),
        child: CounterPage(),
      ),
    );
  }
}
