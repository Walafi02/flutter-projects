import 'package:exemplos_bloc/src/Exemplo01/counter_cubit.dart';
import 'package:exemplos_bloc/src/Exemplo01/counter_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Exemplo01 extends StatelessWidget {
  const Exemplo01({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exemplo 01',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (_) => CounterCubit(),
        child: CounterPage(),
      ),
    );
  }
}
