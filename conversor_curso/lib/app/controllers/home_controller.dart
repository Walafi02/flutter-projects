import 'package:conversor_curso/app/models/currency_model.dart';
import 'package:flutter/cupertino.dart';

class HomeController {
  late List<CurrencyMondel> currencies;
  late CurrencyMondel toCurrency;
  late CurrencyMondel fromCurrency;

  final TextEditingController toText;
  final TextEditingController fromText;

  HomeController({required this.toText, required this.fromText}) {
    currencies = CurrencyMondel.getCurrencies();
    toCurrency = currencies[0];
    fromCurrency = currencies[1];
  }

  void convert() {
    String text = toText.text;
    double value = double.tryParse(text.replaceAll(",", ".")) ?? 1.0;

    double returnValue = 0;

    if (fromCurrency.name == "Real") {
      returnValue = value * double.parse(toCurrency.real);
    } else if (fromCurrency.name == "Dolar") {
      returnValue = value * double.parse(toCurrency.dolar);
    } else if (fromCurrency.name == "Euro") {
      returnValue = value * double.parse(toCurrency.euro);
    } else if (fromCurrency.name == "Bitcoin") {
      returnValue = value * double.parse(toCurrency.bitcoin);
    }

    fromText.text = returnValue.toStringAsFixed(2);
  }
}
