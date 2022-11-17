// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginStore on _LoginStore, Store {
  late final _$isLoadingAtom =
      Atom(name: '_LoginStore.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$errorMessageAtom =
      Atom(name: '_LoginStore.errorMessage', context: context);

  @override
  String get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$formSignInAtom =
      Atom(name: '_LoginStore.formSignIn', context: context);

  @override
  SignInDto get formSignIn {
    _$formSignInAtom.reportRead();
    return super.formSignIn;
  }

  @override
  set formSignIn(SignInDto value) {
    _$formSignInAtom.reportWrite(value, super.formSignIn, () {
      super.formSignIn = value;
    });
  }

  late final _$isPasswordHiddenAtom =
      Atom(name: '_LoginStore.isPasswordHidden', context: context);

  @override
  bool get isPasswordHidden {
    _$isPasswordHiddenAtom.reportRead();
    return super.isPasswordHidden;
  }

  @override
  set isPasswordHidden(bool value) {
    _$isPasswordHiddenAtom.reportWrite(value, super.isPasswordHidden, () {
      super.isPasswordHidden = value;
    });
  }

  late final _$_LoginStoreActionController =
      ActionController(name: '_LoginStore', context: context);

  @override
  dynamic setLoading(bool value) {
    final _$actionInfo = _$_LoginStoreActionController.startAction(
        name: '_LoginStore.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$_LoginStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic _setErrorMessage(String value) {
    final _$actionInfo = _$_LoginStoreActionController.startAction(
        name: '_LoginStore._setErrorMessage');
    try {
      return super._setErrorMessage(value);
    } finally {
      _$_LoginStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setFormSignIn(SignInDto value) {
    final _$actionInfo = _$_LoginStoreActionController.startAction(
        name: '_LoginStore.setFormSignIn');
    try {
      return super.setFormSignIn(value);
    } finally {
      _$_LoginStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void togglePasswordVisibility() {
    final _$actionInfo = _$_LoginStoreActionController.startAction(
        name: '_LoginStore.togglePasswordVisibility');
    try {
      return super.togglePasswordVisibility();
    } finally {
      _$_LoginStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
errorMessage: ${errorMessage},
formSignIn: ${formSignIn},
isPasswordHidden: ${isPasswordHidden}
    ''';
  }
}
