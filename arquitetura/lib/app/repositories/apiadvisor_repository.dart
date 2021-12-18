import 'package:arquitetura/app/interfaces/client_http_services_interfice.dart';
import 'package:arquitetura/app/models/apiadvisor_model.dart';
import 'package:arquitetura/app/repositories/apiadvisor_repository_interface.dart';

class ApiadvisorRepository implements IApiAdvisor {
  final IclientHttp client;

  ApiadvisorRepository({required this.client});

  @override
  Future<ApiadvisorModel> getTime() async {
    var json = await client.get("http://localhost:3333/locate");

    ApiadvisorModel model = ApiadvisorModel.fromJson(json[0]);

    return model;
  }
}
