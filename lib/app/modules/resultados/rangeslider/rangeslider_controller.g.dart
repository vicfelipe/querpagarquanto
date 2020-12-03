// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rangeslider_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RangesliderController on _RangesliderControllerBase, Store {
  final _$valueAtom = Atom(name: '_RangesliderControllerBase.value');

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

  final _$_RangesliderControllerBaseActionController =
      ActionController(name: '_RangesliderControllerBase');

  @override
  void increment() {
    final _$actionInfo = _$_RangesliderControllerBaseActionController
        .startAction(name: '_RangesliderControllerBase.increment');
    try {
      return super.increment();
    } finally {
      _$_RangesliderControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value}
    ''';
  }
}
