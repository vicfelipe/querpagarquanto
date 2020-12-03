// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sac_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SacController on _SacControllerBase, Store {
  final _$valueAtom = Atom(name: '_SacControllerBase.value');

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

  final _$_SacControllerBaseActionController =
      ActionController(name: '_SacControllerBase');

  @override
  void increment() {
    final _$actionInfo = _$_SacControllerBaseActionController.startAction(
        name: '_SacControllerBase.increment');
    try {
      return super.increment();
    } finally {
      _$_SacControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setValores(double valor, double taxa, int periodo) {
    final _$actionInfo = _$_SacControllerBaseActionController.startAction(
        name: '_SacControllerBase.setValores');
    try {
      return super.setValores(valor, taxa, periodo);
    } finally {
      _$_SacControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic geraLista() {
    final _$actionInfo = _$_SacControllerBaseActionController.startAction(
        name: '_SacControllerBase.geraLista');
    try {
      return super.geraLista();
    } finally {
      _$_SacControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value}
    ''';
  }
}
