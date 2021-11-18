import 'package:conversor_curso/app/components/currency_box.dart';
import 'package:conversor_curso/app/controllers/home_controller.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  TextEditingController toText = TextEditingController();
  TextEditingController fromText = TextEditingController();
  late HomeController homeController;

  @override
  void initState() {
    super.initState();

    homeController = HomeController(toText: toText, fromText: fromText);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding:
                const EdgeInsets.only(top: 100, right: 30, left: 30, bottom: 20),
            child: Column(
              children: [
                Image.asset(
                  "assets/images/logo.png",
                  height: 200,
                  width: 200,
                ),
                SizedBox(
                  height: 10,
                ),
                CurrencyBox(
                  selectedItem: homeController.toCurrency,
                  controller: toText,
                  itens: homeController.currencies,
                  onChanged: (model) {
                    setState(() {
                      homeController.toCurrency =
                          model ?? homeController.currencies[0];
                    });
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                CurrencyBox(
                  selectedItem: homeController.fromCurrency,
                  controller: fromText,
                  itens: homeController.currencies,
                  onChanged: (model) {
                    setState(() {
                      homeController.fromCurrency =
                          model ?? homeController.currencies[0];
                    });
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                RaisedButton(
                  onPressed: () {
                    homeController.convert();
                    FocusScope.of(context).unfocus();
                  },
                  color: Colors.amber,
                  child: Text("CONVERTER"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
