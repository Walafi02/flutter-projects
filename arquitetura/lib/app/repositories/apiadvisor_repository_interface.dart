import 'package:arquitetura/app/models/apiadvisor_model.dart';

abstract class IApiAdvisor {
  Future<ApiadvisorModel> getTime();
}
