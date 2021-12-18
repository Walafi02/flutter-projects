import 'package:arquitetura/app/interfaces/client_http_services_interfice.dart';
import 'package:arquitetura/app/models/apiadvisor_model.dart';
import 'package:arquitetura/app/repositories/apiadvisor_repository.dart';
import 'package:arquitetura/app/viewmodels/apiadvisor_viewmodel.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class ClientHttpServicesMock implements IclientHttp {
  @override
  void addToken(String token) {}

  @override
  Future get(String url) async {
    return [
      ApiadvisorModel(
        country: "Ocara",
        text: "ok",
        date: "17/12/2021",
      ).toJson()
    ];
  }
}

class ClientHttpMockto extends Mock implements IclientHttp {}

void main() {
  final mock = ClientHttpMockto();
  final viewModel = ApiadviserViewModel(
    repository: ApiadvisorRepository(
      client: mock,
    ),
  );

  group("ApiadviserViewModel", () {
    test("error", () async {
      when(mock.get("http://localhost:3333/locate"))
          .thenThrow(Exception("Error"));

      await viewModel.fill();

      expect(viewModel.apiadvisorModel.value, null);
    });

    test("success", () async {
      when(mock.get("http://localhost:3333/locate")).thenAnswer((_) async => [
            ApiadvisorModel(
              country: "Ocara",
              text: "ok",
              date: "17/12/2021",
            ).toJson()
          ]);

      await viewModel.fill();

      expect(viewModel.apiadvisorModel.value, isA<ApiadvisorModel>());
    });
  });
}
