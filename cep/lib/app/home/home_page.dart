import 'package:cep/app/home/search_cep_bloc.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final textController = TextEditingController();

  final searchCepBox = SearchCepBox();

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
                    searchCepBox.searchCep.add(textController.text);
                  },
                  child: Text("Pesquisar")),
              SizedBox(
                height: 20,
              ),
              StreamBuilder<SearchCepState>(
                  stream: searchCepBox.cepResult,
                  builder: (context, snapShot) {
                    if (!snapShot.hasData) {
                      return Container();
                    }

                    var state = snapShot.data;

                    if (state is SearchCepError) {
                      return Text(
                        state.message,
                        style: TextStyle(color: Colors.red),
                      );
                    }

                    if (state is SearchCepLoading) {
                      return Expanded(
                          child: Center(child: CircularProgressIndicator()));
                    }

                    state = state as SearchCepSuccess;

                    return Text("Cidade: ${state.data["localidade"]}");
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
