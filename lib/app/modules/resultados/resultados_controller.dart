import 'package:mobx/mobx.dart';

part 'resultados_controller.g.dart';

class ResultadosController = _ResultadosControllerBase
    with _$ResultadosController;

abstract class _ResultadosControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
