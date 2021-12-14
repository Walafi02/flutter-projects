import 'package:arquitetura/app/models/apiadvisor_model.dart';
import 'package:arquitetura/app/pages/home/home_controller.dart';
import 'package:arquitetura/app/repositories/apiadvisor_repository.dart';
import 'package:arquitetura/app/services/client_http_service.dart';
import 'package:arquitetura/app/viewmodels/apiadvisor_viewmodel.dart';
import 'package:flutter/material.dart';
import 'components/custon_switch_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController(
    viewModel: ApiadviserViewModel(
      repository: ApiadvisorRepository(
        client: ClientHttpServices(),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.getTime();
        },
        child: Icon(Icons.get_app),
      ),
      body: Center(
        child: Column(
          children: [
            CustonSwitchWidget(),
            ValueListenableBuilder<ApiadvisorModel?>(
              valueListenable: controller.time,
              builder: (context, model, child) {
                if (model?.text == null) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                return Text(model?.text ?? "");
              },
            )
          ],
        ),
      ),
    );
  }
}
