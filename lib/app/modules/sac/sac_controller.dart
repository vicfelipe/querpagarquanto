import 'package:mobx/mobx.dart';

part 'sac_controller.g.dart';

class SacController = _SacControllerBase with _$SacController;

abstract class _SacControllerBase with Store {
  @observable
  int value = 0;
  double pv = 0;
  int n = 0;
  double i = 0;
  double amortizacao = 0;
  List listaValores = [];
  double pmt = 0;

  @action
  void increment() {
    value++;
  }

  @action
  setValores(double valor, double taxa, int periodo) {
    this.pv = valor;
    this.n = periodo;
    this.i = taxa;
    this.amortizacao = this.pv / this.n;

    geraLista();
  }

  @action
  geraLista() {
    double saldo = this.pv;
    double juros = 0;
    double parcela = 0;
    int n = 0;

    this.listaValores = [];
    this.listaValores.add([0, 0, 0, saldo]);

    do {
      juros = saldo * (this.i / 100);
      parcela = this.amortizacao + juros;
      if (n == 0) {
        this.pmt = parcela;
      }
      saldo = saldo - this.amortizacao;
      this.listaValores.add([
        parcela.toStringAsFixed(2),
        juros.toStringAsFixed(2),
        this.amortizacao.toStringAsFixed(2),
        saldo.toStringAsFixed(2)
      ]);
      n++;
    } while (n < this.n);
  }
}
