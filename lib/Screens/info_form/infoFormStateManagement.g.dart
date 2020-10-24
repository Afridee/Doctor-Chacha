// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'infoFormStateManagement.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$formStatesClass on formStates, Store {
  final _$maleAtom = Atom(name: 'formStates.male');

  @override
  bool get male {
    _$maleAtom.reportRead();
    return super.male;
  }

  @override
  set male(bool value) {
    _$maleAtom.reportWrite(value, super.male, () {
      super.male = value;
    });
  }

  final _$spinnerAtom = Atom(name: 'formStates.spinner');

  @override
  bool get spinner {
    _$spinnerAtom.reportRead();
    return super.spinner;
  }

  @override
  set spinner(bool value) {
    _$spinnerAtom.reportWrite(value, super.spinner, () {
      super.spinner = value;
    });
  }

  final _$formStatesActionController = ActionController(name: 'formStates');

  @override
  dynamic change_gender() {
    final _$actionInfo = _$formStatesActionController.startAction(
        name: 'formStates.change_gender');
    try {
      return super.change_gender();
    } finally {
      _$formStatesActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic showSpinner() {
    final _$actionInfo = _$formStatesActionController.startAction(
        name: 'formStates.showSpinner');
    try {
      return super.showSpinner();
    } finally {
      _$formStatesActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
male: ${male},
spinner: ${spinner}
    ''';
  }
}
