import 'package:conversor_curso/app/controllers/home_controller.dart';
import 'package:conversor_curso/app/models/currency_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final TextEditingController toText = TextEditingController();
  final TextEditingController fromText = TextEditingController();

  final homeController = HomeController(toText: toText, fromText: fromText);
  test("Deve converter Real para Dolar com ponto", () {
    toText.text = '2.0';
    homeController.convert();
    expect(fromText.text, "0.36");
  });

  test("Deve converter Real para Dolar com virgula", () {
    toText.text = '2,0';
    homeController.convert();
    expect(fromText.text, "0.36");
  });

  test("Deve converter Dolar para Real", () {
    toText.text = '1.0';
    homeController.toCurrency = CurrencyMondel(
        name: "Dolar",
        real: "5.52",
        dolar: "1.8",
        euro: "0.5",
        bitcoin: "0.000018");
    homeController.fromCurrency = CurrencyMondel(
        name: "Real",
        real: "1.0",
        dolar: "0.18",
        euro: "0.15",
        bitcoin: "0.0000018");
    homeController.convert();
    expect(fromText.text, "5.52");
  });
}
