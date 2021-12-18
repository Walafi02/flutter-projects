import 'package:arquitetura/app/models/apiadvisor_model.dart';
import 'package:arquitetura/app/repositories/apiadvisor_repository_interface.dart';
import 'package:flutter/cupertino.dart';

class ApiadviserViewModel {
  final IApiAdvisor repository;

  final apiadvisorModel = ValueNotifier<ApiadvisorModel?>(null);

  ApiadviserViewModel({
    required this.repository,
  });

  fill() async {
    try {
      apiadvisorModel.value = await repository.getTime();
    } catch (e) {
      print(e);
    }
  }
}
