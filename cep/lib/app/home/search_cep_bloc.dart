import 'dart:async';

import 'package:dio/dio.dart';
import 'package:rxdart/rxdart.dart';

abstract class SearchCepState {}

class SearchCepSuccess extends SearchCepState {
  final Map data;

  SearchCepSuccess(this.data);
}

class SearchCepLoading extends SearchCepState {}

class SearchCepError extends SearchCepState {
  final String message;

  SearchCepError(this.message);
}

class SearchCepBox {
  final _streamController = StreamController<String>.broadcast();

  Sink<String> get searchCep => _streamController.sink;

  Stream<SearchCepState> get cepResult =>
      _streamController.stream.switchMap(_searchCepString);

  Stream<SearchCepState> _searchCepString(String cep) async* {
    yield SearchCepLoading();
    try {
      final response = await Dio().get("https://viacep.com.br/ws/$cep/json/");

      yield SearchCepSuccess(response.data);
    } catch (e) {
      yield SearchCepError("Error identificado!");
    }
  }

  void disposet() {
    _streamController.close();
  }
}
