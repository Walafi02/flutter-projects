import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final textController = TextEditingController();
  bool isLoading = false;
  String? error;
  var cepResult = {};

  Future<void> searchCepString(String cep) async {
    try {
      setState(() {
        isLoading = true;
      });
      final response = await Dio().get("https://viacep.com.br/ws/$cep/json/");

      setState(() {
        cepResult = response.data;
        error = null;
      });
    } catch (e) {
      setState(() {
        error = "Error na pesquisa";
        cepResult = {};
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      backgroundColor: Colors.white,
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                controller: textController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "CEP",
                ),
                onSubmitted: (value) {
                  print(value);
                },
              ),
              SizedBox(height: 10),
              ElevatedButton(
                  onPressed: () {
                    searchCepString(textController.text);
                  },
                  child: Text("Pesquisar")),
              SizedBox(
                height: 20,
              ),
              if (isLoading)
                Expanded(child: Center(child: CircularProgressIndicator())),
              if (error != null)
                Text(
                  error ?? '',
                  style: TextStyle(color: Colors.red),
                ),
              if (!isLoading && cepResult.isNotEmpty)
                Text("Cidade: ${cepResult["localidade"]}")
            ],
          ),
        ),
      ),
    );
  }
}
