class CurrencyMondel {
  final String name;
  final String real;
  final String dolar;
  final String euro;
  final String bitcoin;

  CurrencyMondel(
      {this.name = '',
      this.real = '',
      this.dolar = '',
      this.euro = '',
      this.bitcoin = ''});

  static List<CurrencyMondel> getCurrencies() {
    return <CurrencyMondel>[
      CurrencyMondel(
          name: "Real",
          real: "1.0",
          dolar: "0.18",
          euro: "0.15",
          bitcoin: "0.0000018"),
      CurrencyMondel(
          name: "Dolar",
          real: "5.52",
          dolar: "1.8",
          euro: "0.5",
          bitcoin: "0.000018"),
      CurrencyMondel(
          name: "Euro",
          real: "8.80",
          dolar: "1.6",
          euro: "1.0",
          bitcoin: "0.00010"),
      CurrencyMondel(
          name: "Bitcoin",
          real: "64116.4",
          dolar: "11111.5",
          euro: "8962.7",
          bitcoin: "1.0"),
    ];
  }
}
