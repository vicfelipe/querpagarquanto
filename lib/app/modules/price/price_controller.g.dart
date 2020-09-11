// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PriceController on _PriceControllerBase, Store {
  final _$valueAtom = Atom(name: '_PriceControllerBase.value');

  @override
  int get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(int value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  final _$_PriceControllerBaseActionController =
      ActionController(name: '_PriceControllerBase');

  @override
  void increment() {
    final _$actionInfo = _$_PriceControllerBaseActionController.startAction(
        name: '_PriceControllerBase.increment');
    try {
      return super.increment();
    } finally {
      _$_PriceControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setValores(double valor, double taxa, int periodo) {
    final _$actionInfo = _$_PriceControllerBaseActionController.startAction(
        name: '_PriceControllerBase.setValores');
    try {
      return super.setValores(valor, taxa, periodo);
    } finally {
      _$_PriceControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic geraLista() {
    final _$actionInfo = _$_PriceControllerBaseActionController.startAction(
        name: '_PriceControllerBase.geraLista');
    try {
      return super.geraLista();
    } finally {
      _$_PriceControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value}
    ''';
  }
}
