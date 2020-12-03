import 'package:mobx/mobx.dart';

part 'rangeslider_controller.g.dart';

class RangesliderController = _RangesliderControllerBase
    with _$RangesliderController;

abstract class _RangesliderControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
