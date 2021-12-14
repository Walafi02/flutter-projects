import 'package:arquitetura/app/models/apiadvisor_model.dart';
import 'package:arquitetura/app/viewmodels/apiadvisor_viewmodel.dart';
import 'package:flutter/material.dart';

class HomeController {
  final ApiadviserViewModel viewModel;

  HomeController({required this.viewModel});

  ValueNotifier<ApiadvisorModel?> get time => viewModel.apiadvisorModel;

  getTime() {
    viewModel.fill();
  }
}
