import 'dart:math';

import 'package:mobx/mobx.dart';

part 'price_controller.g.dart';

class PriceController = _PriceControllerBase with _$PriceController;

abstract class _PriceControllerBase with Store {
  final String tipo;

  _PriceControllerBase({
    this.tipo,
  });

  @observable
  int value = 0;
  double pv = 0;
  int n = 0;
  double i = 0;
  double pmt = 0;
  List listaValores = [];

  @action
  void increment() {
    value++;
  }

  @action
  setValores(double valor, double taxa, int periodo) {
    this.pv = valor;
    this.n = periodo;
    this.i = taxa;

    this.pmt = this.pv *
        (((pow(1 + (this.i / 100), this.n)) * this.i / 100) /
            ((pow(1 + (this.i / 100), this.n)) - 1));

    geraLista();
  }

  @action
  geraLista() {
    double saldo = this.pv;
    double juros = 0;
    double amortizacao = 0;

    this.listaValores = [];
    this.listaValores.add([0, 0, 0, saldo]);

    for (var n = 0; n < this.n; n++) {
      juros = saldo * (this.i / 100);
      amortizacao = this.pmt - juros;
      saldo = saldo - amortizacao;
      this.listaValores.add([
        this.pmt.toStringAsFixed(2),
        juros.toStringAsFixed(2),
        amortizacao.toStringAsFixed(2),
        saldo.toStringAsFixed(2)
      ]);
    }
  }
}
